import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:m_wallet_hps/screens/ConfirmationScreen.dart';
import 'package:m_wallet_hps/screens/SignUp1/SignUp1.dart';
import 'package:m_wallet_hps/screens/SignUp3.dart';
import 'package:m_wallet_hps/shared/component.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2({Key? key}) : super(key: key);

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}
class _SignupPage2State extends State<SignupPage2> {
  final formkey = GlobalKey<FormState>();
  var firstnameController = TextEditingController();

  var lastnameController = TextEditingController();
  var usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

// List of items in our dropdown menu

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSigninSuccessStates) {
          showToast(message: "registrated");
          CacheHelper.saveData(key: 'swift', value: state.swift);
          AppCubit.get(context).changeStep(AppCubit.get(context).currentStep);
         navigateAndFinish(context, const ConfitmationScreen());
        } else if (state is AppLoginErrorStates) {
          showToast(message: state.error);
        }
      },
      builder: (context, state) => Scaffold(
        body:ListView(
          padding: EdgeInsets.only(left: 55, right: 55, top: 120),
          physics: BouncingScrollPhysics(),
          children: [
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,)),
                  SizedBox(height: 10,),
                  Text('', style: TextStyle(fontSize: 15,)),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text('STEP 2',
                      style: TextStyle(
                        fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green,

                      )),
                  Container(

                    margin: EdgeInsets.only(top: 22),
                    child: TextFormField(
                      controller: firstnameController,
                      validator: (value)  {
                        if (value!.isEmpty) {
                          return "the First name must not be empty";
                        }
                        return null;
                      },
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(

                        hintText: 'First name',
                        fillColor:  Color(0xff243656),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.green, width: 2.0),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                          borderSide: const BorderSide(color: Colors.green, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 22),
                    child: TextFormField(
                      controller: lastnameController,
                      validator: (value)  {
                        if (value!.isEmpty) {
                          return "the Last name must not be empty";
                        }
                        return null;
                      },
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Last name',
                        fillColor:  Color(0xff243656),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.green, width: 2.0),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                          borderSide: const BorderSide(color: Colors.green, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    controller: usernameController,
                    validator: (value)  {
                      if (value!.isEmpty) {
                        return "the EMAIL name must not be empty";
                      }
                      return null;
                    },
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(

                      hintText: 'Email',
                      fillColor:  Color(0xff243656),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.green, width: 2.0),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                        borderSide: const BorderSide(color: Colors.green, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff1546A0).withOpacity(0.5),
                          offset: Offset(0, 24),
                          blurRadius: 50,
                          spreadRadius: -18,
                        ),
                      ],
                    ),

                    child: RaisedButton(
                      onPressed: () {
                        if(formkey.currentState!.validate()){
                        }
                        navigateTo(context, SignupPage3());
                      },
                      textColor: Color(0xffFFFFFF),
                      padding: EdgeInsets.all(0),
                      shape: StadiumBorder(),
                      child: Container(
                        width:  275,
                        height: 65,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.green,
                              Color(0xff1546A0),
                            ],
                          ),
                        ),
                        child: Text(
                          'NEXT',
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
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
    );
  }
}

