import '../../Models/Auth_Models/logout_model.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutLoaded extends LogoutState {
  LogoutModel response;
  LogoutLoaded(this.response);
}

class LogoutError extends LogoutState {}
