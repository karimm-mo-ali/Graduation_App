import '../../Models/SideMenu_Models/contactUs_model.dart';

abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}

class ContactUsLoaded extends ContactUsState {
  ContactUsModel response;
  ContactUsLoaded(this.response);
}

class ContactUsError extends ContactUsState {}
