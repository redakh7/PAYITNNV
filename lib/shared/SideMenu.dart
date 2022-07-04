import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/generated/l10n.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:m_wallet_hps/screens/AccountScreen.dart';
import 'package:m_wallet_hps/screens/LoginScreen.dart';
import 'package:m_wallet_hps/screens/QrCodeScreen.dart';
import 'package:m_wallet_hps/screens/Routes/custom_page_route.dart';
import 'package:m_wallet_hps/screens/SettingsScreen.dart';
import '../cubit/app_cubit.dart';
import '../models/userModel.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel? userModel = AppCubit.get(context).userModel;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(

            child: Container(
              child: UserAccountsDrawerHeader(
                arrowColor: Colors.white60,
                accountName: IntrinsicHeight(
                  child: Container(
                    height: 50,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Container(
                         height: 80,
                         width: 80,
                         child: FittedBox(fit: BoxFit.cover,
                          child: Icon(Icons.person_outline,color: Colors.white60),
                         ),
                       ),
                        SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                            Text(
                              S.of(context).hello,
                              style: TextStyle(fontSize: 18,color: Colors.white60),
                            ),
                            Text(
                              "${userModel?.data.lastName.toUpperCase()}!",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
           accountEmail: Text(""),


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
                S.of(context).home,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () {},
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
                S.of(context).my_qr_code,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(CustomPageRouteLeft(child: QrCodeScreen()));
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
                S.of(context).my_account,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  CustomPageRouteLeft(child: AccountScreen()),
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
                S.of(context).notifications,
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
                S.of(context).my_history,
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
                S.of(context).settings,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  CustomPageRouteLeft(child: SettingsScreen()),
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
                S.of(context).logout,
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
              onTap: (){
                AppCubit.get(context).removeFcmToken(CacheHelper.removeData(key: 'email'));
                CacheHelper.removeData(key: 'token');
                CacheHelper.removeData(key: 'email');

                Navigator.pushAndRemoveUntil(
                    context, CustomPageRouteLeft(child: LoginScreen()),(route)=>false
                );
                AppCubit.get(context).currentIndex=0;
              },
            ),
          ),
        ],
      ),
    );
  }
}
