import 'package:flutter/material.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/map_utils.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_cubit.dart';

Widget buildRequestFoodItem(context, {
  int counter =0,
  String? type ,
  String? date ,
  String? foodType ,
  String? quantity ,


})=>InkWell(
  onTap:() async {
    MapUtils.openMap(30.6158239, 31.1137432);
  } ,
  child:   Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(10),
    height: 150,
    width:double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30), //border corner radius
      boxShadow:[
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), //color of shadow
          spreadRadius: 5, //spread radius
          blurRadius: 7, // blur radius
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [


          Row(
            children:  [
              //type
              Expanded(
                child: Text(
                  '$foodType',
                  style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),

              TextButton(
                onPressed: ()
                {
                  CounterCubit.get(context).minus();
                },
                child: const Text(
                  '-',
                  style: TextStyle(
                      fontSize: 15.0
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 1.0,
                ),
                child: Text(
                  '${CounterCubit.get(context).counter }',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              TextButton(
                onPressed: ()
                {
                  CounterCubit.get(context).plus();
                },
                child: const Text(
                  '+',
                  style: const TextStyle(
                      fontSize: 15.0
                  ),
                ),
              ),
              //quantity
              Text(
                '$quantity',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              //food type
              Expanded(
                child: Text(
                  '$type',
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              const SizedBox(
                width: 10.0,
              ),

              //date
              Text(
                '$date',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),



            ],
          ),




        ],
      ),
    ),
  ),
);



//Clothes Request
Widget buildRequestClothesItem(context, {

  String? clothesType ,
  String? size ,
  String? gender ,
  String? quantityOfClothes ,


})=>InkWell (
  onTap:() async {
    MapUtils.openMap(30.6158239, 31.1137432);
  } ,
  child:Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(10),
    height: 120,
    width:double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30), //border corner radius
      boxShadow:[
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), //color of shadow
          spreadRadius: 5, //spread radius
          blurRadius: 7, // blur radius
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [


          Row(
            children:  [
              //type
              Expanded(
                child: //clothes type
                Text(
                  '$clothesType',
                  style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600
                  ),
                ),



              ),
              const SizedBox(
                width: 20.0,
              ),

              //Size
              Text(
                '$size',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                ),

              ),

            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              //Gender
              Expanded(
                child: Text(
                  '$gender',
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              const SizedBox(
                width: 10.0,
              ),

              //Quantity
              Text(
                '$quantityOfClothes',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),



            ],
          ),




        ],
      ),
    ),
  ),
);