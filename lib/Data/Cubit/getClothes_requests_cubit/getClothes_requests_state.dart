import '../../Models/Requests_Models/getClothes_request_model.dart';

abstract class GetClothesRequestsState {}

class GetClothesRequestsInitial extends GetClothesRequestsState {}

class GetClothesRequestsLoading extends GetClothesRequestsState {}

class GetClothesRequestsLoaded extends GetClothesRequestsState {
  GetClothesRequestsModel? response;
  GetClothesRequestsLoaded(this.response);
}

class GetClothesRequestsError extends GetClothesRequestsState {}
