import 'package:bloc/bloc.dart';
import 'package:flutter_graduation/Data/Cubit/profile_info_cubit/profile_info_state.dart';
import 'package:flutter_graduation/Data/Reposetories/user.dart';
import '../../Models/SideMenu_Models/profile_info_model.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoInitial());
  UserRepo userRepo = UserRepo();
  ProfileInfoModel? profileInfo() {
    try {
      emit(ProfileInfoLoading());
      userRepo.getProfileInfo().then((value) {
        if (value != null) {
          emit(ProfileInfoLoaded(value));
        } else {
          emit(ProfileInfoError());
        }
      });
    } catch (e) {
      emit(ProfileInfoError());
    }
  }
}
