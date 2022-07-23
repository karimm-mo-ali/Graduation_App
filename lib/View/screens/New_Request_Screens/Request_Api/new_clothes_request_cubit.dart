import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Api/clothes_request_model.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Api/clothes_request_repo.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Api/new_clothes_request_states.dart';

class NewClothesRequestCubit extends Cubit<NewClothesRequestState> {
  NewClothesRequestCubit() : super(NewClothesRequestInitial());
  RequestRepo requestRepo = RequestRepo();
  NewClothesRequestModel? NewClothesRequest() {
    try {
      emit(NewClothesRequestLoading());
      requestRepo.getNewClothesRequest().then((value) {
        if (value != null) {
          emit(NewClothesRequestLoaded(value));
        } else {
          emit(NewClothesRequestError());
        }
      });
    } catch (e) {
      emit(NewClothesRequestError());
    }
  }
}