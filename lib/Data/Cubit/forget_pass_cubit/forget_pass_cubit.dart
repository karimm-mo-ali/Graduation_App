import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/View/screens/Auth_Screens/verify_code_screen.dart';
import '../../../View/screens/Auth_Screens/create_new_pass_screen.dart';
import '../../../helpers/myApplication.dart';
import '../../Models/Auth_Models/forget_pass_model.dart';
import '../../Reposetories/auth.dart';
import 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassModel? response;
  ForgetPassCubit() : super(ForgetPassInitial());
  AuthRepo authRepo = AuthRepo();
  forgetPass({String? email, BuildContext? context}) {
    try {
      emit(ForgetPassLoading());
      authRepo.forgetPass(email: email).then((value) {
        if (value != null) {
          response = value;
          MyApplication.navigateToReplace(context!, VerifyCodeScreen());
          emit(ForgetPassLoaded(response!));
        } else {
          emit(ForgetPassError());
        }
      });
      return response;
    } catch (e) {
      emit(ForgetPassError());
    }
  }
}
