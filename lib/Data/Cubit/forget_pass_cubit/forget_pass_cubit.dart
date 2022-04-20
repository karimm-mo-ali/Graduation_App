// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:talabatcommarket/View/Screens/create_new_pass.dart';
// import '../../../View/Screens/check_mail.dart';
// import '../../../helpers/myApplication.dart';
// import '../../Models/forget_pass_model.dart';
// import '../../Reposetories/authentication/auth.dart';
// import 'forget_pass_state.dart';
//
// class ForgetPassCubit extends Cubit<ForgetPassState> {
//   ForgetPassModel? response;
//   ForgetPassCubit() : super(ForgetPassInitial());
//   AuthRepo authRepo = AuthRepo();
//   forgetPass({String? email, BuildContext? context}) {
//     try {
//       emit(ForgetPassLoading());
//       authRepo.forgetPass(email!).then((value) {
//         if (value != null) {
//           response = value;
//           MyApplication.navigateTo(context!, CreateNewPasswordScreen());
//           emit(ForgetPassLoaded(response!));
//         } else {
//           emit(ForgetPassError());
//         }
//       });
//       return response;
//     } catch (e) {
//       emit(ForgetPassError());
//     }
//   }
// }
