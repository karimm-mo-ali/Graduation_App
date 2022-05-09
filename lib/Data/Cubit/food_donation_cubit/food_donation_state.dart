import '../../Models/Home_Models/food_request_model.dart';

abstract class FoodRequestState2 {}

class FoodRequestInitial2 extends FoodRequestState2 {}

class FoodRequestLoading2 extends FoodRequestState2 {}

class FoodRequestLoaded2 extends FoodRequestState2 {
  FoodRequestModel response;
  FoodRequestLoaded2(this.response);
}

class FoodRequestError2 extends FoodRequestState2 {}
