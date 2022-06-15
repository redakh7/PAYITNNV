import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:m_wallet_hps/screens/ConfirmationScreen.dart';
import 'package:m_wallet_hps/screens/signupPage2.dart';
import 'package:m_wallet_hps/shared/component.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

class SignupPage extends StatefulWidget {
  static String id = "SignupScreen";

  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final jobRoleCtrl = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  var swiftController = DropdownEditingController<String>();
  bool _isObscure = true;
  var passwordController = TextEditingController();

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSigninSuccessStates) {
          showToast(message: "registrated");
          CacheHelper.saveData(key: 'swift', value: state.swift);
          navigateAndFinish(context, const ConfitmationScreen());
        } else if (state is AppLoginErrorStates) {
          showToast(message: state.error);
        }
      },
      builder: (context, state) => Scaffold(
        body: Form(
          key: _formkey,
          child: ListView(
            padding: const EdgeInsets.only(left: 55, right: 55, top: 120),
            physics: const BouncingScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Let\'s Get Started!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('create an account to make life easier',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the Email must not be empty";
                          }
                          return null;
                        },
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.alternate_email,
                            color: Colors.green,
                          ),
                          hintText: 'Email',
                          fillColor: const Color(0xff243656),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.green, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.green, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 22),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the Password must not be empty";
                          }
                          return null;
                        },
                        controller: passwordController,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon:Icon(Icons.password_outlined,color:Colors.green ,) ,
                          suffixIcon: IconButton(


                            icon: Icon(

                              _isObscure ? Icons.visibility : Icons.visibility_off,
                              color: _isObscure ?  Colors.green :Colors.grey ,

                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          fillColor:  const Color(0xff243656),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.green, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextDropdownFormField(

                      controller: swiftController,


                      options: const ["cih", "attijari", "sgma"],
                      decoration: InputDecoration(

                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                          labelText: "BANK"),
                      dropdownHeight: 120,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff1546A0).withOpacity(0.5),
                            offset: const Offset(0, 24),
                            blurRadius: 50,
                            spreadRadius: -18,
                          ),
                        ],
                      ),
                      child: RaisedButton(
                        onPressed: () {

                          if (_formkey.currentState!.validate()) {

                            AppCubit.get(context).email = emailController.text;
                            AppCubit.get(context).password =
                                passwordController.text;

                            CacheHelper.saveData(
                                key: 'swift', value: swiftController.value!);
                            AppCubit.get(context).changeStep(AppCubit.get(context).currentStep);
                         //   navigateTo(context, const SignupPage2());
                          }
                        },
                        textColor: const Color(0xffFFFFFF),
                        padding: const EdgeInsets.all(0),
                        shape: const StadiumBorder(),
                        child: Container(
                          width: 275,
                          height: 65,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.green,
                                Color(0xff1546A0),
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'NEXT',
                                style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              const Icon(Icons.navigate_next)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
