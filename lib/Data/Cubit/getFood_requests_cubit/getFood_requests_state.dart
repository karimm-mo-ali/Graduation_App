import '../../Models/Requests_Models/getFood_request_model.dart';

abstract class GetFoodRequestsState {}

class GetFoodRequestsInitial extends GetFoodRequestsState {}

class GetFoodRequestsLoading extends GetFoodRequestsState {}

class GetFoodRequestsLoaded extends GetFoodRequestsState {
  GetFoodRequestsModel? response;
  GetFoodRequestsLoaded(this.response);
}

class GetFoodRequestsError extends GetFoodRequestsState {}
