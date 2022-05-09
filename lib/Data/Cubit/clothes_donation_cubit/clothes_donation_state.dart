import '../../Models/Home_Models/clothes_request_model.dart';

abstract class ClothesRequestState2 {}

class ClothesRequestInitial2 extends ClothesRequestState2 {}

class ClothesRequestLoading2 extends ClothesRequestState2 {}

class ClothesRequestLoaded2 extends ClothesRequestState2 {
  ClothesRequestModel response;
  ClothesRequestLoaded2(this.response);
}

class ClothesRequestError2 extends ClothesRequestState2 {}
