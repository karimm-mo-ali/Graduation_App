// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Data/Cubit/reset_pass_cubit/reset_pass_cubit.dart';
import '../../../Data/Cubit/reset_pass_cubit/reset_pass_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';
import '../../widgets/btn_widget.dart';
import '../../widgets/txtfield_widget.dart';

class CreateNewPassScreen extends StatefulWidget {
  final String tokenCode;
  const CreateNewPassScreen({Key? key, required this.tokenCode})
      : super(key: key);

  @override
  _CreateNewPassScreenState createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen>
    with TickerProviderStateMixin {
  final TextEditingController passTextEditingController =
      TextEditingController();
  final TextEditingController confirmPassTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.tokenCode);
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
    return GestureDetector(
      onTap: unFocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.white,
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              start: 30,
              end: 30),
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
                  Container(
                    margin: EdgeInsets.only(bottom: size.height * .05),
                    child: Center(
                      child: Text("Create New Password",
                          style: TextStyle(
                              color: Constants.HINT.withOpacity(0.8),
                              fontSize: 22)),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text("New Password",
                        style: const TextStyle(
                            color: Constants.HINT, fontSize: 15)),
                  ),
                  SizedBox(height: size.height * .005),
                  TxtFieldWidget(
                    hintTxt: "*************",
                    textEditingController: passTextEditingController,
                    isHasNextFocus: true,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: size.height * 0.015),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text("Confirm Password",
                        style: const TextStyle(
                            color: Constants.HINT, fontSize: 15)),
                  ),
                  SizedBox(height: size.height * .005),
                  TxtFieldWidget(
                    hintTxt: "***************",
                    textEditingController: confirmPassTextEditingController,
                    isHasNextFocus: false,
                    textInputType: TextInputType.visiblePassword,
                    pass: passTextEditingController.text.toString(),
                  ),
                  SizedBox(height: size.height * 0.04),
                  BlocBuilder<ResetPassCubit, ResetPassState>(
                      builder: (context, state) {
                    if (state is ResetPassLoading) {
                      return SpinKitThreeBounce(
                        color: Constants.primaryAppColor,
                        size: size.width * .08,
                      );
                    } else {
                      return BtnWidget(
                        txt: "Change Password",
                        color: Constants.primaryAppColor,
                        onClicked: () async {
                          MyApplication.checkConnection().then((value) {
                            if (_formKey.currentState!.validate()) {
                              if (value == true) {
                                BlocProvider.of<ResetPassCubit>(context)
                                    .resetPass(
                                        tokenCode: widget.tokenCode,
                                        newPassword:
                                            passTextEditingController.text,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
