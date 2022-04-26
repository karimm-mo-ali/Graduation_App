import '../../Models/SideMenu_Models/profile_info_model.dart';

abstract class ProfileInfoState {}

class ProfileInfoInitial extends ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  ProfileInfoModel? response;
  ProfileInfoLoaded(this.response);
}

class ProfileInfoError extends ProfileInfoState {}
