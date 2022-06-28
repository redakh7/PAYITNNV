import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/screens/signup/OtpScreen.dart';
import 'package:m_wallet_hps/shared/component.dart';
import '../Routes/custom_page_route.dart';

class SignupScreen1 extends StatelessWidget {
  static String id = "SignupScreen1";

  const SignupScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    var phonenumberController = TextEditingController();

    var cinController = TextEditingController();
 bool? verifyCin;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSendOtpSuccessState) {
          showToast(message: state.message);
        }
      },
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.blueGrey,
              title: Row(children: <Widget>[
                Text(
                  "  Ativation",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                )
              ])),


          body: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 22),
            child: Form(
              key: formkey,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 55, right: 55, top: 70, bottom: 30),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'STEP 1 : Identification ',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Enter your phone number and your CIN ',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Focus(
                              canRequestFocus: false,
                              onFocusChange: (hasfocus){
                              if(!hasfocus){
                                AppCubit.get(context).verifyphone(phonenumberController.text);

                              }
                              },
                              child: TextFormField(

                                keyboardType: TextInputType.phone,
                                controller: phonenumberController,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "the Phone number must not be empty";
                                  }else  if(AppCubit.get(context).verifiedphone == true){
                                    return "phone Number Already Exist";
                                  }else
                                  return null;
                                },
                                onEditingComplete: (){
                                  FocusScope.of(context).nextFocus();
                                },
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.green,
                                  ),
                                  hintText: 'Phone number ',
                                  fillColor: const Color(0xff243656),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 2.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 22),
                            child: Focus(
                              canRequestFocus: false,
                              onFocusChange:(hasfocus){
                                if(!hasfocus){
                                  print(hasfocus);
                                  print("focuuuuuuuuuuuuuus");
                               AppCubit.get(context).verifycin(cinController.text) ;

                                }
                              },
                              child: TextFormField(
                                controller: cinController,
                                onFieldSubmitted: (value){
                          AppCubit.get(context).verifycin(value);
                          },
                                onEditingComplete: (){
                               FocusScope.of(context).nextFocus();
                                },
                                validator: (value)  {



                                  if (value!.isEmpty) {

                                    return "the CIN must not be empty";
                                  } else if(AppCubit.get(context).verifiedcin == true)
                                  {
                                    return "Cin Already Exist";
                                  }
                                  else
                                  return null;
                                },
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'CIN',
                                  fillColor: const Color(0xff243656),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'By continuing, you agree to the terms and conditions of use ',
                              style: GoogleFonts.manrope(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 170,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff1546A0).withOpacity(0.5),
                                  offset: const Offset(0, 24),
                                  blurRadius: 50,
                                  spreadRadius: -18,
                                ),
                              ],
                            ),
                            child: RaisedButton(
                              onPressed: () async{

                                if (formkey.currentState!.validate()) {


                                  print(phonenumberController.text);
                                  print(cinController.text);
                                  AppCubit.get(context)
                                      .sendOtp(phonenumberController.text);
                                  Navigator.of(context)
                                      .push(CustomPageRouteLeft(child: OTP()));


                                  AppCubit.get(context).phone_number =
                                      phonenumberController.text;
                                  AppCubit.get(context).cin =
                                      cinController.text;
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
