import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/screens/ResetPassword.dart';
import 'package:m_wallet_hps/screens/Routes/custom_page_route.dart';

import 'QRCODE.dart';
import 'Routes/CustomPageRouteRight.dart';
import 'home_page.dart';

class Settings1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton (
                icon: Icon(Icons.arrow_back),
                onPressed: () {Navigator.of(context).push(CustomPageRouteRight(
                    child:HomePage()),
                );
                },
              ),
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right:78.0),
                child: const Text(
                  'SETTINGS',
                  style: TextStyle(
                      color: Colors.white),
                ),
              ),
            ),
            backgroundColor:  Color(0xff4c91bc),
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                height: MediaQuery.of(context).size.height/4.4,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.blueGrey,

                    ],
                  ),
                ),
              ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 20, 112, 20),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () { Navigator.of(context).push(CustomPageRouteLeft(
                      child:ResetPassword()));
                      },
                  child: const Text('Change your password ',textAlign: TextAlign.left),
                ), Divider(
                color: Colors.black,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(20, 20, 112, 20),
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Change language           '),
              ),Divider(
                color: Colors.black,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(20, 20, 112, 20),
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () { Navigator.of(context).push(CustomPageRouteLeft(
                    child:QRCODE()));
                },
                child: const Text('Change Email                   ',textAlign: TextAlign.left),
              ),

            ],
          ),
        ),
    );

  }
}
