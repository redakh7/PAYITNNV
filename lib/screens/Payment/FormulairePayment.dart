import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:m_wallet_hps/screens/AccueilScreen.dart';
import 'package:m_wallet_hps/screens/Payment/PaymentRoute.dart';
import 'package:m_wallet_hps/screens/SettingsScreen.dart';
import 'package:m_wallet_hps/screens/Transfer/TransferRoute.dart';
import 'package:m_wallet_hps/shared/SideMenu.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';

import '../Routes/CustomPageRouteRight.dart';
import '../test.dart';

class FormulairePayment extends StatefulWidget {
// List of items in our dropdown menu
  FormulairePayment({Key? key}) : super(key: key);

  @override
  State<FormulairePayment> createState() => _FormulairePaymentState();
}

enum point_of_initiation_methode { dynamique, statique }

class _FormulairePaymentState extends State<FormulairePayment> {
  var pointofinitiationmethode = TextEditingController();
  var phonenNumber = TextEditingController();
  var transactionAmount = TextEditingController();
  var purposeOfTransaction = TextEditingController();
  var financialinstitutioncode = TextEditingController();
  var oerationtype = TextEditingController();
  var merchantcategory = TextEditingController();
  var merchantname = TextEditingController();
  var merchantcity = TextEditingController();

  // Initial Selected Value
  String valueofoperationtype = 'Transfer P2P';

  // List of items in our dropdown menu
  var Operation_type = [
    'Transfer P2P',
    'Paiement commercant a face 2 face',
    'Paiement commercant a distance',
    'Paiement FMCG',
  ];
  String valueofoftransactioncurrency = '504';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("MAD"), value: "504"),
      DropdownMenuItem(child: Text("EURO"), value: "978"),
      DropdownMenuItem(child: Text("USD"), value: "840"),
    ];
    return menuItems;
  }

  String selectedValue = "504";
  List<DropdownMenuItem<String>> get dropdowncountrycode {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("MAROC"), value: "MA"),
      DropdownMenuItem(child: Text("USA"), value: "US"),
      DropdownMenuItem(child: Text("Royaume-Uni"), value: "GB"),
    ];
    return menuItems;
  }

  point_of_initiation_methode? _character =
      point_of_initiation_methode.dynamique;

  String selectedcountrycode = "MA";
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(CustomPageRouteRight(child: PaymentRoute()));
          },
        ),
        title: const Text(
          'Paiement d\'argent par QR Code',
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
                    SizedBox(
                      height: 5,
                    ),
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
                    RadioListTile<point_of_initiation_methode>(
                      title: const Text('dynamique'),
                      value: point_of_initiation_methode.dynamique,
                      groupValue: _character,
                      onChanged: (point_of_initiation_methode? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    RadioListTile<point_of_initiation_methode>(
                      title: const Text('statique'),
                      value: point_of_initiation_methode.statique,
                      groupValue: _character,
                      onChanged: (point_of_initiation_methode? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 8,
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
                      controller: phonenNumber,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " Phone Number must not be empty";
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff4c91bc), width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                              contentPadding: const EdgeInsets.symmetric(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff4c91bc), width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 60,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
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
                      height: 8,
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
                          return "Purpose Of Transaction must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff4c91bc), width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('financial institution code',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: financialinstitutioncode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "financial institution code must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff4c91bc), width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Operation type',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 55,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      margin: EdgeInsets.only(),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          // Initial Value
                          value: valueofoperationtype,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: Operation_type.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text('  ' + items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              valueofoperationtype = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text('merchant category\ncode',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            )),
                        SizedBox(width: 14,),
                        Text('country code\n',
                            style: TextStyle(
                              fontSize: 18,
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
                            controller: merchantcategory,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "merchant category code must not be empty";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff4c91bc), width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width: 150,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.symmetric(horizontal: 6),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                              ),
                              value: selectedcountrycode,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedcountrycode = newValue!;
                                });
                              },
                              items: dropdowncountrycode),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('merchant name',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: merchantname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " the merchant name must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff4c91bc), width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('merchant city',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: merchantcity,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " the merchant city must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff4c91bc), width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 210.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) ;
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
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
