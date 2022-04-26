// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_graduation/Data/Models/SideMenu_Models/contactUs_model.dart';
import 'package:flutter_graduation/helpers/sharedPreference.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Style/Colors.dart';
import '../../../app/keys.dart';
import '../../app/global.dart';
import '../Models/SideMenu_Models/change_pass_model.dart';
import '../Models/SideMenu_Models/edit_profile_model.dart';
import '../Models/SideMenu_Models/profile_info_model.dart';

class UserRepo {
  ///Create Edit Profile Cycle
  Future<EditProfileModel?> editProfile(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? address,
      File? photo}) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("$apiKey/users/update-profile/${sharedPrefs.id}"));
      request.headers.addAll(headers!);
      request.fields["First_Name"] = firstName!;
      request.fields["Last_Name"] = lastName!;
      request.fields["Email"] = email!;
      request.fields["Phone"] = phone!;
      request.fields["Address"] = address!;
      request.files
          .add(await http.MultipartFile.fromPath('photo', photo!.path));
      var response = await request.send();
      Map<String, dynamic> responseMap;
      response.stream.transform(utf8.decoder).listen((value) {
        responseMap = json.decode(value);
        if (response.statusCode == 200 && responseMap['status'] == true) {
          print(firstName);
          print(lastName);
          print(email);
          print(phone);
          print(address);
          print(photo);
          Fluttertoast.showToast(
              msg: responseMap["msg"],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 3,
              backgroundColor: Constants.primaryAppColor,
              textColor: Constants.white,
              fontSize: 16.0);
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
      });
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
  }

  ///Create Change Password Cycle
  Future<ChangePasswordModel?> changePass(
      {String? currentPassword, String? newPassword}) async {
    try {
      var response = await http.post(
          Uri.parse('$apiKey/users/change-password/${sharedPrefs.id}'),
          headers: headers,
          body: {
            'old_Password': currentPassword,
            'new_Password': newPassword,
          });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap['status'] == true) {
        final data = ChangePasswordModel.fromJson(jsonDecode(response.body));
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

  ///Create ContactUs Cycle
  Future<ContactUsModel?> contactUs(
      {String? firstName,
      String? lastName,
      String? email,
      String? message,
      String? phone}) async {
    try {
      var response = await http.post(
          Uri.parse('$apiKey/contactus/insert-contact-us'),
          headers: headers,
          body: {
            "User_id": sharedPrefs.id,
            "First_Name": firstName,
            "Last_Name": lastName,
            "Email": email,
            "Message": message,
            "Phone": phone
          });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap['status'] == true) {
        final data = ContactUsModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Constants.white,
            textColor: Constants.primaryAppColor,
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

  ///Profile info Cycle
  Future<ProfileInfoModel?> getProfileInfo() async {
    try {
      print(sharedPrefs.token);
      var response = await http.get(
        Uri.parse('$apiKey/users/profile/${sharedPrefs.id}'),
        headers: headers,
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      print(responseMap.toString());
      if (response.statusCode == 200 && responseMap['status'] == true) {
        final data = ProfileInfoModel.fromJson(jsonDecode(response.body));
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
