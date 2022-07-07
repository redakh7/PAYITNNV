import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/models/userModel.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Routes/CustomPageRouteRight.dart';
import 'TransferRoute.dart';

class TransferQrCodeResult extends StatelessWidget {
   TransferQrCodeResult({Key? key}) : super(key: key);
  String data = "";
  @override
  Widget build(BuildContext context) {
    UserModel? userModel = AppCubit.get(context).userModel;
    return BlocConsumer<AppCubit,AppStates>( listener: (context,state){
      if (state is AppGeneratedQrCodeSuccessStates){
        data = state.url;
      }
    },builder: (context,state){
      return Scaffold(

        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .push(CustomPageRouteRight(child: TransferRoute()));
            },
          ),
          title: const Text(
            'Transfert d\'argent par QR Code',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff4c91bc),
          elevation: 0,
        ),
        body: Center(
          child: Column(
          
            children: [
            SizedBox(height: 30,),

              SizedBox(height: 50,),
              Container(
                child:       PrettyQr(
                  elementColor: Colors.black,

                  size: 250,
                  data: "${AppCubit.get(context).qrString}",
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                ),
              ),
             SizedBox(height: 200,),
              Text('Ce QR code respecte les spécifications MarocPay'),
            ],
          ),
        ),
      );
    });
  }
}
