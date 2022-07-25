import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/Requests_Models/getClothes_request_model.dart';
import 'package:flutter_graduation/Data/Reposetories/requests.dart';
import 'getClothes_requests_state.dart';

class GetClothesRequestsCubit extends Cubit<GetClothesRequestsState> {
  GetClothesRequestsCubit() : super(GetClothesRequestsInitial());
  RequestRepo requestRepo = RequestRepo();
  GetClothesRequestsModel? GetClothesRequests() {
    try {
      emit(GetClothesRequestsLoading());
      requestRepo.getClothesRequests().then((value) {
        if (value != null) {
          emit(GetClothesRequestsLoaded(value));
        } else {
          emit(GetClothesRequestsError());
        }
      });
    } catch (e) {
      emit(GetClothesRequestsError());
    }
  }
}
