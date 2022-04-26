// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/widgets/btn_widget.dart';
import 'package:flutter_graduation/View/widgets/txtfield_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Data/Cubit/change_pass_cubit/change_pass_cubit.dart';
import '../../../Data/Cubit/change_pass_cubit/change_pass_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with TickerProviderStateMixin {
  final TextEditingController currentPassTextEditingController =
      TextEditingController();
  final TextEditingController newPassTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController confirmPassTextEditingController =
      TextEditingController();

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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          // leading: InkWell(
          //   onTap: () => Navigator.pop(context),
          //   child: const Padding(
          //     padding: EdgeInsetsDirectional.only(start: 10),
          //     child: Icon(Icons.arrow_back_ios),
          //   ),
          // ),
          title: const Text("Change Password", style: TextStyle(fontSize: 19)),
        ),
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Constants.primaryAppColor,
        //   elevation: 0.0,
        //   leading: InkWell(
        //     onTap: () => Navigator.pop(context),
        //     child: const Padding(
        //       padding: EdgeInsetsDirectional.only(start: 10),
        //       child: Icon(Icons.arrow_back_ios),
        //     ),
        //   ),
        //   title: const Text("Change Password", style: TextStyle(fontSize: 19)),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 30, top: size.height * 0.05, end: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    // shrinkWrap: true,
                    // physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text('Current password',
                            style:
                                TextStyle(color: Constants.HINT, fontSize: 15)),
                      ),
                      SizedBox(height: size.height * .01),
                      TxtFieldWidget(
                          hintTxt: "*************",
                          textEditingController:
                              currentPassTextEditingController,
                          isHasNextFocus: true,
                          textInputType: TextInputType.visiblePassword),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text('New password',
                            style:
                                TextStyle(color: Constants.HINT, fontSize: 15)),
                      ),
                      SizedBox(height: size.height * .01),
                      TxtFieldWidget(
                        hintTxt: "*************",
                        textEditingController: newPassTextEditingController,
                        isHasNextFocus: true,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text('Confirmation new password',
                            style:
                                TextStyle(color: Constants.HINT, fontSize: 15)),
                      ),
                      SizedBox(height: size.height * .01),
                      TxtFieldWidget(
                        hintTxt: "***************",
                        textEditingController: confirmPassTextEditingController,
                        isHasNextFocus: false,
                        textInputType: TextInputType.visiblePassword,
                        pass: newPassTextEditingController.text.toString(),
                      ),
                      SizedBox(height: size.height * 0.04),
                      BlocBuilder<ChangePassCubit, ChangePassState>(
                          builder: (context, state) {
                            if (state is ChangePassLoading) {
                              return SpinKitThreeBounce(
                                color: Constants.primaryAppColor,
                                size: size.width * .08,
                              );
                            } else {
                              return BtnWidget(
                                txt: "change password",
                                color: Constants.primaryAppColor,
                                onClicked: () async {
                                  MyApplication.checkConnection().then((value) {
                                    if (_formKey.currentState!.validate()) {
                                      if (value == true) {
                                        BlocProvider.of<ChangePassCubit>(context)
                                            .changePass(
                                            currentPassword:
                                            currentPassTextEditingController
                                                .text,
                                            newPassword:
                                            newPassTextEditingController.text,
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
            ],
          ),
        ),
      ),
    );
  }
}
