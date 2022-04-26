// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Style/Colors.dart';
import '../../../app/keys.dart';
import '../../../helpers/myApplication.dart';
import 'account_details_screen.dart';
import 'change_pass_Screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var val = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text("Settings", style: TextStyle(fontSize: 19)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                ListTile(
                  horizontalTitleGap: 5,
                  leading: SvgPicture.asset(
                    "assets/accdet.svg",
                    width: 23,
                    height: 23,
                  ),
                  title: Text("Account Details",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Constants.HINT,
                          fontWeight: FontWeight.w600)),
                  // ignore: avoid_returning_null_for_void
                  onTap: () =>
                      MyApplication.navigateTo(context, AccountDetailsScreen()),
                ),
                ListTile(
                  horizontalTitleGap: 5,
                  leading: SvgPicture.asset(
                    "assets/lock.svg",
                    width: 23,
                    height: 23,
                  ),
                  title: Text("Change Password",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Constants.HINT,
                          fontWeight: FontWeight.w600)),
                  // ignore: avoid_returning_null_for_void
                  onTap: () =>
                      MyApplication.navigateTo(context, ChangePasswordScreen()),
                ),
                ListTile(
                    horizontalTitleGap: 5,
                    leading: SvgPicture.asset(
                      "assets/lang.svg",
                      width: 23,
                      height: 23,
                    ),
                    title: Text("Language",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Constants.HINT,
                            fontWeight: FontWeight.w600)),
                    // ignore: avoid_returning_null_for_void
                    onTap: () => showAlertDialog(context)),
              ],
            ),
          )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext cont) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(5.0),
        content: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: Constants.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Text(
                    "Change Language",
                    style: const TextStyle(fontSize: 22),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "English",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                              tristate: true,
                              activeColor: Constants.primaryAppColor,
                              value: selectedLang != "ar" ? true : false,
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: Constants.primaryAppColor,
                                ),
                              ),
                              onChanged: (value) async {
                                // Locale _locale = await setLocale("en");
                                // TalabatcomDriver.setLocale(context, _locale);
                                // sharedPrefs.setLng("en");
                                // setState(() {
                                //   //  _character = value;
                                //   Constants.headers = {
                                //     'Accept': 'application/json',
                                //     'lang': "en"
                                //   };
                                selectedLang = "en";
                                Navigator.pop(context);
                              })),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Arabic",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                              value: selectedLang != "en" ? true : false,
                              activeColor: Constants.primaryAppColor,
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: Constants.primaryAppColor,
                                ),
                              ),
                              onChanged: (value) async {
                                // Locale _locale = await setLocale("ar");
                                // TalabatcomDriver.setLocale(context, _locale);
                                // sharedPrefs.setLng("ar");
                                // setState(() {
                                // //  _character = value;
                                // Constants.headers = {
                                //   'Accept': 'application/json',
                                //   'lang': "ar"
                                // };
                                selectedLang = "ar";
                                Navigator.pop(context);
                              }),
                        ),
                      ]),
                ],
              )),
        ),
      ),
    );
  }
}
