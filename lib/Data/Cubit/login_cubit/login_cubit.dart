import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/View/screens/home_screen.dart';
import '../../../View/widgets/reusable_component.dart';
import '../../Models/user_model.dart';
import '../../Reposetories/auth.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  AuthRepo auth = AuthRepo();
  UserModel? login(
      {String? email,
      String? pass,
      BuildContext? context,
      required bool remember}) {
    try {
      emit(LoginLoading());
      auth.login(email: email, pass: pass, rememberMe: remember).then((value) {
        if (value != null) {
          emit(LoginLoaded(value));
          navigateAndFinish(context!, Home());
        } else {
          emit(LoginError());
        }
      });
    } catch (e) {
      emit(LoginError());
    }
  }
}
