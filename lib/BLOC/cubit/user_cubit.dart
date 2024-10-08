import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../cache/cachehelper.dart';
import '../../../core/api/api_consumer.dart';
import '../../../core/api/end_ponits.dart';
import '../../../core/errors/exceptions.dart';
import '../../models/user/get_user_model.dart';
import '../../models/user/user_signin_model.dart';
import '../../models/user/user_signup_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //
  GlobalKey<FormState> passwordResetFormKey = GlobalKey();
  GlobalKey<FormState> passwordForgetFormKey = GlobalKey();

  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();

  TextEditingController signUpLastname = TextEditingController();
  TextEditingController signUpFirstname = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //FOrget Password
  TextEditingController emailforgetpassword = TextEditingController();
  TextEditingController resetpassword = TextEditingController();
  TextEditingController otp = TextEditingController();

  UserSignin? user;
  GetUserModel? user1;
  // uploadImage(XFile image) {
  //   profilePic = image;
  //   emit(ImageUploaded());
  // }

/////////////////////////////////////////
/////////////////////////////////////////
  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.firstname: signUpFirstname.text,
          ApiKey.lastname: signUpLastname.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.password: signUpPassword.text,
          // ApiKey.pic: await uploadImage(profilePic!)
        },
      );
      final signUPModel = UserSignup.fromJson(response);
      print("========================");
      print(signUPModel.message);
      print("========================");
      emit(SignUpSuccess(message: signUPModel.message));
    } on ServerException catch (e) {
      print("========================");
      print(e.errModel.errorMessage);
      print("========================");
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }

/////////////////////////////////////////
/////////////////////////////////////////
  getUserData() async {
    emit(GetprofileLoading());
    try {
      print("======================");
      print(EndPoint.getUser(CacheHelper().getData(key: ApiKey.id)));
      final response = await api.get(
        EndPoint.getUser(CacheHelper().getData(key: ApiKey.id)),
      );

      emit(GetProfilesuccess(user: GetUserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(GetprofileFailed(errMessage: e.errModel.errorMessage));
    }
  }

/////////////////////////////////////////
/////////////////////////////////////////
  signIn() async {
    emit(SignInLoading());
    try {
      // await CacheHelper().clearAllData();

      final response = await api.post(EndPoint.signIn, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text,
      });
      user = UserSignin.fromJson(response);
      try {
        final decodedToken = JwtDecoder.decode(user!.token);
        print(user!.token);
        CacheHelper().saveData(key: ApiKey.token, value: user!.token);
        print(decodedToken["user_id"]);
        print(decodedToken);
        CacheHelper().saveData(key: ApiKey.id, value: decodedToken["user_id"]);
        emit(SignInSuccess());
      } catch (e) {
        emit(SignInFailure(errMessage: 'Invalid JWT token format'));
      }
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

  /////////////////////////////////////////
  /////////////////////////////////////////
  void forgetPassword() async {
    emit(passwordForgetLoading());
    try {
      final response = await api.post(EndPoint.forgetpass, data: {
        ApiKey.email: emailforgetpassword.text,
      });
      emit(PasswordForgetSuccess());
    } on ServerException catch (e) {
      emit(PasswordForgetFailed(errMessage: e.errModel.errorMessage));
    } catch (e) {
      emit(PasswordForgetFailed(errMessage: 'An unknown error occurred.'));
    }
  }

  /////////////////////////////////////////
  /////////////////////////////////////////

  void ResetPassword() async {
    emit(passwordResetLoading());
    try {
      final response = await api.post(EndPoint.resetpass, data: {
        ApiKey.newPassword: resetpassword.text,
        ApiKey.otp: otp.text,
      });

      emit(PasswordResetSuccess());
    } on ServerException catch (e) {
      emit(PasswordResetFailed(errMessage: e.errModel.errorMessage));
    } catch (e) {
      emit(PasswordResetFailed(errMessage: 'An unknown error occurred.'));
    }
  }
}
