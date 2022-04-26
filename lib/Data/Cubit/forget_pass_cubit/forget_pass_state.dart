import '../../Models/Auth_Models/forget_pass_model.dart';

abstract class ForgetPassState {}

class ForgetPassInitial extends ForgetPassState {}

class ForgetPassLoading extends ForgetPassState {}

class ForgetPassLoaded extends ForgetPassState {
  ForgetPassModel forgetPassResponse;
  ForgetPassLoaded(this.forgetPassResponse);
}

class ForgetPassError extends ForgetPassState {}
