import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:m_wallet_hps/screens/TransfertRoute.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'FormulaireTransfert.dart';
import 'Routes/CustomPageRouteRight.dart';
import 'Routes/custom_page_route.dart';


class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> with WidgetsBindingObserver {
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
      _scanBarcode = barcodeScanRes;
    });
  }
  String _scanBarcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              CustomPageRouteRight(child: TransfertRoute()),
            );
          },
        ),
        title: const Text(
          'Transfert d\'argent par QR Code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff4c91bc),

      ),
      body: SafeArea(
        child: _buildColumn(),
      ),
    );
  }

  Widget _buildColumn() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // First blue container
      _buildTopContainer(),
      // Button with offset
      _buildMidContainerWithButton(),
      // Bottom white container
      _buildBottomContainer(),
    ],
  );

  Widget _buildTopContainer() => Flexible(
    flex: 3,
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('scannez le code QR pour recevoir de l\'argent',style: TextStyle(
                color: Colors.white,
            fontSize: 15,
              fontWeight: FontWeight.bold

              ),),

        ],
      ),
      color: Color(0xff4c91bc),


    ),
  );

  Widget _buildMidContainerWithButton() {
    final buttonHeight =170.0;
    return Stack(
      children: [
        // Use same background color like the second container
        Container(height: buttonHeight, color: Colors.white),
        // Translate the button 
        Transform.translate(
          offset: Offset(0.0, -buttonHeight / 2.0),
          child: Center(
            child: GestureDetector(
              onTap: () { /* do stuff */ },
              child: Container(
                height: buttonHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 16.0,
                      offset: Offset(0.0, 6.0),
                      color: Colors.black.withOpacity(0.16),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 0.0),
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){ scanQR();},
                      child: new Image.asset(
                        'images/qrscann.png',
                        width: 150.0,
                        height: 150.0,

                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomContainer() => Flexible(
    flex: 5,
    child: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('Le QR code doit respecter la norme EMV CO'),
        ],
      ),

    ),
  );
}