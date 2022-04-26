import '../../Models/Home_Models/Food_Donation_model.dart';

abstract class FoodDonationState {}

class FoodDonationInitial extends FoodDonationState {}

class FoodDonationLoading extends FoodDonationState {}

class FoodDonationLoaded extends FoodDonationState {
  FoodDonationModel response;
  FoodDonationLoaded(this.response);
}

class FoodDonationError extends FoodDonationState {}
