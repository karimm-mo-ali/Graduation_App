

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_states.dart';

class CounterCubit extends Cubit <CounterStates>{
  CounterCubit() : super(CounterInitialState());
  static CounterCubit get (context)=>BlocProvider.of(context);

  List <String> type =[
    'Uncooked',
    'Cooked',
    'Uncooked',
    'Cooked',
    'Uncooked',
    'Cooked',
  ];
  List <String> foodType =[
    'Rice',
    'Fish',
    'Rice',
    'Fish',
    'Rice',
    'Fish',
  ];
  List <String> date =[
    '13-7-2022',
    '18-7-2022',
    '13-7-2022',
    '18-7-2022',
    '13-7-2022',
    '18-7-2022',
  ];
  List <String> quantity =[
    'kilo',
    'meals',
    'kilo',
    'meals',
    'kilo',
    'meals',
  ];

  late int itemCount=type.length;
  int counter =0;
  void minus (){
    counter--;

    emit(CounterMinusState(counter));
  }
  void plus () {
    counter ++;
    emit(CounterPlusState(counter));
  }



  //clothes
  List <String> gender =[
    'Men',
    'Women',
    'Children',
    'Men',
    'Women',
    'Children',

  ];
  List <String> clothesType =[
    'T_Shirt',
    'Jacket',
    'Pants',
    'T_Shirt',
    'Jacket',
    'Pants',

  ];
  List <String> size =[
    'Small',
    'Medium',
    'Large',
    'Small',
    'Medium',
    'Large',

  ];
  List <String> quantityOfClothes =[
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',

  ];
  late int itemClothesCount=clothesType.length;
}

