import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/models/userModel.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'HomeScreen.dart';
import 'Routes/CustomPageRouteRight.dart';

class AccountScreen extends StatelessWidget {
  static String id = "ACCOUNT";

  @override
  Widget build(BuildContext context) {
    String swift = CacheHelper.getData(key: 'swift');
    UserModel? userModel = AppCubit.get(context).userModel;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).push(
                      CustomPageRouteRight(child: HomeScreen()),
                    );
                  },
                ),
                backgroundColor: Color(0xff4c91bc),
                elevation: 2,
                actions: [],
                title: Padding(
                  padding: const EdgeInsets.only(left: 78.0),
                  child: Text(
                    'Mon Compte',
                  ),
                ),
              ),
              body: Column(
                children: [
                  SizedBox(height: 25,),
                  Container(
                    color: Color(0xff4c91bc),
                    child: Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Column(
                            children: [
                              Icon(Icons.person_outline,color: Colors.white60,size: 120,),
                              Text(
                                "${userModel?.data.solde} DH",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'avenir'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        RowBuilder(
                            att: "Nom",
                            text: "${userModel?.data.firstName.toUpperCase()}"),
                        SizedBox(
                          height: 25,
                        ),
                        RowBuilder(
                            att: "Prenom",
                            text: "${userModel?.data.lastName.toUpperCase()}"),
                        SizedBox(
                          height: 25,
                        ),
                        RowBuilder(
                            att: "E-mail",
                            text: "${userModel?.data.email.toUpperCase()}"),
                        SizedBox(
                          height: 25,
                        ),
                        RowBuilder(
                            att: "Numéro de téléphone",
                            text: "${userModel?.data.phoneNumber}"),
                        SizedBox(
                          height: 25,
                        ),
                        RowBuilder(att: "Banque", text: swift.toUpperCase()),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Dernières opérations ',
                              style: TextStyle(fontSize: 17),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Ink(
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('HISTORIQUE', style: TextStyle(
                                        color: Color(0xff4c91bc),
                                      ),), // <-- Text
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon( // <-- Icon
                                        Icons.arrow_forward_sharp,
                                        size: 24.0,
                                        color: Color(0xff4c91bc),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}

Widget RowBuilder({
  required String text,
  required String att,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 15, right: 15),
    child: Container(
      height: 35,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            att,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'avenir'),
          ),
          Spacer(),
          Text(
            text,
            style: GoogleFonts.pragatiNarrow(
              letterSpacing: 0.5,
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    ),
  );
}
