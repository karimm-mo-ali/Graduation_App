import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_component.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_cubit.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_states.dart';


class ClothesRequest extends StatelessWidget {
  const ClothesRequest({Key? key}) : super(key: key);

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
                    ' Clothes Request',
                    style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                  ),
                ),
              body: ConditionalBuilder(
                  condition: true,
                  builder: (context)=>ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>buildRequestClothesItem(
                        context ,

                        clothesType: CounterCubit.get(context).clothesType[index],
                        size: CounterCubit.get(context).size[index],
                        gender: CounterCubit.get(context).gender[index],
                        quantityOfClothes: CounterCubit.get(context).quantityOfClothes[index],
                      ),
                      separatorBuilder: (context ,index)=>SizedBox(
                      ),

                      itemCount:CounterCubit.get(context).itemClothesCount)
              ),
            );
          }

      ),
    );
  }
}
