// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_graduation/Data/Models/Home_Models/clothes_request_model.dart';
import 'package:flutter_graduation/Data/Models/Home_Models/food_request_model.dart';
import 'package:flutter_graduation/Data/Models/Home_Models/clothes_donation_model.dart';
import 'package:flutter_graduation/Data/Models/Home_Models/food_donation_model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Style/Colors.dart';
import '../../../app/keys.dart';
import '../../app/global.dart';
import '../../helpers/sharedPreference.dart';

class HomeRepo {
  ///Create Food Request Cycle
  Future<FoodRequestModel?> requestFood({
    String? type,
    String? foodSource,
    String? typeFood,
    String? expDate,
    String? typeQuantity,
    String? quantity,
    String? deliveryType,
    String? location,
    String? needyAddresses,
  }) async {
    try {
      var response = await http.post(
          Uri.parse("$apiKey/foodrequest/insert-food-request"),
          headers: headers,
          body: {
            "User_id": sharedPrefs.id,
            "Type": type,
            "Food_Source": foodSource,
            "Type_of_food": typeFood,
            "Expiration_Date": expDate,
            "Type_of_Quantity": typeQuantity,
            "Quantity": quantity,
            "Delivery_Type": deliveryType,
            "Location": location,
            "Needy_Addresses": needyAddresses
          });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final insertFoodRequest =
            FoodRequestModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return insertFoodRequest;
      } else {
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    }
  }

  ///Create Clothes Request Cycle
  Future<ClothesRequestModel?> requestClothes({
    String? gender,
    String? type,
    String? size,
    String? quantity,
    String? deliveryType,
    String? location,
    String? needyAddresses,
  }) async {
    try {
      var response = await http.post(
          Uri.parse("$apiKey/clothesrequest/insert-clothes-request"),
          headers: headers,
          body: {
            "User_id": sharedPrefs.id,
            "Type": type,
            "Gender": gender,
            "Size": size,
            "Quantity": quantity,
            "Delivery_Type": deliveryType,
            "Location": location,
            "Needy_Addresses": needyAddresses
          });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final insertClothesRequest =
            ClothesRequestModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return insertClothesRequest;
      } else {
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
  }

  ///Create Food Donation Cycle
  Future<FoodRequestModel?> donateFood({
    String? type,
    String? foodSource,
    String? typeFood,
    String? expDate,
    String? typeQuantity,
    String? quantity,
    String? deliveryType,
    String? location,
  }) async {
    try {
      var response = await http.post(
          Uri.parse("$apiKey/fooddonate/insert-food-donation"),
          headers: headers,
          body: {
            "User_id": sharedPrefs.id,
            "Type": type,
            "Food_Source": foodSource,
            "Type_of_food": typeFood,
            "Expiration_Date": expDate,
            "Type_of_Quantity": typeQuantity,
            "Quantity": quantity,
            "Delivery_Type": deliveryType,
            "Location": location
          });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final insertFoodDonation =
            FoodRequestModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return insertFoodDonation;
      } else {
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
  }

  ///Create Clothes Donation Cycle
  Future<ClothesRequestModel?> donateClothes({
    String? gender,
    String? type,
    String? size,
    String? quantity,
    String? deliveryType,
    String? location,
  }) async {
    try {
      var response = await http.post(
          Uri.parse("$apiKey/clothesdonte/insert-clothes-donation"),
          headers: headers,
          body: {
            "User_id": sharedPrefs.id,
            "Type": type,
            "Gender": gender,
            "Size": size,
            "Quantity": quantity,
            "Delivery_Type": deliveryType,
            "Location": location
          });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final insertClothesDonation =
            ClothesRequestModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return insertClothesDonation;
      } else {
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
  }
}
