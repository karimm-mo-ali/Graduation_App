// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_graduation/Data/Reposetories/home.dart';
// import '../../Models/Home_Models/Clothes_Donation_model.dart';
// import 'Clothes_Donation_state.dart';
//
// class ClothesDonationCubit extends Cubit<ClothesDonationState> {
//   ClothesDonationCubit() : super(ClothesDonationInitial());
//   HomeRepo homeRepo = HomeRepo();
//   ClothesDonationModel? donateClothes({
//     String? gender,
//     String? type,
//     String? size,
//     String? quantity,
//     String? location,
//     String? deliveryType,
//     BuildContext? context,
//   }) {
//     try {
//       emit(ClothesDonationLoading());
//       homeRepo
//           .donateClothes(
//               gender: gender,
//               type: type,
//               size: size,
//               quantity: quantity,
//               location: location,
//               deliveryType: deliveryType)
//           .then((value) {
//         if (value != null) {
//          emit(ClothesDonationLoaded(value));
//           Navigator.pop(context!);
//         } else {
//           emit(ClothesDonationError());
//         }
//       });
//     } catch (e) {
//       emit(ClothesDonationError());
//     }
//   }
// }
