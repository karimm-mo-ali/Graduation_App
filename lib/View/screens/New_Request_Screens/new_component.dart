import 'package:flutter/material.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/new_request_cubit.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/send_screen.dart';
import 'package:flutter_graduation/View/widgets/reusable_component.dart';

Widget buildRequestFoodItem(
  context, {
  String? quantity,
  String? type,
  String? date,
  String? foodType,
  String? quantityType,
}) =>
    InkWell(
      onTap: () async {
        navigateAndFinish(context, SendScreen());
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30), //border corner radius
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.5), //color of shadow
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
                children: [
                  //type
                  Expanded(
                    child: Text(
                      '$foodType',
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),

                  //quantity
                  Text(
                    '$quantity',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ' $quantityType',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

//Clothes Request
Widget buildRequestClothesItem(
  context, {
  String? clothesType,
  String? size,
  String? gender,
  String? quantityOfClothes,
}) =>
    InkWell(
      onTap: () async {
        navigateAndFinish(context, SendScreen());
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30), //border corner radius
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.5), //color of shadow
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
                children: [
                  //type
                  Expanded(
                    child: //clothes type
                        Text(
                      '$clothesType',
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w600),
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
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

//Button
Widget defaultButton({
  double? height,
  double width = double.infinity,
  Color backgroundColor = Colors.green,
  required Function onPressed,
  required String buttonCalled,
  bool isUpperCase = true,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed(),
        child: Text(
          buttonCalled.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
