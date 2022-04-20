import '../../Models/update_pass_model.dart';

abstract class UpdatePassState {}

class UpdatePassInitial extends UpdatePassState {}

class UpdatePassLoading extends UpdatePassState {}

class UpdatePassLoaded extends UpdatePassState {
  UpdatePassModel updatePassResponse;
  UpdatePassLoaded(this.updatePassResponse);
}

class UpdatePassError extends UpdatePassState {}
