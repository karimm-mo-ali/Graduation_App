import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/Requests_Models/getFood_request_model.dart';
import 'getFood_requests_state.dart';
import 'package:flutter_graduation/Data/Reposetories/requests.dart';

class GetFoodRequestsCubit extends Cubit<GetFoodRequestsState> {
  GetFoodRequestsCubit() : super(GetFoodRequestsInitial());
  RequestRepo requestRepo = RequestRepo();

  GetFoodRequestsModel? GetFoodRequests() {
    try {
      emit(GetFoodRequestsLoading());
      requestRepo.getFoodRequests().then((value) {
        if (value != null) {
          emit(GetFoodRequestsLoaded(value));
        } else {
          emit(GetFoodRequestsError());
        }
      });
    } catch (e) {
      emit(GetFoodRequestsError());
    }
  }
}
