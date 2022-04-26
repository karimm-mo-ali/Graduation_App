import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/Data/Cubit/signUp_cubit/signUp_state.dart';
import 'package:flutter_graduation/View/screens/Home_Screens/home_screen.dart';
import '../../../View/widgets/reusable_component.dart';
import '../../../helpers/myApplication.dart';
import '../../Models/Auth_Models/signUp_model.dart';
import '../../Reposetories/auth.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  AuthRepo auth = AuthRepo();
  SignUpModel? signUp(
      {String? firstName,
      String? lastName,
      String? gender,
      String? email,
      String? phone,
      String? address,
      String? password,
      File? photo,
      BuildContext? context}) {
    try {
      emit(SignUpLoading());
      auth
          .signUP(
              firstName: firstName,
              lastName: lastName,
              gender: gender,
              email: email,
              phone: phone,
              address: address,
              password: password,
              photo: photo)
          .then((value) {
        if (value != null) {
          emit(SignUpLoaded(value));
          MyApplication.navigateToReplace(context!, Home());
        } else {
          emit(SignUpError());
        }
      });
    } catch (e) {
      emit(SignUpError());
    }
  }
}
