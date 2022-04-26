import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/Data/Cubit/reset_pass_cubit/reset_pass_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Style/Colors.dart';
import '../../../View/screens/Auth_Screens/login_screen.dart';
import '../../../helpers/myApplication.dart';
import '../../Models/Auth_Models/reset_pass_model.dart';
import '../../Reposetories/auth.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassModel? response;
  ResetPassCubit() : super(ResetPassInitial());
  AuthRepo authRepo = AuthRepo();
  resetPass({String? tokenCode, String? newPassword, BuildContext? context}) {
    try {
      emit(ResetPassLoading());
      authRepo
          .resetPass(token: tokenCode, newPassword: newPassword)
          .then((value) {
        if (value != null) {
          response = value;
          emit(ResetPassLoaded(response!));
          MyApplication.navigateToReplace(context!, LoginScreen());
        } else {
          emit(ResetPassError());
        }
      });
      return response;
    } catch (e) {
      emit(ResetPassError());
    }
  }
}
