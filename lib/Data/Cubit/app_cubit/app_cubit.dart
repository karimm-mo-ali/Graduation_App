import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/cache_helper.dart';
import '../../../View/screens/conact_us_screen.dart';
import '../../../View/screens/donation_screen.dart';
import '../../../View/screens/request_screen.dart';
import 'app_state.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const Donation(),
    const Request(),
    Profile(),
  ];
  List<String> title = [
    'DONATION',
    'REQUEST',
    'CONTACTUS',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeButtonNavBarState());
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeStates());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeStates());
      });
    }
  }

  bool status = false;

  void changeSwitchValue(bool val) {
    status = val;
    emit(AppChangeSwitchStates());
  }

  void changeColorIcon() {
    isDark = !isDark;
    emit(AppChangeColorIconStates());
  }

  int firstModeText = 0;
  List<String> modeText = [
    'Open Dark Mode',
    'Close Dark Mode',
  ];

//test

  bool check1 = false;
  bool check2 = false;

//List Gender
  String? genderChoose;
  List<String> listGender = [
    'Male',
    'Female',
    'Prefer Not Answer',
  ];

//List Food
  String? foodType;

  List<String> listFood = [
    'Cooked',
    'Un Cooked',
    'Restaurant',
    'Sweets',
    'Others'
  ];

//List Quantity
  String? quantityMeal;
  String? quantityKilo;
  List<String> listMeal = [
    '1 Meal',
    '2 Meal',
    '3 Meal',
    '4 Meal',
    '5 Meal',
    'More',
  ];

  List<String> listKilo = [
    '1 Kilo',
    '2 Kilo',
    '3 Kilo',
    '4 Kilo',
    '5 Kilo',
    'More',
  ];
}
