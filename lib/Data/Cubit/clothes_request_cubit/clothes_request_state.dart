import '../../Models/Home_Models/clothes_request_model.dart';

abstract class ClothesRequestState {}

class ClothesRequestInitial extends ClothesRequestState {}

class ClothesRequestLoading extends ClothesRequestState {}

class ClothesRequestLoaded extends ClothesRequestState {
  ClothesRequestModel response;
  ClothesRequestLoaded(this.response);
}

class ClothesRequestError extends ClothesRequestState {}
