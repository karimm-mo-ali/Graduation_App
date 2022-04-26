import 'package:flutter_graduation/Data/Models/SideMenu_Models/change_pass_model.dart';

abstract class ChangePassState {}

class ChangePassInitial extends ChangePassState {}

class ChangePassLoading extends ChangePassState {}

class ChangePassLoaded extends ChangePassState {
  ChangePasswordModel response;
  ChangePassLoaded(this.response);
}

class ChangePassError extends ChangePassState {}
