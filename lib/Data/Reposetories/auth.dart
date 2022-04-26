// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_graduation/Data/Models/Auth_Models/reset_pass_model.dart';
import 'package:flutter_graduation/Data/Models/Auth_Models/signUp_model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Style/Colors.dart';
import '../../../app/keys.dart';
import '../../app/global.dart';
import '../../helpers/sharedPreference.dart';
import '../Models/Auth_Models/forget_pass_model.dart';
import '../Models/Auth_Models/login_model.dart';
import '../Models/Auth_Models/logout_model.dart';

class AuthRepo {
  ///Create Login Cycle
  Future<LoginModel?> login(
      {String? email, String? pass, required bool rememberMe}) async {
    try {
      var response = await http
          .post(Uri.parse("$apiKey/users/login"), headers: headers, body: {
        'Email': email,
        'Password': '$pass',
      });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final userdata = LoginModel.fromJson(jsonDecode(response.body));
        sharedPrefs.setToken(userdata.data.token);
        sharedPrefs.setId(userdata.data.user.id.toString());
        if (rememberMe) {
          sharedPrefs.setSignedIn(true);
        } else {
          sharedPrefs.setSignedIn(false);
        }
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return userdata;
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

  ///Create SignUp Cycle
  Future<SignUpModel?> signUP(
      {String? firstName,
      String? lastName,
      String? gender,
      String? email,
      String? phone,
      String? address,
      String? password,
      File? photo}) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse("$apiKey/users/register"));
      request.headers.addAll(headers!);
      request.fields["First_Name"] = firstName!;
      request.fields["Last_Name"] = lastName!;
      request.fields["Gender"] = gender!;
      request.fields["Email"] = email!;
      request.fields["Phone"] = phone!;
      request.fields["Address"] = address!;
      request.fields["Password"] = password!;
      request.files
          .add(await http.MultipartFile.fromPath('photo', photo!.path));
      var response = await request.send();
      Map<String, dynamic> responseMap;
      response.stream.transform(utf8.decoder).listen((value) {
        responseMap = json.decode(value);
        if (response.statusCode == 200 && responseMap['status'] == true) {
          //  final userdata = SignUpModel.fromJson(jsonDecode(response.body));
          print(firstName);
          print(lastName);
          print(gender);
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
          // return userdata;
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
        // return false;
      });
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    }

    // try {
    //   var response = await http
    //       .post(Uri.parse("$apiKey/users/register"), headers: headers, body: {
    //     'Gender': gender,
    //     'First_Name': '$firstName',
    //     'Last_Name': lastName,
    //     'Email': '$email',
    //     'Password': password,
    //     'Phone': '$phone',
    //     'Address': address,
    //     'photo': '$photo',
    //   });
    //   Map<String, dynamic> responseMap = json.decode(response.body);
    //   if (response.statusCode == 200 && responseMap["status"] == true) {
    //     final userdata = SignUpModel.fromJson(jsonDecode(response.body));
    //     print(firstName);
    //     print(lastName);
    //     print(gender);
    //     print(email);
    //     print(phone);
    //     print(address);
    //     print(photo);
    //     print("response after signUp : ${response.body}");
    //     Fluttertoast.showToast(
    //         msg: responseMap["msg"],
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.SNACKBAR,
    //         timeInSecForIosWeb: 3,
    //         backgroundColor: Constants.primaryAppColor,
    //         textColor: Constants.white,
    //         fontSize: 16.0);
    //     return userdata;
    //   } else {
    //     Fluttertoast.showToast(
    //         msg: responseMap["msg"],
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.SNACKBAR,
    //         timeInSecForIosWeb: 3,
    //         backgroundColor: Constants.primaryAppColor,
    //         textColor: Constants.white,
    //         fontSize: 16.0);
    //   }
    // } on TimeoutException catch (e) {
    //   print('Timeout Error: $e');
    // } on SocketException catch (e) {
    //   print('Socket Error: $e');
    // } on Error catch (e) {
    //   print('General Error: $e');
    // }
  }

  ///Create Logout Cycle
  Future<LogoutModel?> logout() async {
    try {
      var response =
          await http.post(Uri.parse("$apiKey/users/logout"), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPrefs.token}',
      });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final logoutData = LogoutModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return logoutData;
      } else {
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.white,
            textColor: Constants.primaryAppColor,
            fontSize: 16.0);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    }
  }

  ///Create Forget Pass Cycle
  Future<ForgetPassModel?> forgetPass({String? email}) async {
    try {
      var response = await http.post(Uri.parse("$apiKey/users/forgot-password"),
          headers: headers,
          body: {
            'Email': email,
          });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final forgetData = ForgetPassModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return forgetData;
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

  ///Create resetPass Cycle
  Future<ResetPassModel?> resetPass(
      {String? token, String? newPassword}) async {
    try {
      var response = await http.post(Uri.parse("$apiKey/users/update-password"),
          headers: headers,
          body: {
            'token': token,
            'new_password': newPassword,
          });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final resetData = ResetPassModel.fromJson(jsonDecode(response.body));
        Fluttertoast.showToast(
            msg: responseMap["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Constants.primaryAppColor,
            textColor: Constants.white,
            fontSize: 16.0);
        return resetData;
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
