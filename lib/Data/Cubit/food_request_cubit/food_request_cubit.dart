import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../Models/Home_Models/food_request_model.dart';
import '../../Reposetories/home.dart';
import 'food_request_state.dart';

class FoodRequestCubit extends Cubit<FoodRequestState> {
  FoodRequestCubit() : super(FoodRequestInitial());
  HomeRepo homeRepo = HomeRepo();
  FoodRequestModel? requestFood({
    String? type,
    String? foodSource,
    String? typeFood,
    String? expDate,
    String? typeQuantity,
    String? quantity,
    String? deliveryType,
    String? location,
    String? needyAddresses,
    BuildContext? context,
  }) {
    try {
      emit(FoodRequestLoading());
      homeRepo
          .requestFood(
              type: type,
              foodSource: foodSource,
              typeFood: typeFood,
              expDate: expDate,
              typeQuantity: typeQuantity,
              quantity: quantity,
              deliveryType: deliveryType,
              location: location,
              needyAddresses: needyAddresses)
          .then((value) {
        if (value != null) {
          emit(FoodRequestLoaded(value));
          Navigator.pop(context!);
        } else {
          emit(FoodRequestError());
        }
      });
    } catch (e) {
      emit(FoodRequestError());
    }
  }
}
