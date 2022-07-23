import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_graduation/Style/Colors.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/Request_Api/clothes_request_model.dart';
import 'package:flutter_graduation/app/global.dart';
import 'package:flutter_graduation/app/keys.dart';
import 'package:flutter_graduation/helpers/sharedPreference.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RequestRepo{
  Future<NewClothesRequestModel?> getNewClothesRequest() async {
    try {
      var http;
      var response = await http.get(
        Uri.parse('$apiKey/clothesdonte/get-clothesdonations/${sharedPrefs.id}'),
        headers: headers,
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      print(responseMap.toString());
      if (response.statusCode == 200 && responseMap['status'] == true) {
        final data = NewClothesRequestModel.fromJson(jsonDecode(response.body));
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
