import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/screens/AccueilScreen.dart';
import 'package:m_wallet_hps/screens/SettingsScreen.dart';
import 'package:m_wallet_hps/screens/TransfertRoute.dart';
import 'package:m_wallet_hps/shared/SideMenu.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';

import '../shared/PopUp.dart';
import 'HomeScreen.dart';
import 'Routes/CustomPageRouteRight.dart';
import 'Routes/custom_page_route.dart';

class FormulaireTransfert extends StatefulWidget {
  FormulaireTransfert({Key? key}) : super(key: key);

  @override
  State<FormulaireTransfert> createState() => _FormulaireTransfertState();
}

class _FormulaireTransfertState extends State<FormulaireTransfert> {
  var pointofinitiationmethode = TextEditingController();
  var phoneNumber = TextEditingController();
  var transactionAmount = TextEditingController();
  var purposeOfTransaction = TextEditingController();
  // Initial Selected Value



  // List of items in our dropdown menu

  String valueOfTransactionCurrency = '504';





  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("MAD"), value: "504"),
      DropdownMenuItem(child: Text("EURO"), value: "978"),
      DropdownMenuItem(child: Text("USD"), value: "840"),
    ];
    return menuItems;
  }
  String selectedValue = "504";
  String valueofoftransactioncurrency = '504';

  List<DropdownMenuItem<String>> get oeration_type {
    List<DropdownMenuItem<String>> oeration_type = [
      DropdownMenuItem(child: Text("Transfer P2P"), value: "0"),
      DropdownMenuItem(child: Text("Paiement commercant a face 2 face"), value: "1"),
      DropdownMenuItem(child: Text("Paiement commercant a distance"), value: "2"),
      DropdownMenuItem(child: Text("Paiement FMCG"), value: "3"),
    ];
    return oeration_type;
  }
  String valueOfOperationType = '0';
  String selectedValueOperationType = "0";

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context)
                      .push(CustomPageRouteRight(child: TransfertRoute()));
                },
              ),
              title: const Text(
                'Transfert d\'argent par QR Code',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xff4c91bc),
              elevation: 0,
            ),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Container(
                      width: 350,
                      constraints: const BoxConstraints(maxWidth: 600),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Point of Initiation method',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: pointofinitiationmethode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "the Point of Initiation method must not be empty";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Phone number',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(

                            controller: phoneNumber,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " Phonen Number must not be empty";
                              }
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixText: "+212",

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Transaction Amount',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                  )),
                              Text('Transaction Currency',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                child: TextFormField(
                                  controller: transactionAmount,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return " the Transaction  Amount must not be empty";
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                    ),
                                    value: selectedValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                      });
                                    },
                                    items: dropdownItems),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Purpose Of Transaction',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: purposeOfTransaction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " the Purpose Of Transaction must not be empty";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Text('Operation type',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          DropdownButtonFormField(
                            value: selectedValueOperationType,
                        items: oeration_type, onChanged: (String? value) {

                          setState(() {
                          selectedValueOperationType = value!;
                          });
                          },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 210.0),
                            child: RaisedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
            AppCubit.get(context).transferp2p(pointofinitiationmethode.text, "+212"+phoneNumber.text, selectedValue, transactionAmount.text, purposeOfTransaction.text, selectedValueOperationType);
                             print(selectedValue);
                                  //AppCubit.get(context).
                                }
                              },
                              textColor: Color(0xffFFFFFF),
                              padding: EdgeInsets.all(0),
                              shape: StadiumBorder(),
                              child: Container(
                                width: 155,
                                height: 55,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff4c91bc),
                                ),
                                child: Text(
                                  'VALIDER',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
