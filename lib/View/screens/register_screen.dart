// ignore_for_file: avoid_print, use_key_in_widget_constructors
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../Data/Cubit/signUp_cubit/signUP_cubit.dart';
import '../../Data/Cubit/signUp_cubit/signUp_state.dart';
import '../../Style/Colors.dart';
import '../widgets/btn_widget.dart';
import '../widgets/txtfield_widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var check = true;
  String? _selectedValue;
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController passTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  final TextEditingController genderTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController addressTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  XFile? _image;
  _imgFromDevice({ImageSource? imageSource}) async {
    XFile? image =
        await ImagePicker().pickImage(source: imageSource!, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image = image;
        print("image is $image");
      });
    } else {
      return;
    }
  }
  // bool matching = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // confirmPassTextEditingController.addListener(() {
  //   //   setState(() {
  //   //     matching = passTextEditingController.text.toString().trim() ==
  //   //         confirmPassTextEditingController.text.toString().trim();
  //   //   });
  //   // });
  //   // passTextEditingController.addListener(() {
  //   //   setState(() {
  //   //     matching = passTextEditingController.text.toString().trim() ==
  //   //         confirmPassTextEditingController.text.toString().trim();
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
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.06),
                  Stack(
                    children: [
                      /// container for image
                      Container(
                          padding: const EdgeInsets.all(20),
                          child: _image != null
                              ? CircleAvatar(
                                  radius: size.height * 0.07,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.fill,
                                      height: size.height * 0.2,
                                    ),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: size.height * 0.07,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      "assets/no-profile.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),

                      /// camera button
                      Positioned(
                        bottom: 20,
                        right: 18,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (builder) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        color: Colors
                                            .grey, //new Color.fromRGBO(255, 0, 0, 0.0),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0))),
                                    child: bottomSheet(),
                                  );
                                });
                          },
                          child: Container(
                              height: size.height * 0.04,
                              width: size.height * 0.04,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Constants.primaryAppColor,
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                "assets/camera.svg",
                                color: Constants.white,
                                fit: BoxFit.contain,
                              )),
                        ),
                      )
                    ],
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
                          hintTxt: "Address",
                          textInputType: TextInputType.streetAddress,
                          textEditingController: addressTextEditingController,
                          isHasNextFocus: true,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, left: 15, right: 7),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Constants.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Constants.primaryAppColor,
                                  width: 0.7)),
                          child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: true,
                            underline: const SizedBox(),
                            hint: Text("Gender",
                                style: TextStyle(
                                    fontSize: 12.5,
                                    color: Constants.HINT.withOpacity(0.5))),
                            items: <String>['Person', 'Charity']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _selectedValue,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedValue = newValue!;
                              });
                            },
                          ),
                        ),
                        TxtFieldWidget(
                          hintTxt: "Password",
                          textInputType: TextInputType.visiblePassword,
                          textEditingController: passTextEditingController,
                          isHasNextFocus: false,
                          type: "signup",
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Center(
                          child: BlocBuilder<SignUpCubit, SignUpState>(
                              builder: (context, state) {
                            if (state is SignUpLoading) {
                              return SpinKitThreeBounce(
                                color: Constants.primaryAppColor,
                                size: size.width * .08,
                              );
                            } else {
                              return BtnWidget(
                                txt: "Sign Up",
                                color: Constants.primaryAppColor,
                                onClicked: () {
                                  BlocProvider.of<SignUpCubit>(context).signUp(
                                      firstName:
                                          firstNameTextEditingController.text,
                                      lastName:
                                          lastNameTextEditingController.text,
                                      email: emailTextEditingController.text,
                                      phone: phoneTextEditingController.text,
                                      address:
                                          addressTextEditingController.text,
                                      password: passTextEditingController.text,
                                      gender: _selectedValue,
                                      photo: File(
                                          _image != null ? _image!.path : ""),
                                      context: context);
                                  // MyApplication.checkConnection().then((value) {
                                  //   if (_formKey.currentState!.validate()) {
                                  //     if (value == true) {
                                  //       BlocProvider.of<SignUpCubit>(context).SignUp(
                                  //           email: emailTextEditingController.text,
                                  //           pass:
                                  //               passwordTextEditingController.text,
                                  //           remember: check,
                                  //           context: context);
                                  //     } else {
                                  //       Fluttertoast.showToast(
                                  //           msg: 'no Internet',
                                  //           toastLength: Toast.LENGTH_SHORT,
                                  //           gravity: ToastGravity.SNACKBAR,
                                  //           timeInSecForIosWeb: 3,
                                  //           backgroundColor:
                                  //               Constants.primaryAppColor,
                                  //           textColor: Constants.white,
                                  //           fontSize: 16.0);
                                  //     }
                                  //   }
                                  // });
                                },
                              );
                            }
                          }),
                        ),
                        // BtnWidget(
                        //   txt: "Sign Up",
                        //   color: Constants.primaryAppColor,
                        //   onClicked: () {
                        //     Navigator.push(context,
                        //         MaterialPageRoute(builder: (context) {
                        //       return Home();
                        //     }));
                        //   },
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: "Already have an account ? ",
                                  style: TextStyle(
                                      color: Constants.HINT.withOpacity(0.5),
                                      fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: "Sign In",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const LoginScreen();
                                            })),
                                      style: TextStyle(
                                          color: Constants.primaryAppColor,
                                          fontSize: 12,
                                          decoration: TextDecoration.underline),
                                    )
                                  ]),
                            ),
                          ],
                        ),
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

  Widget bottomSheet() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.19,
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      decoration: BoxDecoration(
          color: Constants.primaryAppColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            const Text(
              "Choose Your Profile Photo",
              style: TextStyle(
                fontSize: 17.0,
                //    fontFamily: lunBold,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _imgFromDevice(imageSource: ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/camera.svg",
                          height: 22,
                          width: 22,
                          //  color: mainColor,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Camera',
                          style: TextStyle(
                            fontSize: 17.0,
                            //  fontFamily: lunRegular,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    color: Constants.white,
                    height: size.height * 0.055,
                  ),
                  GestureDetector(
                    onTap: () {
                      _imgFromDevice(imageSource: ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image, color: Constants.white, size: 30),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            fontSize: 17.0,
                            //  fontFamily: lunRegular,
                          ),
                        )
                      ],
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
