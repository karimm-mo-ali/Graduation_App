import '../../Models/Home_Models/food_request_model.dart';

abstract class FoodRequestState {}

class FoodRequestInitial extends FoodRequestState {}

class FoodRequestLoading extends FoodRequestState {}

class FoodRequestLoaded extends FoodRequestState {
  FoodRequestModel response;
  FoodRequestLoaded(this.response);
}

class FoodRequestError extends FoodRequestState {}
