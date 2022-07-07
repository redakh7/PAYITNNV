
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';

import 'package:m_wallet_hps/screens/Transfer/TransferQrCodeResult.dart';
import 'package:m_wallet_hps/screens/Transfer/TransferRoute.dart';

import '../shared/PopUp.dart';

import 'Routes/CustomPageRouteRight.dart';

class FormulaireTransfert extends StatefulWidget {
  const FormulaireTransfert({Key? key}) : super(key: key);

  @override
  State<FormulaireTransfert> createState() => _FormulaireTransfertState();
}

enum point_of_initiation_methode { dynamic, static }

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
      const DropdownMenuItem(child: Text("MAD"), value: "504"),
      const DropdownMenuItem(child: Text("EURO"), value: "978"),
      const DropdownMenuItem(child: Text("USD"), value: "840"),
    ];
    return menuItems;
  }

  String selectedValue = "504";


  List<DropdownMenuItem<String>> get operationType {
    List<DropdownMenuItem<String>> operationType = [
      const DropdownMenuItem(child: Text("Transfer P2P"), value: "0"),
      const DropdownMenuItem(
          child: Text("Paiement commercant a face 2 face"), value: "1"),
      const DropdownMenuItem(
          child: Text("Paiement commercant a distance"), value: "2"),
      const DropdownMenuItem(child: Text("Paiement FMCG"), value: "3"),
    ];
    return operationType;
  }

  String valueOfOperationType = '0';
  String selectedValueOperationType = "0";

  point_of_initiation_methode? character = point_of_initiation_methode.dynamic;
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppGeneratedQrCodeSuccessStates) {
          navigateTo(context, TransferQrCodeResult());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon:const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRouteRight(child: const TransferRoute()));
              },
            ),
            title: const Text(
              'Transfert d\'argent par QR Code',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0xff4c91bc),
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
                        const Text(
                          'Point of Initiation method',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        RadioListTile<point_of_initiation_methode>(
                          title: const Text('dynamic'),
                          value: point_of_initiation_methode.dynamic,
                          groupValue: character,
                          onChanged: (point_of_initiation_methode? value) {
                            setState(() {
                              character = value;
                            });
                          },
                        ),
                        RadioListTile<point_of_initiation_methode>(
                          title: const Text('static'),
                          value: point_of_initiation_methode.static,
                          groupValue: character,
                          onChanged: (point_of_initiation_methode? value) {
                            setState(() {
                              character = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Phone number',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: phoneNumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " Phone Number must not be empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(),
                            prefix: const Text("+212"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
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
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: transactionAmount,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return " the Transaction  Amount must not be empty";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
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
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Purpose Of Transaction',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: purposeOfTransaction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " the Purpose Of Transaction must not be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        const Text('Operation type',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 55,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          margin: const EdgeInsets.only(),
                          width: double.infinity,
                          child: DropdownButtonFormField(
                            items: operationType,
                            value: selectedValueOperationType,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValueOperationType = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 210.0),
                          child: RaisedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                AppCubit.get(context).transferp2p(
                                    '${character?.name}',
                                    "+212" + phoneNumber.text,
                                    selectedValue,
                                    transactionAmount.text,
                                    purposeOfTransaction.text,
                                    selectedValueOperationType);
                              }
                            },
                            textColor: const Color(0xffFFFFFF),
                            padding: const EdgeInsets.all(0),
                            shape: const StadiumBorder(),
                            child: Container(
                              width: 155,
                              height: 55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff4c91bc),
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
      },
    );
  }
}
