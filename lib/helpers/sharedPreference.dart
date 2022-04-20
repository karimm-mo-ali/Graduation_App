// ignore_for_file: file_names
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? sharedPrefs;

  Future<void> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  String get token => sharedPrefs!.getString(keyToken) ?? "";

  String get name => sharedPrefs!.getString(userName) ?? "";

  String get picture => sharedPrefs!.getString(userPicture) ?? "";

  String get email => sharedPrefs!.getString(keyEmail) ?? "";

  String get fcmtoken => sharedPrefs!.getString(fcmToken) ?? "";

  bool getIsUnBoarded() {
    return sharedPrefs!.getBool(keyUnBoarded) ?? false;
  }

  bool getSignedIn() {
    return sharedPrefs!.getBool(keySignedIn) ?? false;
  }

  setToken(String? value) {
    sharedPrefs?.setString(keyToken, value!);
  }

  String getToken() {
    return sharedPrefs?.getString(keyToken) ?? '';
  }

  setName(String? value) {
    sharedPrefs?.setString(userName, value!);
  }

  String getUserName() {
    return sharedPrefs?.getString(userName) ?? "";
  }

  setPicture(String? value) {
    sharedPrefs?.setString(userPicture, value!);
  }

  String getUserPhoto() {
    return sharedPrefs?.getString(userPicture) ?? "";
  }

  setFcm(String value) {
    sharedPrefs!.setString(fcmToken, value);
  }

  // setEmail(String value) {
  //   sharedPrefs!.setString(keyEmail, value);
  // }

  setSignedIn(bool? value) {
    sharedPrefs?.setBool(keySignedIn, value!);
  }

  setIsUnBoarded(bool value) {
    sharedPrefs!.setBool(keyUnBoarded, value);
  }

  void removeToken() {
    sharedPrefs!.remove(keyToken);
  }
}

final sharedPrefs = SharedPrefs();

// constants/strings.dart
String keyToken = "key_token";
String userName = "key_name";
String userPicture = "key_pic";
String fcmToken = "Fcm_key";
String keyEmail = "key_email";
String keyUnBoarded = "key_unBoarded";
String keySignedIn = "key_signedIn";
// ignore: constant_identifier_names
const String LAGUAGE_CODE = 'languageCode';
