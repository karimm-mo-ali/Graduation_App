// ignore_for_file: use_key_in_widget_constructors, avoid_print
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/Data/Cubit/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Data/Cubit/edit_profile_cubit/edit_profile_state.dart';
import '../../../Data/Cubit/profile_info_cubit/profile_info_cubit.dart';
import '../../../Data/Cubit/profile_info_cubit/profile_info_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';
import '../../widgets/btn_widget.dart';
import '../../widgets/txtfield_widget.dart';

class AccountDetailsScreen extends StatefulWidget {
  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen>
    with TickerProviderStateMixin {
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController addressTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String cCode = '+966';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileInfoCubit>(context).profileInfo();
  }

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

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker().retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type != RetrieveType.video) {
        setState(() {
          _image = response.file;
        });
      } else {}
    }
  }

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
          title: const Text("Account Details", style: TextStyle(fontSize: 19)),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
                    builder: (context, state) {
                  if (state is ProfileInfoLoading) {
                    return SizedBox(
                      height: size.height / 5,
                      child: Center(
                        child: SpinKitThreeBounce(
                          color: Constants.primaryAppColor,
                          size: size.width * .08,
                        ),
                      ),
                    );
                  } else if (state is ProfileInfoLoaded) {
                    // firstNameTextEditingController.text =
                    //     state.response!.data.FirstName;
                    // lastNameTextEditingController.text =
                    //     state.response!.data.LastName;
                    // emailTextEditingController.text = state.response!.data.Email;
                    // phoneTextEditingController.text = state.response!.data.Phone;
                    // addressTextEditingController.text =
                    //     state.response!.data.Address;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            // bottom: MediaQuery.of(context).viewInsets.bottom,
                            start: 30,
                            end: 30),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              /// image pic
                              Stack(
                                children: [
                                  /// container for image
                                  Container(
                                      padding: const EdgeInsets.all(20),
                                      child: _image == null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: CachedNetworkImage(
                                                imageUrl: state.response!.data.photo
                                                        .isNotEmpty
                                                    ? state.response!.data.photo
                                                    : "assets/no-profile.jpg",
                                                height: size.height * 0.13,
                                                width: size.height * 0.13,
                                                fit: BoxFit.fill,
                                                placeholder: (context, str) {
                                                  return SpinKitThreeBounce(
                                                    color:
                                                        Constants.primaryAppColor,
                                                    size: 30,
                                                  );
                                                },
                                                errorWidget:
                                                    (context, url, error) =>
                                                        CircleAvatar(
                                                  radius: size.height * 0.07,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      "assets/no-profile.jpg",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : _image != null
                                              ? CircleAvatar(
                                                  radius: size.height * 0.07,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      "assets/no_image.jpg",
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
                                                        topLeft:
                                                            Radius.circular(20.0),
                                                        topRight:
                                                            Radius.circular(20.0))),
                                                child: bottomSheet(),
                                              );
                                            });
                                      },
                                      child: Container(
                                          height: size.height * 0.04,
                                          width: size.height * 0.04,
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle),
                                          child: SvgPicture.asset(
                                            "assets/camera.svg",
                                            //   color: Colors.red,
                                            fit: BoxFit.contain,
                                            // width: 10,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              /// date txt fields
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: Text("First Name",
                                                  style: TextStyle(
                                                      color: Constants.HINT
                                                          .withOpacity(0.6),
                                                      fontSize: 15)),
                                            ),
                                            SizedBox(height: size.height * .01),
                                            TxtFieldWidget(
                                                hintTxt:
                                                    state.response!.data.FirstName,
                                                textEditingController:
                                                    firstNameTextEditingController,
                                                isHasNextFocus: true,
                                                textInputType: TextInputType.name,
                                                suffixIcon: SvgPicture.asset(
                                                  "assets/pen.svg",
                                                  height: 10,
                                                  width: 10,
                                                  fit: BoxFit.scaleDown,
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: size.height * 0.01),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: Text("Last Name",
                                                  style: TextStyle(
                                                      color: Constants.HINT
                                                          .withOpacity(0.6),
                                                      fontSize: 15)),
                                            ),
                                            SizedBox(height: size.height * .01),
                                            TxtFieldWidget(
                                                hintTxt:
                                                    state.response!.data.LastName,
                                                textEditingController:
                                                    lastNameTextEditingController,
                                                isHasNextFocus: true,
                                                textInputType: TextInputType.name,
                                                suffixIcon: SvgPicture.asset(
                                                  "assets/pen.svg",
                                                  height: 10,
                                                  width: 10,
                                                  fit: BoxFit.scaleDown,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * .01),
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text("Email Address",
                                        style: TextStyle(
                                            color: Constants.HINT.withOpacity(0.6),
                                            fontSize: 15)),
                                  ),
                                  SizedBox(height: size.height * .01),
                                  TxtFieldWidget(
                                      hintTxt: state.response!.data.Email,
                                      textEditingController:
                                          emailTextEditingController,
                                      isHasNextFocus: true,
                                      textInputType: TextInputType.emailAddress,
                                      suffixIcon: SvgPicture.asset(
                                        "assets/pen.svg",
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.scaleDown,
                                      )),
                                  SizedBox(height: size.height * .01),
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text("Phone",
                                        style: TextStyle(
                                            color: Constants.HINT.withOpacity(0.6),
                                            fontSize: 15)),
                                  ),

                                  SizedBox(height: size.height * .01),
                                  TxtFieldWidget(
                                      hintTxt: state.response!.data.Phone,
                                      textEditingController:
                                          phoneTextEditingController,
                                      isHasNextFocus: true,
                                      textInputType: TextInputType.phone,
                                      suffixIcon: SvgPicture.asset(
                                        "assets/pen.svg",
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.scaleDown,
                                      )),
                                  SizedBox(height: size.height * .01),
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text("Address",
                                        style: TextStyle(
                                            color: Constants.HINT.withOpacity(0.6),
                                            fontSize: 15)),
                                  ),
                                  SizedBox(height: size.height * .01),
                                  TxtFieldWidget(
                                      hintTxt: state.response!.data.Address,
                                      textEditingController:
                                          addressTextEditingController,
                                      isHasNextFocus: false,
                                      textInputType: TextInputType.streetAddress,
                                      suffixIcon: SvgPicture.asset(
                                        "assets/pen.svg",
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.scaleDown,
                                      )),
                                ],
                              ),

                              /// save button
                              BlocBuilder<EditProfileCubit, EditProfileState>(
                                  builder: (context, stat) {
                                if (stat is EditProfileLoading) {
                                  return Column(
                                    children: [
                                      SizedBox(height: size.height * 0.06),
                                      SpinKitThreeBounce(
                                        color: Constants.primaryAppColor,
                                        size: size.width * .08,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      SizedBox(height: size.height * 0.04),
                                      BtnWidget(
                                        txt: "Save",
                                        color: Constants.primaryAppColor,
                                        onClicked: () async {
                                          final FormState form =
                                              _formKey.currentState!;
                                          if (form.validate()) {
                                            if (!await MyApplication
                                                .checkConnection()) {
                                              Fluttertoast.showToast(
                                                  msg: 'no Internet',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.SNACKBAR,
                                                  timeInSecForIosWeb: 3,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                              return;
                                            } else if (firstNameTextEditingController
                                                        .text ==
                                                    state
                                                        .response!.data.FirstName &&
                                                lastNameTextEditingController
                                                        .text ==
                                                    state.response!.data.LastName &&
                                                emailTextEditingController.text ==
                                                    state.response!.data.Email &&
                                                phoneTextEditingController.text ==
                                                    state.response!.data.Phone &&
                                                addressTextEditingController.text ==
                                                    state.response!.data.Address &&
                                                _image == null) {
                                              Fluttertoast.showToast(
                                                  msg: 'Fill your data',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.SNACKBAR,
                                                  timeInSecForIosWeb: 3,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            } else {
                                              BlocProvider.of<EditProfileCubit>(
                                                      context)
                                                  .editProfile(
                                                firstName:
                                                    firstNameTextEditingController
                                                        .text,
                                                lastName:
                                                    lastNameTextEditingController
                                                        .text,
                                                email:
                                                    emailTextEditingController.text,
                                                phone:
                                                    phoneTextEditingController.text,
                                                address:
                                                    addressTextEditingController
                                                        .text,
                                                photo: File(_image != null
                                                    ? _image!.path
                                                    : ""),
                                                context: context,
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                }
                              })
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                        height: size.height / 5,
                        child: Center(
                            child: Text(
                          "no data",
                        )));
                  }
                }),
              ],
            ),
          ),
        ));
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
