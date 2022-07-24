import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Food_Api/food_request_model.dart';

abstract class NewFoodRequestState {}

class NewFoodRequestInitial extends NewFoodRequestState {}

class NewFoodRequestLoading extends NewFoodRequestState {}

class NewFoodRequestLoaded extends NewFoodRequestState {
  NewFoodRequestModel? response;
  NewFoodRequestLoaded(this.response);
}

class NewFoodRequestError extends NewFoodRequestState {}
