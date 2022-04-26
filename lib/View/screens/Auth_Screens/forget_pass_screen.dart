// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/screens/Auth_Screens/create_new_pass_screen.dart';
import 'package:flutter_graduation/View/screens/Auth_Screens/verify_code_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Data/Cubit/forget_pass_cubit/forget_pass_cubit.dart';
import '../../../Data/Cubit/forget_pass_cubit/forget_pass_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';
import '../../widgets/btn_widget.dart';
import '../../widgets/txtfield_widget.dart';

class ForgetPassScreen extends StatefulWidget {
  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return GestureDetector(
      onTap: unFocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.white,
        body: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 30.0,
              right: 30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * .1, bottom: size.height * .05),
                  child: Center(
                    child: Image.asset("assets/logo.png",
                        height: size.height * 0.2),
                  ),
                ),
                Center(
                  child: Text(
                      "Please enter your email address to\nreceive the verification code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.HINT.withOpacity(0.8),
                        fontSize: 16,
                      )),
                ),
                SizedBox(height: size.height * .05),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Email Address",
                      style:
                          const TextStyle(color: Constants.HINT, fontSize: 15)),
                ),
                SizedBox(height: size.height * .005),
                TxtFieldWidget(
                  hintTxt: "Email Address",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: emailTextEditingController,
                  isHasNextFocus: false,
                ),
                SizedBox(height: size.height * 0.04),
                BlocBuilder<ForgetPassCubit, ForgetPassState>(
                    builder: (context, state) {
                  if (state is ForgetPassLoading) {
                    return SpinKitThreeBounce(
                      color: Constants.primaryAppColor,
                      size: size.width * .08,
                    );
                  } else {
                    return BtnWidget(
                      txt: 'Next',
                      color: Constants.primaryAppColor,
                      onClicked: () async {
                        MyApplication.checkConnection().then((value) {
                          if (_formKey.currentState!.validate()) {
                            if (value == true) {
                              BlocProvider.of<ForgetPassCubit>(context)
                                  .forgetPass(
                                      email: emailTextEditingController.text,
                                      context: context);
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'no Internet',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 3,
                                  backgroundColor: Constants.primaryAppColor,
                                  textColor: Constants.white,
                                  fontSize: 16.0);
                            }
                          }
                        });
                      },
                    );
                  }
                }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
