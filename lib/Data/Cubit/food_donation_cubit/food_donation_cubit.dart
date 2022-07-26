import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../Models/Home_Models/food_request_model.dart';
import '../../Reposetories/home.dart';
import 'food_donation_state.dart';

class FoodRequestCubit2 extends Cubit<FoodRequestState2> {
  FoodRequestCubit2() : super(FoodRequestInitial2());
  HomeRepo homeRepo = HomeRepo();
  FoodRequestModel? donateFood({
    String? type,
    String? foodSource,
    String? typeFood,
    String? expDate,
    String? typeQuantity,
    String? quantity,
    String? deliveryType,
    String? location,
    BuildContext? context,
  }) {
    try {
      emit(FoodRequestLoading2());
      homeRepo
          .donateFood(
              type: type,
              foodSource: foodSource,
              typeFood: typeFood,
              expDate: expDate,
              typeQuantity: typeQuantity,
              quantity: quantity,
              deliveryType: deliveryType,
              location: location,
         )
          .then((value) {
        if (value != null) {
          emit(FoodRequestLoaded2(value));
          Navigator.pop(context!);
        } else {
          emit(FoodRequestError2());
          Navigator.pop(context!);
        }
      });
    } catch (e) {
      emit(FoodRequestError2());
    }
  }
}
