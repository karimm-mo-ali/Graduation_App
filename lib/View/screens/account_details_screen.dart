// ignore_for_file: use_key_in_widget_constructors, avoid_print
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Style/Colors.dart';
import '../widgets/btn_widget.dart';

class AccountDetailsScreen extends StatefulWidget {
  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen>
    with TickerProviderStateMixin {
  final TextEditingController fullNameTextEditingController =
  TextEditingController();
  final TextEditingController phoneTextEditingController =
  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String cCode = '+966';

  @override
  void initState() {
    super.initState();
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
          backgroundColor: Constants.primaryAppColor,
          elevation: 0.0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsetsDirectional.only(start: 10),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          title: const Text("Account Details", style: TextStyle(fontSize: 19)),
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              start: 20,
              top: 20,
              end: 20),
          child: SingleChildScrollView(
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
                          child: _image != null
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
                                "assets/images/no_image.jpg",
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
                                  shape: BoxShape.circle
                              ),
                              child: const Icon(Icons.camera_alt)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  /// date txt fields
                  // Padding(
                  //   padding: const EdgeInsetsDirectional.only(
                  //       start: 10, end: 10),
                  //   child: Column(
                  //     children: [
                  //       Align(
                  //         alignment: Alignment.centerLeft,
                  //         child: Text(getTranslated(context, 'fulln')!,
                  //             style: TextStyle(
                  //                 color:
                  //                 Constants.HINT.withOpacity(0.6),
                  //                 fontSize: 15)),
                  //       ),
                  //       TxtFieldWidget(
                  //           labelTxt: state.response!.data.name,
                  //           textEditingController: fullNameTextEditingController,
                  //           isHasNextFocus: true,
                  //           textInputType: TextInputType.name,
                  //           /*
                  //
                  //                            autovalidateMode: AutovalidateMode
                  //                               .onUserInteraction,
                  //                           validator: (value) {
                  //                             if (value == null ||
                  //                                 value.isEmpty) {
                  //                               return getTranslated(context,
                  //                                   "pleaseentername")!;
                  //                             }
                  //                             return null;
                  //                           },
                  //
                  //                          */
                  //           suffixIcon: SvgPicture.asset(
                  //             "assets/images/pen.svg",
                  //             height: 10,
                  //             width: 10,
                  //             fit: BoxFit.scaleDown,
                  //           )),
                  //     ],
                  //   ),
                  // ),

                  /// save button
                  Column(
                    children: [
                      SizedBox(height: size.height * 0.06),
                      BtnWidget(
                        txt: "Save",
                        color: Constants.primaryAppColor,
                        onClicked: () async {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
              "Choose your Photo",
              style: TextStyle(fontSize: 20,color: Constants.HINT,fontWeight: FontWeight.w500)
          ),
          const SizedBox(
            height: 18,
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
                    children: const [
                      Icon(Icons.camera_alt, color: Constants.white, size: 30),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(fontSize: 18,color: Constants.HINT,fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  color: Constants.white,
                  height: 30,
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
                        style: TextStyle(fontSize: 18,color: Constants.HINT,fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
