// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../../Style/Colors.dart';
import '../widgets/btn_widget.dart';
import '../widgets/txtfield_widget.dart';

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
    final bottom = MediaQuery.of(context).viewInsets.bottom;
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
                      "Please enter your phone number to\nreceive the verification code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Constants.HINT.withOpacity(0.7),
                          fontSize: 16,
                          height: 1.6)),
                ),
                SizedBox(height: size.height * .05),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Email Address",
                      style:
                          const TextStyle(color: Constants.HINT, fontSize: 15)),
                ),
                SizedBox(height: size.height * .015),
                TxtFieldWidget(
                  hintTxt: "Email Address",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: emailTextEditingController,
                  isHasNextFocus: false,
                ),
                SizedBox(height: size.height * 0.06),
                BtnWidget(
                  txt: 'Next',
                  color: Constants.primaryAppColor,
                  onClicked: () {},
                )
                // BlocBuilder<ForgetPassCubit, ForgetPassState>(
                //     builder: (context, state) {
                //       if (state is ForgetPassLoading) {
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
                //               txt: getTranslated(context, 'next')!,
                //               color: Constants.primaryAppColor,
                //               onClicked: () async {
                //                 MyApplication.checkConnection().then((value) {
                //                   if (_formKey.currentState!.validate()) {
                //                     if (value == true) {
                //                       ForgetPassCubit.context = context;
                //                       ForgetPassCubit.phone = cCode + phoneTextEditingController.text;
                //                       BlocProvider.of<ForgetPassCubit>(context)
                //                           .ForgetPass();
                //                     } else {
                //                       Fluttertoast.showToast(
                //                           msg: getTranslated(context, 'noInternet')!,
                //                           toastLength: Toast.LENGTH_SHORT,
                //                           gravity: ToastGravity.SNACKBAR,
                //                           timeInSecForIosWeb: 3,
                //                           backgroundColor: Constants.primaryAppColor,
                //                           textColor: Constants.whiteAppColor,
                //                           fontSize: 16.0);
                //                     }
                //                   }
                //                 });
                //                 // if (!await MyApplication.checkConnection()) {
                //                 //   Fluttertoast.showToast(
                //                 //       msg: getTranslated(context, 'noInternet')!,
                //                 //       toastLength: Toast.LENGTH_SHORT,
                //                 //       gravity: ToastGravity.SNACKBAR,
                //                 //       timeInSecForIosWeb: 3,
                //                 //       backgroundColor: Colors.red,
                //                 //       textColor: Colors.white,
                //                 //       fontSize: 16.0);
                //                 //   return;
                //                 // }
                //                 // ForgetPassCubit.context = context;
                //                 // ForgetPassCubit.phone =
                //                 //     cCode + phoneTextEditingController.text;
                //                 // BlocProvider.of<ForgetPassCubit>(context)
                //                 //     .ForgetPass();
                //               },
                //             ),
                //           ],
                //         );
                //       }
                //     }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
