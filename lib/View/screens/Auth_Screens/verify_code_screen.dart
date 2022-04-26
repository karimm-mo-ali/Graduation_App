// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/Style/Colors.dart';
import 'package:flutter_graduation/View/screens/Auth_Screens/create_new_pass_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../helpers/myApplication.dart';
import '../../widgets/btn_widget.dart';
import '../../widgets/verify_container_widget.dart';

class VerifyCodeScreen extends StatefulWidget {
  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen>
    with TickerProviderStateMixin {
  late FocusNode num1;
  late FocusNode num2;
  late FocusNode num3;
  late FocusNode num4;
  late FocusNode num5;
  late FocusNode num6;
  TextEditingController code1EditingController = TextEditingController();
  TextEditingController code2EditingController = TextEditingController();
  TextEditingController code3EditingController = TextEditingController();
  TextEditingController code4EditingController = TextEditingController();
  TextEditingController code5EditingController = TextEditingController();
  TextEditingController code6EditingController = TextEditingController();
  String code = '';

  // onPressedVerify(BuildContext context) async {
  //   FocusScopeNode currentFocus = FocusScope.of(context);
  //   if (!currentFocus.hasPrimaryFocus) {
  //     currentFocus.unfocus();
  //   }
  //   if (!await MyApplication.checkConnection()) {
  //     Fluttertoast.showToast(
  //         msg: "no Internet",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.SNACKBAR,
  //         timeInSecForIosWeb: 3,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     return;
  //   }
  //
  //   var code1 = code1EditingController.text.toString().trim();
  //   var code2 = code2EditingController.text.toString().trim();
  //   var code3 = code3EditingController.text.toString().trim();
  //   var code4 = code4EditingController.text.toString().trim();
  //   setState(() {
  //     code = code1 + code2 + code3 + code4;
  //   });
  //   VerificationCubit.context = context;
  //   VerificationCubit.code = code;
  //   VerificationCubit.type = widget.type;
  //   VerificationCubit.phone = widget.phone;
  //   BlocProvider.of<VerificationCubit>(context).Verification();
  // }

  @override
  void initState() {
    super.initState();
    num1 = FocusNode();
    num2 = FocusNode();
    num3 = FocusNode();
    num4 = FocusNode();
    num5 = FocusNode();
    num6 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    num1.dispose();
    num2.dispose();
    num3.dispose();
    num4.dispose();
    num5.dispose();
    num6.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  var currentFocus;
  unFocus() {
    currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: unFocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.white,
        body: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: size.height * .1, bottom: size.height * .05),
                    child: Center(
                      child: Image.asset("assets/logo.png",
                          height: size.height * 0.2),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * .05, bottom: 10),
                    child: Center(
                      child: Text("Verify Code",
                          style:
                              TextStyle(color: Constants.HINT, fontSize: 28)),
                    ),
                  ),
                  Center(
                    child: Text(
                        "Please enter your messages &enter\nthe verification code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.HINT.withOpacity(0.8),
                            fontSize: 16,
                            height: 1.6)),
                  ),
                  SizedBox(height: size.height * .05),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                    child: Row(
                      children: [
                        VerifyContainerWidget(
                          textEditingController: code1EditingController,
                          focusNode: num1,
                          onChanged: (value) {
                            setState(() {});
                            nextField(value, num2);
                          },
                        ),
                        VerifyContainerWidget(
                            textEditingController: code2EditingController,
                            focusNode: num2,
                            onChanged: (value) {
                              setState(() {});
                              nextField(value, num3);
                            }),
                        VerifyContainerWidget(
                            textEditingController: code3EditingController,
                            focusNode: num3,
                            onChanged: (value) {
                              setState(() {});
                              nextField(value, num4);
                            }),
                        VerifyContainerWidget(
                            textEditingController: code4EditingController,
                            focusNode: num4,
                            onChanged: (value) {
                              setState(() {});
                              nextField(value, num5);
                            }),
                        VerifyContainerWidget(
                            textEditingController: code5EditingController,
                            focusNode: num5,
                            onChanged: (value) {
                              setState(() {});
                              nextField(value, num6);
                            }),
                        VerifyContainerWidget(
                            textEditingController: code6EditingController,
                            focusNode: num6,
                            onChanged: (value) {
                              setState(() {});
                              if (value.length == 1) {
                                num6.unfocus();
                              }
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  BtnWidget(
                      txt: 'Verify',
                      color: isValid()
                          ? Constants.primaryAppColor
                          : Constants.primaryAppColor.withOpacity(0.6),
                      onClicked: () async {
                        MyApplication.navigateToReplace(
                            context,
                            CreateNewPassScreen(
                                tokenCode:
                                    "${code1EditingController.text}${code2EditingController.text}${code3EditingController.text}${code4EditingController.text}${code5EditingController.text}${code6EditingController.text}"));
                      }),
                  const SizedBox(height: 25),
                  Center(
                    child: Text.rich(TextSpan(
                        text: "Haven't received a code? ",
                        style: TextStyle(
                            color: Constants.HINT.withOpacity(0.5),
                            fontSize: 12),
                        children: [
                          TextSpan(
                              text: "Send Again",
                              style: TextStyle(
                                  color: Constants.primaryAppColor,
                                  fontSize: 12))
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isValid() {
    return !(code1EditingController.text.trim().isEmpty ||
        code2EditingController.text.trim().isEmpty ||
        code3EditingController.text.trim().isEmpty ||
        code4EditingController.text.trim().isEmpty ||
        code5EditingController.text.trim().isEmpty ||
        code6EditingController.text.trim().isEmpty);
  }
}
