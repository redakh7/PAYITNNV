import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/screens/AccueilScreen.dart';
import 'package:m_wallet_hps/screens/SettingsScreen.dart';
import 'package:m_wallet_hps/shared/SideMenu.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';




class QRcodeScanner extends StatefulWidget {



// List of items in our dropdown menu
  QRcodeScanner({Key? key}) : super(key: key);

  @override
  State<QRcodeScanner> createState() => _QRcodeScannerState();
}

class _QRcodeScannerState extends State<QRcodeScanner> {
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      scanBarcode = barcodeScanRes;

    });
  }
  String scanBarcode = '';

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
          'QR code Scanner',
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
                children: [
                  IconButton(
                      padding: new EdgeInsets.all(0.0),
                      onPressed: () {
                        print("hi");

                        scanQR();

                        print("hihiiiiiiiiiii");

                      },
                      icon: Icon(
                        Icons.qr_code_scanner,
                        color: Colors.green,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}