import '../../Models/Auth_Models/signUp_model.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  SignUpModel? response;
  SignUpLoaded(this.response);
}

class SignUpError extends SignUpState {}
