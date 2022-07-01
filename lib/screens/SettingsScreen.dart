import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:m_wallet_hps/models/userModel.dart';
import 'package:m_wallet_hps/screens/ResetPasswordScreen.dart';
import '../cubit/app_cubit.dart';
import '../network/local/cache_helper.dart';
import '../shared/constantes.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'Routes/CustomPageRouteRight.dart';
import 'Routes/custom_page_route.dart';
import 'FormulaireTransfert.dart';

class SettingsScreen extends StatelessWidget {

  const SettingsScreen({Key? key}) : super(key: key);

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
              'Paramètres',
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
              SizedBox(height: 120,),

              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () { Navigator.pushAndRemoveUntil(
                        context, CustomPageRouteLeft(child: ResetPasswordScreen()),(route)=>false
                    );},
                    icons: CupertinoIcons.lock,
                    iconStyle: IconStyle(
                      backgroundColor: Color(0xff4c91bc),),
                    title: 'réinitialiser mot de passe',
                    subtitle: "**********",
                  ),
                  SettingsItem(
                    onTap: () {Navigator.pushAndRemoveUntil(
                        context, CustomPageRouteLeft(child: QRcodeScanner()),(route)=>false
                    );},
                    icons: Icons.alternate_email_sharp,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color(0xff4c91bc),
                    ),
                    title: 'Changer Email ',
                    subtitle: "${userModel?.data.email.toUpperCase()}",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color(0xff4c91bc),
                    ),
                    title: 'Mode Nuit ',
                    subtitle: "English",
                    trailing: Switch.adaptive(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.language,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color(0xff4c91bc),
                    ),
                    title: 'Changer La Langue ',
                    subtitle: "Francais",

                  ),
                ],
              ),
              SizedBox(height: 42),
              // You can add a settings title
              SettingsItem(
                    onTap: () { AppCubit.get(context).removeFcmToken(CacheHelper.removeData(key: 'email'));
                    CacheHelper.removeData(key: 'token');
                    CacheHelper.removeData(key: 'email');

                    Navigator.pushAndRemoveUntil(
                        context, CustomPageRouteLeft(child: LoginScreen()),(route)=>false
                    );
                    AppCubit.get(context).currentIndex=0;},
                    icons: Icons.exit_to_app_rounded,
                    title: "déconnexion",
                  ),
            ],
          ),
        ),
      ),
    );
  }
}