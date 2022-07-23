import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Api/clothes_request_model.dart';

abstract class NewClothesRequestState {}

class NewClothesRequestInitial extends NewClothesRequestState {}

class NewClothesRequestLoading extends NewClothesRequestState {}

class NewClothesRequestLoaded extends NewClothesRequestState {
  NewClothesRequestModel? response;
  NewClothesRequestLoaded(this.response);
}

class NewClothesRequestError extends NewClothesRequestState {}
