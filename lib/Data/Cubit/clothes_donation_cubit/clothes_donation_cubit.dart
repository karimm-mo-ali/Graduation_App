import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/Data/Reposetories/home.dart';
import '../../Models/Home_Models/Clothes_Request_model.dart';
import 'clothes_donation_state.dart';

class ClothesRequestCubit2 extends Cubit<ClothesRequestState2> {
  ClothesRequestCubit2() : super(ClothesRequestInitial2());
  HomeRepo homeRepo = HomeRepo();
  ClothesRequestModel? donateClothes({
    String? gender,
    String? type,
    String? size,
    String? quantity,
    String? deliveryType,
    String? location,
    BuildContext? context,
  }) {
    try {
      emit(ClothesRequestLoading2());
      homeRepo
          .donateClothes(
              type: type,
              gender: gender,
              size: size,
              quantity: quantity,
              location: location,
              deliveryType: deliveryType)
          .then((value) {
        if (value != null) {
          emit(ClothesRequestLoaded2(value));
          Navigator.pop(context!);
        } else {
          emit(ClothesRequestError2());
          Navigator.pop(context!);
        }
      });
    } catch (e) {
      emit(ClothesRequestError2());
    }
  }
}
