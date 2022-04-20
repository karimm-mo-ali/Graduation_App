// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_graduation/Data/Models/signUp_model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Style/Colors.dart';
import '../../../app/keys.dart';
import '../../app/global.dart';
import '../../helpers/sharedPreference.dart';
import '../Models/user_model.dart';

class AuthRepo {
  ///Create Login Cycle
  Future<UserModel?> login(
      {String? email, String? pass, required bool rememberMe}) async {
    try {
      var response = await http
          .post(Uri.parse("$apiKey/users/login"), headers: headers, body: {
        'Email': email,
        'Password': '$pass',
      });
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200 && responseMap["status"] == true) {
        final userdata = UserModel.fromJson(jsonDecode(response.body));
        if (rememberMe) {
          sharedPrefs.setSignedIn(true);
          sharedPrefs.setToken(userdata.data.token);
        } else {
          sharedPrefs.setSignedIn(false);
        }
        print("token after login : ${userdata.data.token}");
        print("email after login : $email");
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

  //
  // ///Create Account Details Cycle
  // Future<bool?> editAccountDetails(
  //     {String? token,
  //       String? name,
  //       File? avatar,
  //       bool? image,
  //       BuildContext? context}) async {
  //   try {
  //     var request = http.MultipartRequest(
  //         'POST',
  //         Uri.parse(
  //             '$Apikey/updateData?name=$name&api_token=${sharedPrefs.token}&avatar=$avatar'));
  //     request.headers.addAll(Constants.headers);
  //     request.fields["name"] = name!;
  //     request.fields["token"] = token!;
  //     if (image!) {
  //       request.files
  //           .add(await http.MultipartFile.fromPath('avatar', avatar!.path));
  //     }
  //     var response = await request.send();
  //     Map<String, dynamic> responseMap;
  //     response.stream.transform(utf8.decoder).listen((value) {
  //       responseMap = json.decode(value);
  //       if (response.statusCode == 200 && responseMap['success'] == true) {
  //         // final data = UpdateDataModel.fromJson(responseMap);
  //         Fluttertoast.showToast(
  //             msg: responseMap["message"],
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 1,
  //             backgroundColor: Constants.primaryAppColor,
  //             textColor: Constants.whiteAppColor,
  //             fontSize: 16.0);
  //         Navigator.pop(context!);
  //         // return data;
  //       } else {
  //         Fluttertoast.showToast(
  //             msg: responseMap["message"],
  //             toastLength: Toast.LENGTH_LONG,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 1,
  //             backgroundColor: Constants.primaryAppColor,
  //             textColor: Constants.whiteAppColor,
  //             fontSize: 16.0);
  //       }
  //       // return false;
  //     });
  //   } on TimeoutException catch (e) {
  //     print('Timeout Error: $e');
  //   } on SocketException catch (e) {
  //     print('Socket Error: $e');
  //   }
  // }

  // ///Create forget password Cycle
  // Future<ForgetPassModel?> forgetPass(String email) async {
  //   try {
  //     var response = await http
  //         .post(Uri.parse('$apiKey/forget_password'), headers: headers, body: {
  //       'email': email,
  //     });
  //     print("email===> $email");
  //     Map<String, dynamic> responseMap = json.decode(response.body);
  //     if (response.statusCode == 200 && responseMap["success"] == true) {
  //       return ForgetPassModel.fromJson(responseMap);
  //     } else {
  //       print("statusCodee====>  ${response.statusCode.toString()}");
  //       print("response====>  ${response.body.toString()}");
  //       print(response.reasonPhrase.toString());
  //       Fluttertoast.showToast(
  //           msg: responseMap["message"],
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colours.primaryAppColor,
  //           textColor: Colours.whiteColor,
  //           fontSize: 16.0);
  //     }
  //   } on TimeoutException catch (e) {
  //     print('Timeout Error: $e');
  //   } on SocketException catch (e) {
  //     print('Socket Error: $e');
  //   } on Error catch (e) {
  //     print('General Error: $e');
  //   }
  // }
  //
  // ///Create update password Cycle
  // Future<UpdatePassModel?> updatePass(
  //     String password, String passwordConf, String token) async {
  //   try {
  //     var response = await http
  //         .post(Uri.parse('$apiKey/changePassword'), headers: headers, body: {
  //       'api_token': token,
  //       'password': password,
  //       'password_confirmation': passwordConf,
  //     });
  //     print("api_token====> $token");
  //     print("password====> $password");
  //     print("password_confirmation====> $passwordConf");
  //     Map<String, dynamic> responseMap = json.decode(response.body);
  //     if (response.statusCode == 200 && responseMap["success"] == true) {
  //       return UpdatePassModel.fromJson(responseMap);
  //     } else {
  //       print("statusCodee====>  ${response.statusCode.toString()}");
  //       print("response====>  ${response.body.toString()}");
  //       print(response.reasonPhrase.toString());
  //       Fluttertoast.showToast(
  //           msg: responseMap["message"],
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colours.primaryAppColor,
  //           textColor: Colours.whiteColor,
  //           fontSize: 16.0);
  //     }
  //   } on TimeoutException catch (e) {
  //     print('Timeout Error: $e');
  //   } on SocketException catch (e) {
  //     print('Socket Error: $e');
  //   } on Error catch (e) {
  //     print('General Error: $e');
  //   }
  // }
}
