import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/models/userModel.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:m_wallet_hps/network/remote/dio_helper.dart';
import 'package:m_wallet_hps/screens/AlimentationScreen.dart';


import '../screens/AccueilScreen.dart';
import '../screens/TransferScreen.dart';

class AppCubit extends Cubit<AppStates> {
  bool verified = false;
  bool? verifiedcin;
  bool? verifiedphone;

  AppCubit() : super(AppInitialStates());

  String? email;
  String? firstName;
  String? lastName;
  String? username;
  String? password;
  String? cin;
  String? phone_number;



  static AppCubit get(context) => BlocProvider.of(context);
  static late Widget widget;
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    AccueilScreen(),
    TransferScreen(),
    AlimentationScreen(),
  ];

  int currentStep = 0;

  void changeStep(index) {
    currentStep = currentStep + 1;
    emit(AppStepPageStates());
  }

  static List<String> banks = <String>['cih', 'attijari', 'sgma'];
  String element = banks.first;

  void changeBank(newvalue) {
    element = newvalue;
    emit(AppChangeBottomNavStates());
  }

  void changeBottom(index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

  UserModel? userModel;

  void userLogin({required String phone_number, required String password}) {
    emit(AppLoginInitialStates());
    DioHelper.postDataLogins(
      url: "login",
      data: {
        'phone_number': phone_number,
        'password': password,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(AppLoginSuccessStates(userModel!));
      emit(LoginSaveTokenInitialStates());
    }).catchError((error) {
      print(error.toString());
      emit(AppLoginErrorStates("Login Failed"));
    });
  }

  void userSignUp({
    required String? email,
    required String? phoneNumber,
    required String? password,
    required String? firstName,
    required String? lastName,
    required String? cin,
  }) {
    emit(AppSigninInitialStates());

    DioHelper.postData(
      url: "registration",
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'cin': cin,
      },
    ).then((value) {
      emit(AppSigninSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(AppSigninErrorStates(error.toString()));
    });
  }

  void addTokenToUser(email, deviceToken) {
    emit(LoginSaveTokenInitialStates());

    DioHelper.postDataLogins(
        url: "fcm_token",
        data: {"email": email, "fcmToken": deviceToken}).then((value) {
      emit(LoginSaveTokenSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(LoginSaveTokenErrorStates());
    });
  }

  void removeFcmToken(email, swift) {
    emit(RemoveTokenInitialStates());

    DioHelper.postDataLogins(
      url: "remove_fcm_token?swift=$swift&user_email=$email",
      data: {},
    ).then((value) {
      emit(RemoveTokenSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(RemoveTokenErrorStates());
    });
  }

  void loadLoggedInUser(email) {
    userModel = null;
    if (email != null) {
      emit(LoadLoggedInUserInitial());

      DioHelper.getData(url: "user?email=$email").then((value) {
        //  print(value.data);
        userModel = UserModel.fromJson(value.data);
        emit(LoadLoggedInUserSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(LoadLoggedInUserErrorStates());
      });
    }
  }

  void Makevirement(montant, destinataire, message, emetteur) {
    String operation_type = "virement";
    emit(AppVirementInitialStates());
    DioHelper.postData(url: "transfer/operation", data: {
      "operation_type": operation_type,
      "montant": montant,
      "emetteur": emetteur,
      "destinataire": destinataire,
      "message": message
    }).then((value) {
      loadLoggedInUser(CacheHelper.getData(key: 'email'));
      emit(AppVirementSuccessStates());
      changeBottom(0);
    }).catchError((error) {
      emit(AppVirementErrorStates());
    });
  }

  void sendOtp(String phone) {
    emit(AppSendOtpInitialState());
    DioHelper.postData(url: "otp/send", data: {"phoneNumber": phone})
        .then((value) {
      print("OTP SEND SUCCESS");
      emit(AppSendOtpSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(AppSendOtpErrorState());
    });
  }

  void verifyOtp(String otp) {
    emit(AppVerifyOtpInitialState());
    DioHelper.postData(
        url: "otp/verify",
        data: {"phoneNumber": phone_number, "otp": otp}).then((value) {
      verified = true;
      emit(AppVerifyOtpSuccessState(value.data));
    }).catchError((error) {
      emit(AppVerifyOtpErrorState(error.toString()));
      print(error.toString());
    });
  }

  void makeVersement(montant, message, emetteur) {
    String operation_type = "versement";
    emit(AppVersementInitialStates());
    DioHelper.postData(url: "transfer/operation", data: {
      "operation_type": operation_type,
      "montant": montant,
      "emetteur": emetteur,
      "message": message
    }).then((value) {
      loadLoggedInUser(CacheHelper.getData(key: 'email'));
      emit(AppVersementSuccessStates());
      userModel = null;
    }).catchError((error) {
      emit(AppVersementErrorStates());
    });
  }

void verifycin(cin) {
    emit(AppVerifyCinInitialStates());
   DioHelper.getData(url: "verifycinn?cin=$cin").then((value)  {


      verifiedcin = value.data;
      emit(AppVerifyCinSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(AppVerifyCinErrorStates());
    });

}
void verifyphone(phone) {
    emit(AppVerifyPhoneInitialStates());
   DioHelper.getData(url: "verifypnn?phone_number=$phone").then((value)  {
     emit(AppVerifyPhoneSuccessStates());
     verifiedphone = value.data;
    print("verify phone");
    print(verifiedphone);
    }).catchError((error){
      print(error.toString());
      emit(AppVerifyPhoneErrorStates());
    });

}
  

  
  
  
}

bool jwtVerification(String token) {
  DateTime? expiryDate = Jwt.getExpiryDate(token);

  DateTime now = DateTime.now();
  if (expiryDate!.compareTo(now) < 0) {
    return true;
  } else {
    return true;
  }
}
