import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/screens/Routes/CustomPageRouteRight.dart';
import 'package:m_wallet_hps/screens/SettingsScreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResetPasswordScreenState();
  }
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  static String id = "Reset Password";
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRouteRight(child: SettingsScreen()),
              );
            },
          ),
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 68.0),
            child: Text(
              'Réinitialiser mot de passe',
            ),
          )),
          backgroundColor: Color(0xff4c91bc),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Container(
              height: 550,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.4,
                  )),
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  width: 280,
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Créer un nouveau mot de passe',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Votre nouveau mot de passe doit être différent des mots de passe utilisés précédemment.',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Ancien mot de passe',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(

                          controller: oldPassword,
                          cursorColor: Colors.green,
                          cursorHeight: 19,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "le mot de passe ne doit pas être vide";
                            }
                            return null;
                          },
                          style: GoogleFonts.manrope(
                            height: 0.7,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Color(0xff4c91bc),
                            ),
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
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 0.3,
                          color: Colors.grey,
                        ),
                        Text(
                          'Nouveau mot de passe',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: newPassword,
                          cursorColor: Colors.green,
                          cursorHeight: 19,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "le mot de passe ne doit pas être vide";
                            }
                            return null;
                          },
                          style: GoogleFonts.manrope(
                            height: 0.7,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Color(0xff4c91bc),
                            ),
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
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 0.3,
                          color: Colors.grey,
                        ),
                        Text(
                          'Confirmation',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: confirmPassword,
                          cursorColor: Colors.green,
                          cursorHeight: 19,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "le mot de passe ne doit pas être vide";
                            }
                            return null;
                          },
                          style: GoogleFonts.manrope(
                            height: 0.7,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                              color:Color(0xff4c91bc),
                            ),
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
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: RaisedButton(
                            onPressed: () {},
                            textColor: Color(0xffFFFFFF),
                            padding: EdgeInsets.all(0),
                            shape: StadiumBorder(),
                            child: Container(
                              width: 225,
                              height: 55,
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
                                'VALIDER',
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
