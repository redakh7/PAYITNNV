import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/generated/l10n.dart';
import 'package:m_wallet_hps/screens/LoginScreen.dart';
import 'package:m_wallet_hps/shared/component.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../shared/SideMenu.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: ((context, state) {
      if (state is LoadLoggedInUserErrorStates) {
        navigateAndFinish(context, LoginScreen());
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
      drawer: SideMenu(),
      appBar: AppBar(
          title: index == 0
              ? Padding(
                  padding: const EdgeInsets.only(left: 78.0),
                  child: Text(
                    S.of(context).acceuil,
                  ),
                )
              : index == 1
                  ? Padding(
                      padding: const EdgeInsets.only(left: 78.0),
                      child: Text(
                        S.of(context).payment,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 78.0),
                      child: Text(
                        S.of(context).top_up,
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
              title: Text("Accueil"),
              selectedColor: Color(0xff4c91bc),
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.currency_exchange_sharp),
              title: Text("Transfert"),
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
