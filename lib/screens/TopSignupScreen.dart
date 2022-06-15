import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';

import '../cubit/app_states.dart';


class SignupPagePage extends StatelessWidget {
   SignupPagePage({Key? key}) : super(key: key);
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Widget widget = AppCubit.get(context).register[AppCubit.get(context).currentStep];
    return BlocConsumer<AppCubit,AppStates>(listener: (context,state){

    },builder: (context,state){
      return Scaffold(

        body: SafeArea(
          child: Column(children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressBar(
                maxSteps: 3,

                progressType: LinearProgressBar.progressTypeLinear,
                currentStep: AppCubit.get(context).currentStep,
                progressColor: Colors.red,
                backgroundColor: Colors.blue,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                semanticsLabel: "Label",
                semanticsValue: "Value",
                minHeight: 5,

              ),

            ),
           Expanded(child:AppCubit.get(context).register[AppCubit.get(context).currentStep] ,)           ]),
        ),
      );
    });
  }
}
