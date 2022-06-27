import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:m_wallet_hps/screens/LoginScreen.dart';
import 'package:m_wallet_hps/screens/ResetPasswordScreen.dart';
import 'package:m_wallet_hps/shared/component.dart';

import 'Routes/custom_page_route.dart';

class SettingsScreen extends StatelessWidget {
  static String id = "SignupScreen1";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();



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
              backgroundColor: Color(0xff4c91bc),
              title: Row(children: <Widget>[
                Text(
                  "  Settings",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                )
              ])),
          backgroundColor: Color(0xff4c91bc),
          body: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 62),
            child: Form(
              key: formkey,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Container(
                    width: 320,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: Size.fromHeight(49),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            backgroundColor: Color(0xff4c91bc),

                          ),
                          onPressed: (){Navigator.of(context).push(
                            CustomPageRouteLeft(child: ResetPasswordScreen()),
                          );},
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.lock,color: Colors.white,),
                              Expanded(
                                child: Text(
                                  '    Reset Password',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: Size.fromHeight(49),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            backgroundColor: Color(0xff4c91bc),

                          ),
                          onPressed: (){Navigator.of(context).push(
                            CustomPageRouteLeft(child: ResetPasswordScreen()),
                          );},
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.email,color: Colors.white,),
                              Expanded(
                                child: Text(
                                  '    Change Email',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: Size.fromHeight(49),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            backgroundColor: Color(0xff4c91bc),

                          ),
                          onPressed: (){Navigator.of(context).push(
                            CustomPageRouteLeft(child: ResetPasswordScreen()),
                          );},
                          child: Row(
                            children: const <Widget>[
                              Icon(Icons.language,color: Colors.white,),
                              Expanded(
                                child: Text(
                                  '    Change language',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: Size.fromHeight(49),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            backgroundColor: Color(0xff4c91bc),

                          ),
                          onPressed: (){
                            AppCubit.get(context).removeFcmToken(CacheHelper.removeData(key: 'email'));
                            CacheHelper.removeData(key: 'token');
                            CacheHelper.removeData(key: 'email');

                            Navigator.pushAndRemoveUntil(
                           context, CustomPageRouteLeft(child: LoginScreen()),(route)=>false
                          );
                            AppCubit.get(context).currentIndex=0;
                            },
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.logout,color: Colors.white,),
                              Expanded(
                                child: Text(
                                  '    Logout',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
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

    );



  }

}
