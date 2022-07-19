import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Data/Cubit/contactUs_cubit/contactUs_cubit.dart';
import '../../../Data/Cubit/contactUs_cubit/contactUs_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';
import '../../widgets/btn_widget.dart';
import '../../widgets/txtfield_widget.dart';

class ContactUsScreen extends StatelessWidget {
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController messageTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
        title: const Text("Contact Us", style: TextStyle(fontSize: 19)),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: size.height * .0001, bottom: size.height * .00001),
                    child: Center(
                      child: Image.asset("assets/logo3.jpg",
                          height: size.height * 0.4),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 30.0,
                        right: 30.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TxtFieldWidget(
                                hintTxt: "First Name",
                                textInputType: TextInputType.name,
                                textEditingController:
                                    firstNameTextEditingController,
                                isHasNextFocus: true,
                              ),
                            ),
                            SizedBox(width: size.height * 0.02),
                            Expanded(
                              child: TxtFieldWidget(
                                hintTxt: "Last Name",
                                textInputType: TextInputType.name,
                                textEditingController:
                                    lastNameTextEditingController,
                                isHasNextFocus: true,
                              ),
                            ),
                          ],
                        ),
                        TxtFieldWidget(
                          hintTxt: "Email Address",
                          textInputType: TextInputType.emailAddress,
                          textEditingController: emailTextEditingController,
                          isHasNextFocus: true,
                        ),
                        TxtFieldWidget(
                          hintTxt: "Phone Number",
                          textInputType: TextInputType.phone,
                          textEditingController: phoneTextEditingController,
                          isHasNextFocus: true,
                        ),
                        TxtFieldWidget(
                          hintTxt: "Message",
                          textInputType: TextInputType.text,
                          textEditingController: messageTextEditingController,
                          isHasNextFocus: false,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Center(
                          child: BlocBuilder<ContactUsCubit, ContactUsState>(
                              builder: (context, state) {
                            if (state is ContactUsLoading) {
                              return SpinKitThreeBounce(
                                color: Constants.primaryAppColor,
                                size: size.width * .08,
                              );
                            } else {
                              return BtnWidget(
                                txt: "Send To Us",
                                color: Constants.primaryAppColor,
                                onClicked: () {
                                  MyApplication.checkConnection().then((value) {
                                    if (_formKey.currentState!.validate()) {
                                      if (value == true) {
                                        BlocProvider.of<ContactUsCubit>(
                                                context)
                                            .contactUs(
                                                firstName:
                                                    firstNameTextEditingController
                                                        .text,
                                                lastName:
                                                    lastNameTextEditingController
                                                        .text,
                                                email:
                                                    emailTextEditingController
                                                        .text,
                                                phone:
                                                    phoneTextEditingController
                                                        .text,
                                                message:
                                                    messageTextEditingController
                                                        .text,
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
                          height: 40.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
