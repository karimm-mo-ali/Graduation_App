import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/View/screens/Home_Screens/home_screen.dart';
import 'package:flutter_graduation/View/screens/SideMenu_Screens/side_menu_screen.dart';
import '../../../helpers/myApplication.dart';
import '../../Models/Auth_Models/login_model.dart';
import '../../Reposetories/auth.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  AuthRepo auth = AuthRepo();
  LoginModel? login(
      {String? email,
      String? pass,
      BuildContext? context,
      required bool remember}) {
    try {
      emit(LoginLoading());
      auth.login(email: email, pass: pass, rememberMe: remember).then((value) {
        if (value != null) {
          emit(LoginLoaded(value));
          MyApplication.navigateToReplace(context!, SideMenuScreen());
        } else {
          emit(LoginError());
        }
      });
    } catch (e) {
      emit(LoginError());
    }
  }
}
