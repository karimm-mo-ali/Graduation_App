import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graduation/Data/Reposetories/home.dart';
import '../../Models/Home_Models/Clothes_Request_model.dart';
import 'Clothes_Request_state.dart';

class ClothesRequestCubit extends Cubit<ClothesRequestState> {
  ClothesRequestCubit() : super(ClothesRequestInitial());
  HomeRepo homeRepo = HomeRepo();
  ClothesRequestModel? requestClothes({
    String? gender,
    String? type,
    String? size,
    String? quantity,
    String? deliveryType,
    String? location,
    String? needyAddresses,
    BuildContext? context,
  }) {
    try {
      emit(ClothesRequestLoading());
      homeRepo
          .requestClothes(
              type: type,
              gender: gender,
              size: size,
              quantity: quantity,
              needyAddresses: needyAddresses,
              location: location,
              deliveryType: deliveryType)
          .then((value) {
        if (value != null) {
          emit(ClothesRequestLoaded(value));
         Navigator.pop(context!);
        } else {
          emit(ClothesRequestError());
        }
      });
    } catch (e) {
      emit(ClothesRequestError());
    }
  }
}
