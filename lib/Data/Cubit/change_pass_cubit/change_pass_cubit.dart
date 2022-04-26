import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/Data/Models/SideMenu_Models/change_pass_model.dart';
import 'package:flutter_graduation/Data/Reposetories/user.dart';
import 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitial());
  UserRepo userRepo = UserRepo();
  ChangePasswordModel? changePass(
      {String? currentPassword, String? newPassword, BuildContext? context}) {
    try {
      emit(ChangePassLoading());
      userRepo
          .changePass(
              currentPassword: currentPassword, newPassword: newPassword)
          .then((value) {
        if (value != null) {
          emit(ChangePassLoaded(value));
          Navigator.pop(context!);
        } else {
          emit(ChangePassError());
        }
      });
    } catch (e) {
      emit(ChangePassError());
    }
  }
}
