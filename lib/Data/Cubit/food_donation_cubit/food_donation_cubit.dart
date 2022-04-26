// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import '../../Reposetories/home.dart';
// import '../../Models/Home_Models/Food_Donation_model.dart';
// import 'Food_Donation_state.dart';
//
// class FoodDonationCubit extends Cubit<FoodDonationState> {
//   FoodDonationCubit() : super(FoodDonationInitial());
//   HomeRepo homeRepo = HomeRepo();
//   FoodDonationModel? donateFood({
//     String? type,
//     String? foodSource,
//     String? typeFood,
//     String? expDate,
//     String? typeQuantity,
//     String? quantity,
//     String? deliveryType,
//     String? location,
//     String? needyAddresses,
//     BuildContext? context,
//   }) {
//     try {
//       emit(FoodDonationLoading());
//       homeRepo
//           .donateFood(
//               type: type,
//               foodSource: foodSource,
//               typeFood: typeFood,
//               expDate: expDate,
//               typeQuantity: typeQuantity,
//               quantity: quantity,
//               deliveryType: deliveryType,
//               location: location)
//           .then((value) {
//         if (value != null) {
//           emit(FoodDonationLoaded(value));
//           Navigator.pop(context!);
//         } else {
//           emit(FoodDonationError());
//         }
//       });
//     } catch (e) {
//       emit(FoodDonationError());
//     }
//   }
// }
