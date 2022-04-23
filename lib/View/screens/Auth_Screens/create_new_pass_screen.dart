// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Style/Colors.dart';
import '../../widgets/btn_widget.dart';
import '../../widgets/txtfield_widget.dart';

class CreateNewPassScreen extends StatefulWidget {
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
  bool obscure = true;
  bool matching = false;
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
        // appBar: GlobalAppBar(
        //   enableBackButton: false,
        //   height: size.height * 0.3,
        //   child: SvgPicture.asset("assets/images/Logo Icon.svg",
        //       height: size.height * 0.21),
        // ),
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
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Visibility(
                  //     visible: matching &&
                  //         passTextEditingController.text.toString().isNotEmpty,
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         SvgPicture.asset(
                  //           "assets/images/valide_phone.svg",
                  //           fit: BoxFit.fill,
                  //           height: 20.0,
                  //           width: 20.0,
                  //           color: const Color(0xFF80AF50),
                  //         ),
                  //         const SizedBox(
                  //           width: 10.0,
                  //         ),
                  //         Text(getTranslated(context, 'matPss')!,
                  //             style: const TextStyle(
                  //                 color: Constants.HINT, fontSize: 10)),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Visibility(
                  //   visible: matching && passTextEditingController.text.toString().isNotEmpty,
                  //   child: Align(
                  //     alignment: Alignment.centerRight,
                  //     child: Row(
                  //       children: [
                  //         SvgPicture.asset(
                  //           "assets/images/match.svg",
                  //           fit: BoxFit.fill,
                  //           color: const Color(0xFF80AF50),
                  //         ),
                  //          Text(getTranslated(context, 'matPss')!,
                  //             style:
                  //             const  TextStyle(color: Constants.HINT, fontSize: 10)),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.04),
                  BtnWidget(
                    txt: "Change Password",
                    color: Constants.primaryAppColor,
                    onClicked: () {},
                  )
                  // BlocBuilder<UpdatePassCubit, UpdatePassState>(
                  //     builder: (context, state) {
                  //       if (state is UpdatePassLoading) {
                  //         return Column(
                  //           children: [
                  //             SizedBox(height: size.height * 0.06),
                  //             SpinKitThreeBounce(
                  //               color: Constants.primaryAppColor,
                  //               size: size.width * .08,
                  //             ),
                  //           ],
                  //         );
                  //       } else {
                  //         return Column(
                  //           children: [
                  //             SizedBox(height: size.height * 0.06),
                  //             BtnWidget(
                  //               txt: getTranslated(context, 'chPass')!,
                  //               color: Constants.primaryAppColor,
                  //               onClicked: () async {
                  //                 final FormState form = _formKey.currentState!;
                  //                 if (form.validate()) {
                  //                   if (!await MyApplication.checkConnection()) {
                  //                     Fluttertoast.showToast(
                  //                         msg: getTranslated(context, 'noInternet')!,
                  //                         toastLength: Toast.LENGTH_SHORT,
                  //                         gravity: ToastGravity.SNACKBAR,
                  //                         timeInSecForIosWeb: 3,
                  //                         backgroundColor: Colors.red,
                  //                         textColor: Colors.white,
                  //                         fontSize: 16.0);
                  //                     return;
                  //                   }
                  //                   UpdatePassCubit.context = context;
                  //                   UpdatePassCubit.phone =
                  //                       widget.phone;
                  //                   UpdatePassCubit.password =
                  //                       confirmPassTextEditingController.text;
                  //                   UpdatePassCubit.token = widget.token;
                  //                   BlocProvider.of<UpdatePassCubit>(context)
                  //                       .UpdatePass();
                  //                 }
                  //               },
                  //             ),
                  //           ],
                  //         );
                  //       }
                  //     }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
