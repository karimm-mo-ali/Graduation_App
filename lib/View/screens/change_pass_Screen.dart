// // ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_graduation/View/widgets/btn_widget.dart';
// import 'package:flutter_graduation/View/widgets/txtfield_widget.dart';
// import '../../Style/Colors.dart';
// import '../widgets/btn_widget.dart';
// import '../widgets/txtfield_widget.dart';
//
// class ChangePasswordScreen extends StatefulWidget {
//   @override
//   _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
// }
//
// class _ChangePasswordScreenState extends State<ChangePasswordScreen>
//     with TickerProviderStateMixin {
//   final TextEditingController currentPassTextEditingController =
//       TextEditingController();
//   final TextEditingController newPassTextEditingController =
//       TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController confirmPassTextEditingController =
//       TextEditingController();
//   bool obscure = true;
//   bool matching = false;
//   var currentFocus;
//   unFocus() {
//     currentFocus = FocusScope.of(context);
//     if (!currentFocus.hasPrimaryFocus) {
//       currentFocus.unfocus();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     confirmPassTextEditingController.addListener(() {
//       setState(() {
//         matching = newPassTextEditingController.text.toString().trim() ==
//             confirmPassTextEditingController.text.toString().trim();
//       });
//     });
//     newPassTextEditingController.addListener(() {
//       setState(() {
//         matching = newPassTextEditingController.text.toString().trim() ==
//             confirmPassTextEditingController.text.toString().trim();
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: unFocus,
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Constants.white,
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Constants.primaryAppColor,
//           elevation: 0.0,
//           leading: InkWell(
//             onTap: () => Navigator.pop(context),
//             child: const Padding(
//               padding: EdgeInsetsDirectional.only(start: 10),
//               child: Icon(Icons.arrow_back_ios),
//             ),
//           ),
//           title: const Text("Change Password", style: TextStyle(fontSize: 19)),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.only(
//                     start: 30, top: size.height * 0.05, end: 30),
//                 child: SizedBox(
//                   height:
//                       size.height - (size.height * 0.2 + size.height * 0.05),
//                   child: Form(
//                     key: _formKey,
//                     child: ListView(
//                       shrinkWrap: true,
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       children: [
//                         const Align(
//                           alignment: AlignmentDirectional.topStart,
//                           child: Text('current password',
//                               style: TextStyle(
//                                   color: Constants.HINT, fontSize: 15)),
//                         ),
//                         TxtFieldWidget(
//                             labelTxt: "*************",
//                             textEditingController:
//                                 currentPassTextEditingController,
//                             isHasNextFocus: true,
//                             textInputType: TextInputType.visiblePassword),
//                         const SizedBox(height: 20),
//                         const Align(
//                           alignment: AlignmentDirectional.topStart,
//                           child: Text('new password',
//                               style: TextStyle(
//                                   color: Constants.HINT, fontSize: 15)),
//                         ),
//                         TxtFieldWidget(
//                           labelTxt: "*************",
//                           textEditingController: newPassTextEditingController,
//                           isHasNextFocus: true,
//                           textInputType: TextInputType.visiblePassword,
//                           type: "signup",
//                         ),
//                         const SizedBox(height: 20),
//                         const Align(
//                           alignment: AlignmentDirectional.topStart,
//                           child: Text('confirmation new password',
//                               style: TextStyle(
//                                   color: Constants.HINT, fontSize: 15)),
//                         ),
//                         TxtFieldWidget(
//                           labelTxt: "***************",
//                           textEditingController:
//                               confirmPassTextEditingController,
//                           isHasNextFocus: false,
//                           textInputType: TextInputType.visiblePassword,
//                           pass: newPassTextEditingController.text.toString(),
//                         ),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: Visibility(
//                             visible: matching &&
//                                 newPassTextEditingController.text
//                                     .toString()
//                                     .isNotEmpty,
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 SvgPicture.asset(
//                                   "assets/images/valide_phone.svg",
//                                   fit: BoxFit.fill,
//                                   height: 20.0,
//                                   width: 20.0,
//                                   color: const Color(0xFF80AF50),
//                                 ),
//                                 const SizedBox(
//                                   width: 10.0,
//                                 ),
//                                 const Text('matPss',
//                                     style: TextStyle(
//                                         color: Constants.HINT, fontSize: 10)),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: size.height * 0.04),
//                         BtnWidget(
//                           txt: "change password",
//                           color: Constants.primaryAppColor,
//                           onClicked: () async {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
