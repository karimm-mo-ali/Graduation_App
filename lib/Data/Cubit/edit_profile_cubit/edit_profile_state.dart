import '../../Models/SideMenu_Models/edit_profile_model.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileLoaded extends EditProfileState {
  EditProfileModel response;
  EditProfileLoaded(this.response);
}

class EditProfileError extends EditProfileState {}
