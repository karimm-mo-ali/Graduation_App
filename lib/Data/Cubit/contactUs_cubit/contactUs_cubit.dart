import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/Data/Reposetories/user.dart';
import '../../Models/SideMenu_Models/contactUs_model.dart';
import 'contactUs_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  UserRepo userRepo = UserRepo();
  ContactUsModel? contactUs(
      {String? firstName,
      String? lastName,
      String? email,
      String? message,
      String? phone,
      BuildContext? context}) {
    try {
      emit(ContactUsLoading());
      userRepo
          .contactUs(
              firstName: firstName,
              lastName: lastName,
              email: email,
              message: message,
              phone: phone)
          .then((value) {
        if (value != null) {
          emit(ContactUsLoaded(value));
          Navigator.pop(context!);
        } else {
          emit(ContactUsError());
        }
      });
    } catch (e) {
      emit(ContactUsError());
    }
  }
}
