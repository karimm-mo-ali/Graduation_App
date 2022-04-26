import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/Data/Reposetories/user.dart';
import '../../Models/SideMenu_Models/edit_profile_model.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  UserRepo userRepo = UserRepo();
  EditProfileModel? editProfile(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? address,
      File? photo,
      BuildContext? context}) {
    try {
      emit(EditProfileLoading());
      userRepo
          .editProfile(
              firstName: firstName,
              lastName: lastName,
              email: email,
              phone: phone,
              address: address,
              photo: photo)
          .then((value) {
        if (value != null) {
          emit(EditProfileLoaded(value));
          Navigator.pop(context!);
        } else {
          emit(EditProfileError());
        }
      });
    } catch (e) {
      emit(EditProfileError());
    }
  }
}
