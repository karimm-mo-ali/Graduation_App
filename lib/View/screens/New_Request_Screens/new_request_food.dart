

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_component.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_cubit.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_states.dart';

class FoodRequest extends StatelessWidget {
  const FoodRequest({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) =>CounterCubit(),

      child: BlocConsumer <CounterCubit , CounterStates>(
          listener: (context ,state){
            if(state is CounterMinusState) print('Minus state ${state.counter}');
            if(state is CounterPlusState) print('Plus state ${state.counter}');
          },
          builder: (context ,state){

            int counter =CounterCubit.get(context).counter;



            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  ' Food Request',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
              ),
              body: ConditionalBuilder(
                  condition: true,
                  builder: (context)=>ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>buildRequestFoodItem(
                        context ,
                        counter: counter,
                        type: CounterCubit.get(context).type[index],
                        date: CounterCubit.get(context).date[index],
                        foodType: CounterCubit.get(context).foodType[index],
                        quantity: CounterCubit.get(context).quantity[index],
                      ),
                      separatorBuilder: (context ,index)=>SizedBox(
                      ),

                      itemCount:CounterCubit.get(context).itemCount)
              ),
            );
          }

      ),
    );



  }
}