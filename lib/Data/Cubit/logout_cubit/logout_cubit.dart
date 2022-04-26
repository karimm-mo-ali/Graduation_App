import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/View/screens/Auth_Screens/login_screen.dart';
import '../../../helpers/myApplication.dart';
import '../../../helpers/sharedPreference.dart';
import '../../Models/Auth_Models/logout_model.dart';
import '../../Reposetories/auth.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  AuthRepo auth = AuthRepo();
  LogoutModel? logout({BuildContext? context}) {
    try {
      emit(LogoutLoading());
      auth.logout().then((value) {
        if (value != null) {
          sharedPrefs.removeToken();
          sharedPrefs.setSignedIn(false);
          MyApplication.navigateToReplace(context!, LoginScreen());
          emit(LogoutLoaded(value));
        } else {
          emit(LogoutError());
        }
      });
    } catch (e) {
      emit(LogoutError());
    }
  }
}
