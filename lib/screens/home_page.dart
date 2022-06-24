import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/screens/NavBar.dart';
import 'package:m_wallet_hps/screens/login_page.dart';
import 'package:m_wallet_hps/shared/component.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatelessWidget {
  static String id = "HomeScreen";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: ((context, state) {
      if (state is LoadLoggedInUserErrorStates) {
        navigateAndFinish(context, LoginPage());
        showToast(message: "error");
      }
    }), builder: ((context, state) {
      return Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              AppCubit.get(context).userModel != null,
          widgetBuilder: (context) =>
              builderWidget(context, AppCubit.get(context).currentIndex),
          fallbackBuilder: (context) => Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.green, color: Colors.red),
                ),
              ));
    }));
  }

  Widget builderWidget(context, index) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
          title: index == 0
              ? Padding(
                padding: const EdgeInsets.only(left:78.0),
                child: Text(
                    "Acceuil",
                  ),
              )
              : index == 1
                  ? Padding(
            padding: const EdgeInsets.only(left:78.0),
                    child: Text(
                        "Virement",
                      ),
                  )
                  : Padding(
            padding: const EdgeInsets.only(left:78.0),
                    child: Text(
                        "Alimentation",

                      ),
                  ),
          backgroundColor: Color(0xff4c91bc)),
      backgroundColor: Colors.white,
      body: AppCubit.get(context)
          .bottomScreens[AppCubit.get(context).currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SalomonBottomBar(
          currentIndex: AppCubit.get(context).currentIndex,
          onTap: (index) {
            AppCubit.get(context).changeBottom(index);
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Color(0xff4c91bc),
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.currency_exchange_sharp),
              title: Text("transfer"),
              selectedColor: Color(0xff4c91bc),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.wallet_giftcard),
              title: Text("Alimentation"),
              selectedColor: Color(0xff4c91bc),
            ),
          ],
        ),
      ),
    );
  }
}
