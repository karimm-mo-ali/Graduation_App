import '../../Models/Home_Models/clothes_Donation_model.dart';

abstract class ClothesDonationState {}

class ClothesDonationInitial extends ClothesDonationState {}

class ClothesDonationLoading extends ClothesDonationState {}

class ClothesDonationLoaded extends ClothesDonationState {
  ClothesDonationModel response;
  ClothesDonationLoaded(this.response);
}

class ClothesDonationError extends ClothesDonationState {}
