// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:talabatcommarket/Data/Cubit/update_pass_cubit/update_pass_state.dart';
// import 'package:talabatcommarket/helpers/sharedPreference.dart';
// import '../../../Style/Colors.dart';
// import '../../../View/Screens/login.dart';
// import '../../../helpers/myApplication.dart';
// import '../../Models/update_pass_model.dart';
// import '../../Reposetories/authentication/auth.dart';
//
// class UpdatePassCubit extends Cubit<UpdatePassState> {
//   UpdatePassModel? response;
//   UpdatePassCubit() : super(UpdatePassInitial());
//   AuthRepo authRepo = AuthRepo();
//   updatePass({String? password, String? passwordConf, BuildContext? context}) {
//     try {
//       emit(UpdatePassLoading());
//       authRepo
//           .updatePass(password!, passwordConf!, sharedPrefs.token)
//           .then((value) {
//         if (value != null) {
//           response = value;
//           emit(UpdatePassLoaded(response!));
//           Fluttertoast.showToast(
//               msg: 'Password is updated',
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colours.primaryAppColor,
//               textColor: Colours.whiteColor,
//               fontSize: 16.0);
//           MyApplication.navigateTo(context!, LoginScreen());
//         } else {
//           emit(UpdatePassError());
//         }
//       });
//       return response;
//     } catch (e) {
//       emit(UpdatePassError());
//     }
//   }
// }
