import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/screens/AccueilScreen.dart';
import 'package:m_wallet_hps/screens/SettingsScreen.dart';
import 'package:m_wallet_hps/shared/SideMenu.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';

import 'HomeScreen.dart';
import 'Routes/CustomPageRouteRight.dart';


class FormulaireTransfert extends StatefulWidget {



// List of items in our dropdown menu
   FormulaireTransfert({Key? key}) : super(key: key);

  @override
  State<FormulaireTransfert> createState() => _FormulaireTransfertState();
}

class _FormulaireTransfertState extends State<FormulaireTransfert> {

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("MAD"),value: "MAD"),
      DropdownMenuItem(child: Text("EURO"),value: "EURO"),
      DropdownMenuItem(child: Text("USD"),value: "USD"),
    ];
    return menuItems;
  }
  String selectedValue = "MAD";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

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
            child: Container(
              width: 350,
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Point of Initiation method',
                       style: TextStyle(fontSize: 18, color: Colors.blueGrey,),
                     ),
                     SizedBox(
                       height: 8,
                     ),
                     TextField(
                       decoration: InputDecoration(
                         border: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: Colors.green, width: 2.0),
                             borderRadius: BorderRadius.circular(10.0)

                         ),
                       ),
                     ),
                     SizedBox(height: 20,),
                     Text(
                       'Phone number',
                       style: TextStyle(fontSize: 18, color: Colors.blueGrey,),
                     ),
                     SizedBox(
                       height: 8,
                     ),
                     TextField(
                       keyboardType: TextInputType.phone,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10.0)
                         ),
                       ),
                     ),

                     SizedBox(
                       height: 20,
                     ),

                     Text(
                       'Transaction Amount',
                       style: TextStyle(fontSize: 18, color: Colors.blueGrey,),
                     ),
                     SizedBox(
                       height: 8,
                     ),
                     TextField(
                       keyboardType: TextInputType.phone,
                       decoration: InputDecoration(

                         border: OutlineInputBorder(

                             borderRadius: BorderRadius.circular(10.0)
                         ),
                       ),
                     ),
                     SizedBox(height: 28,),
                     Text('TransactionCurrency',style: TextStyle(fontSize: 18, color: Colors.blueGrey,)),
                     SizedBox(height: 8,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Container(
                           width: 150,
                           child: TextField(
                             keyboardType: TextInputType.phone,
                             decoration: InputDecoration(

                               border: OutlineInputBorder(

                                   borderRadius: BorderRadius.circular(10.0)
                               ),
                             ),
                           ),
                         ),
                         Container(
                           width: 150,
                           child: DropdownButtonFormField(
                               decoration: InputDecoration(
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.grey, width: 1),
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 border: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.blue, width: 2),
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
                     Text('Purpose Of Transaction',style: TextStyle(fontSize: 18, color: Colors.blueGrey,)),
                     SizedBox(
                       height: 8,
                     ),
                     TextField(
                       decoration: InputDecoration(
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10.0)
                         ),
                       ),
                     ),
                     SizedBox(height: 28,),
                     Text('Operation type',style: TextStyle(fontSize: 18, color: Colors.blueGrey,)),
                     SizedBox(height: 8,),
                     SizedBox(height: 25,),

                     Padding(
                         padding: const EdgeInsets.only(left: 210.0),
                         child: RaisedButton(
                         onPressed: () {},
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
                            child:Text(
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
    );
  }
}