import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:m_wallet_hps/generated/l10n.dart';
import 'package:m_wallet_hps/models/userModel.dart';
import 'package:m_wallet_hps/screens/ResetPasswordScreen.dart';
import '../cubit/app_cubit.dart';
import '../network/local/cache_helper.dart';
import 'QrCodeScanner.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'QrCodeScreen.dart';
import 'Routes/CustomPageRouteRight.dart';
import 'Routes/custom_page_route.dart';
import 'FormulaireTransfert.dart';

class TransfertRoute extends StatelessWidget {
  const TransfertRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = AppCubit.get(context).userModel;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRouteRight(child: HomeScreen()),
              );
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 78.0),
            child: const Text(
              'Transfer Route',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color(0xff4c91bc),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // user cards
              SizedBox(
                height: 120,
              ),

              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CustomPageRouteLeft(child: QrCodeScanner()),
                          (route) => false);
                    },
                    icons: CupertinoIcons.person, 
                    iconStyle: IconStyle(
                      backgroundColor: Color(0xff4c91bc),
                    ),
                    title: S.of(context).receive_money,
                    subtitle: S.of(context).scan_qr_code
                         ),
                  SettingsItem(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CustomPageRouteLeft(child: FormulaireTransfert()),
                          (route) => false);
                    },
                    icons: Icons.admin_panel_settings,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color(0xff4c91bc),
                    ),
                    title: S.of(context).send_money,
                  ),
                ],
              ),

              // You can add a settings title
            ],
          ),
        ),
      ),
    );
  }
}
