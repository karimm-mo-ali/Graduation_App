import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_graduation/Style/Colors.dart';
import 'package:flutter_graduation/Data/Models/Requests_Models/getClothes_request_model.dart';
import 'package:flutter_graduation/Data/Models/Requests_Models/getFood_request_model.dart';
import 'package:flutter_graduation/app/global.dart';
import 'package:flutter_graduation/app/keys.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RequestRepo {
  Future<GetClothesRequestsModel?> getClothesRequests() async {
    try {
      var response = await http.get(
        Uri.parse('$apiKey/clothesrequest/get-clothesrequests'),
        headers: headers,
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      print(responseMap.toString());
      if (response.statusCode == 200 && responseMap['status'] == true) {
        final data =
            GetClothesRequestsModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return data;
      } else {
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
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

  Future<GetFoodRequestsModel?> getFoodRequests() async {
    try {
      var response = await http.get(
        Uri.parse('$apiKey/foodrequest/get-foodrequests'),
        headers: headers,
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      print(responseMap.toString());
      if (response.statusCode == 200 && responseMap['status'] == true) {
        final data = GetFoodRequestsModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return data;
      } else {
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
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
