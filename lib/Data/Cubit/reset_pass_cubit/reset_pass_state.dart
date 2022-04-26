import '../../Models/Auth_Models/reset_pass_model.dart';

abstract class ResetPassState {}

class ResetPassInitial extends ResetPassState {}

class ResetPassLoading extends ResetPassState {}

class ResetPassLoaded extends ResetPassState {
  ResetPassModel updatePassResponse;
  ResetPassLoaded(this.updatePassResponse);
}

class ResetPassError extends ResetPassState {}
