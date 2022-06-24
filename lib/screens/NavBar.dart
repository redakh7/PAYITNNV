import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/screens/Parametres.dart';
import 'package:m_wallet_hps/screens/QRCODE.dart';
import 'package:m_wallet_hps/screens/Routes/custom_page_route.dart';
import 'package:m_wallet_hps/screens/Account.dart';
import 'package:m_wallet_hps/screens/profile_page.dart';

import '../cubit/app_cubit.dart';
import '../models/userModel.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel? userModel = AppCubit.get(context).userModel;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 220,
            child: Container(
              child: UserAccountsDrawerHeader(
                accountName: Text( "${userModel?.data.phoneNumber}",style: TextStyle(fontSize: 18),),
                accountEmail: Text(""),
                currentAccountPicture: CircleAvatar(),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.blueGrey,

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xff4c91bc),
                size: 32,
              ),
              title: Text(
                'Home',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () {


              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: ListTile(
              leading: Icon(
                Icons.qr_code,
                color: Color(0xff4c91bc),
                size: 32,
              ),
              title: Text(
                'My QR Code',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(CustomPageRouteLeft(
                    child:QRCODE()));
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: ListTile(
              leading: Icon(
                Icons.account_balance_wallet_rounded,
                color: Color(0xff4c91bc),
                size: 32,
              ),
              title: Text(
                'My account',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(CustomPageRouteLeft(
                    child:NewProfilePage()),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: ListTile(
              leading: Icon(
                Icons.notifications_active,
                color: Color(0xff4c91bc),
                size: 32,
              ),
              title: Text(
                'Notifications',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: ListTile(
              leading: Icon(
                Icons.history,
                color: Color(0xff4c91bc),
                size: 32,
              ),
              title: Text(
                'My history',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () => null,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8.9,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Color(0xff4c91bc),
                size: 32,
              ),
              title: Text(
                'Settings',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(CustomPageRouteLeft(
                    child:Settings1()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: ListTile(
              title: Text(
                'Exit',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.redAccent,
                size: 32,
              ),
              onTap: () => null,
            ),
          ),
        ],
      ),
    );
  }
}
