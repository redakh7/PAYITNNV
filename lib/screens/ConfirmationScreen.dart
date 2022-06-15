import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/screens/login_page.dart';
import 'package:m_wallet_hps/shared/buttons.dart';
import 'package:m_wallet_hps/shared/component.dart';
import 'package:open_mail_app/open_mail_app.dart';

void main() => runApp(ConfitmationScreen());

class ConfitmationScreen extends StatefulWidget {
  const ConfitmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfitmationScreen> createState() => _ConfitmationScreenState();
}

class _ConfitmationScreenState extends State<ConfitmationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.blue),
            leading: IconButton(
              icon: const Icon(
                Icons.navigate_before,
                size: 40,
              ),
              onPressed: () {
                navigateAndFinish(context, LoginPage());
              }
            ),
          ),
          body: Center(
              child: SingleChildScrollView(
                child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/emailsend.png'),
                  )),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Confirm your email address',
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  'We sent a confirmation email to  ',
                  style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                 "${AppCubit.get(context).email}",
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  'check your email and click on the \n      confirmation link to continue. ',
                  style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Colors.blueGrey),
                ),
                SizedBox(height: 40,),
                ButtonTest(
                  text: "Open Email App",
                  function: () async {

                    var result = await OpenMailApp.openMailApp(
                      nativePickerTitle: 'Select email app to open',
                    );

                    // If no mail apps found, show error
                    if (!result.didOpen && !result.canOpen) {
                      showNoMailAppsDialog(context);

                      // iOS: if multiple mail apps found, show dialog to select.
                      // There is no native intent/default app system in iOS so
                      // you have to do it yourself.
                    } else if (!result.didOpen && result.canOpen) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return MailAppPickerDialog(
                            mailApps: result.options,
                          );
                        },
                      );
                    }
                  },
                ),
            ],
          ),
              )),
        ),
      ),
    );
  }
}
