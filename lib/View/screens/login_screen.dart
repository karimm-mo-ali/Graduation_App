// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/screens/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Data/Cubit/login_cubit/login_cubit.dart';
import '../../Data/Cubit/login_cubit/login_state.dart';
import '../../Style/Colors.dart';
import '../../helpers/myApplication.dart';
import '../widgets/btn_widget.dart';
import '../widgets/txtfield_widget.dart';
import 'forget_pass_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var check = false;
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // bool matchingPhone = false;
  // final FocusNode phoneFocusNode = FocusNode();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // phoneTextEditingController.addListener(() {
  //   //   setState(() {
  //   //     matchingPhone = (phoneTextEditingController.text.trim().length == 9 &&
  //   //         phoneTextEditingController.text.trim().isNotEmpty);
  //   //   });
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * .1, bottom: size.height * .05),
                  child: Center(
                    child: Image.asset("assets/logo.png",
                        height: size.height * 0.2),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 30.0, end: 30.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: const Text("Please Sign In",
                          style:
                              TextStyle(color: Constants.HINT, fontSize: 18)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 30.0,
                      right: 30.0),
                  child: Column(children: [
                    Column(
                      children: [
                        TxtFieldWidget(
                          hintTxt: "Email Address",
                          textInputType: TextInputType.emailAddress,
                          textEditingController: emailTextEditingController,
                          isHasNextFocus: true,
                        ),
                        TxtFieldWidget(
                          hintTxt: "Password",
                          textInputType: TextInputType.visiblePassword,
                          textEditingController: passwordTextEditingController,
                          isHasNextFocus: false,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: InkWell(
                        onTap: () => MyApplication.navigateTo(
                            context, ForgetPassScreen()),
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                color:
                                    Constants.primaryAppColor.withOpacity(0.6),
                                fontSize: 12)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Checkbox(
                              activeColor: Constants.primaryAppColor,
                              value: check,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (val) {
                                setState(() {
                                  check = val!;
                                });
                              }),
                        ),
                        const SizedBox(width: 10),
                        const Text("Remember me",
                            style: TextStyle(
                                color: Constants.HINT, fontSize: 12.5)),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                    Center(
                      child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                        if (state is LoginLoading) {
                          return SpinKitThreeBounce(
                            color: Constants.primaryAppColor,
                            size: size.width * .08,
                          );
                        } else {
                          return BtnWidget(
                            txt: "Login",
                            color: Constants.primaryAppColor,
                            onClicked: () {
                              MyApplication.checkConnection().then((value) {
                                if (_formKey.currentState!.validate()) {
                                  if (value == true) {
                                    BlocProvider.of<LoginCubit>(context).login(
                                        email: emailTextEditingController.text,
                                        pass:
                                            passwordTextEditingController.text,
                                        remember: check,
                                        context: context);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'no Internet',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.SNACKBAR,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor:
                                            Constants.primaryAppColor,
                                        textColor: Constants.white,
                                        fontSize: 16.0);
                                  }
                                }
                              });
                            },
                          );
                        }
                      }),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text.rich(
                      TextSpan(
                          text: "Don't have an account ? ",
                          style: TextStyle(
                              color: Constants.HINT.withOpacity(0.5),
                              fontSize: 12),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => MyApplication.navigateToReplace(
                                    context, SignUpScreen()),
                              style: TextStyle(
                                  color: Constants.primaryAppColor,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline),
                            )
                          ]),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
