import 'package:flutter/material.dart';
import 'package:m_wallet_hps/screens/ResetPasswordScreen.dart';
import 'package:m_wallet_hps/screens/Routes/custom_page_route.dart';

import 'HomeScreen.dart';
import 'QrCodeScreen.dart';
import 'Routes/CustomPageRouteRight.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRouteRight(child: HomeScreen()),
              );
            },
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 78.0),
              child: const Text(
                'SETTINGS',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          backgroundColor: Color(0xff4c91bc),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.4,
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
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRouteLeft(child: ResetPasswordScreen()));
              },
              child: const Text('Change your password ',
                  textAlign: TextAlign.left),
            ),
            Divider(
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
            ),
            Divider(
              color: Colors.black,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.fromLTRB(20, 20, 112, 20),
                primary: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRouteLeft(child: QrCodeScreen()));
              },
              child: const Text('Change Email                   ',
                  textAlign: TextAlign.left),
            ),
          ],
        ),
      ),
    );
  }
}
