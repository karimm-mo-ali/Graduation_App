import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Api/clothes_request_model.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Api/clothes_request_repo.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Food_Api/new_food_request_states.dart';

class NewFoodRequestCubit extends Cubit<NewFoodRequestState> {
  NewFoodRequestCubit() : super(NewFoodRequestInitial());
  RequestRepo requestRepo = RequestRepo();
  NewClothesRequestModel? NewFoodRequest() {
    try {
      emit(NewFoodRequestLoading());
      requestRepo.getNewFoodRequest().then((value) {
        if (value != null) {
          emit(NewFoodRequestLoaded(value));
        } else {
          emit(NewFoodRequestError());
        }
      });
    } catch (e) {
      emit(NewFoodRequestError());
    }
  }
}