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
import 'Routes/custom_page_route.dart';


class FormulaireTransfert extends StatefulWidget {



// List of items in our dropdown menu
   FormulaireTransfert({Key? key}) : super(key: key);

  @override
  State<FormulaireTransfert> createState() => _FormulaireTransfertState();

}

class _FormulaireTransfertState extends State<FormulaireTransfert> {
  var Pointofinitiationmethode = TextEditingController();
  var PhonenNumber = TextEditingController();
  var TransactionAmount = TextEditingController();
  var PurposeOfTransaction = TextEditingController();
  // Initial Selected Value
  String valueofoperationtype = 'Transfer P2P';

  // List of items in our dropdown menu
  var Operation_type = [
    'Transfer P2P',
    'Paiement commercant a face 2 face',
    'Paiement commercant a distance',
    'Paiement FMCG',

  ];
  String valueofoftransactioncurrency ='MAD';

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
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(CustomPageRouteLeft(child: SideMenu()));
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
                       TextFormField(
                         controller: Pointofinitiationmethode,
                         validator: (value)  {
                           if (value!.isEmpty) {
                             return "the Point of Initiation method must not be empty";
                           }},
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
                       TextFormField(
                         controller: PhonenNumber,
                        validator: (value)  {
                           if (value!.isEmpty) {
                             return " Phonen Number must not be empty";
               }},
                     keyboardType: TextInputType.phone,
                     decoration: InputDecoration(
                     border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0)
                     ),
                     ),
                     ),
                     SizedBox(
                     height: 8,
                     ),
                     Text('Transaction Amount',style: TextStyle(fontSize: 18, color: Colors.blueGrey,)),
                     SizedBox(height: 8,),
                     Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                     Container(
                       width: 150,
                             child: TextFormField(
                               controller: TransactionAmount,

                               validator: (value)  {
                                 if (value!.isEmpty) {
                                   return " the Transaction  Amount must not be empty";
                                 }},
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
                       TextFormField(
                         controller: PurposeOfTransaction,
                         validator: (value)  {
                           if (value!.isEmpty) {
                             return " the Purpose Of Transaction must not be empty";
                           }},
                         decoration: InputDecoration(
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10.0)
                           ),
                         ),
                       ),
                       SizedBox(height: 28,),
                       Text('Operation type',style: TextStyle(fontSize: 18, color: Colors.blueGrey,)),
                       SizedBox(height: 8,),
                       Container(
                         height: 55,
                         decoration: ShapeDecoration(
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1.0, style: BorderStyle.solid,color: Colors.grey),
                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                           ),
                         ),
                         margin: EdgeInsets.only( ),
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
                                 child: Text('  '+items),
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
                       SizedBox(height: 25,),
                       Padding(
                           padding: const EdgeInsets.only(left: 210.0),
                           child: RaisedButton(
                           onPressed: () {   if (formkey.currentState!.validate())

                             Navigator.of(context)
                                 .push(CustomPageRouteLeft(child: SideMenu()));
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
      ),
    );
  }
}