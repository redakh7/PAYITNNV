import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/screens/ResetPassword.dart';
import 'package:m_wallet_hps/screens/Routes/CustomPageRouteRight.dart';
import 'package:m_wallet_hps/screens/Routes/custom_page_route.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../cubit/app_cubit.dart';
import 'AcccueilScreen.dart';
import 'home_page.dart';

class QRCODE extends StatefulWidget {
  static String id = "My QR COde";
  @override
  State<StatefulWidget> createState() {
    return _QRCODEState();
  }
}

class _QRCODEState extends State<QRCODE> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton (
            icon: Icon(Icons.arrow_back),
            onPressed: () {Navigator.of(context).push(CustomPageRouteRight(
                child:HomePage()),
            );
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(left:78.0),
            child: const Text(
              'My QR Code',
              style: TextStyle(
                  color: Colors.white),
            ),
          ),
          backgroundColor:  Color(0xff4c91bc),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              PrettyQr(
                elementColor: Color(0xff4c91bc),
                  image: AssetImage('images/Payit.png'),
                  size: 250,
                  data: "${AppCubit.get(context).userModel?.data.phoneNumber}",
                  errorCorrectLevel: QrErrorCorrectLevel.M,

                ),
              SizedBox(height: 120,),
              Text('Ce QR code respecte les spécifications MarocPay'),


            ],

          ),
        ),
    ));
  }
}
