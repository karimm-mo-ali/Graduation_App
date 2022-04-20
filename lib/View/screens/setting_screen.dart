// // ignore_for_file: use_key_in_widget_constructors
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../Style/Colors.dart';
// import 'account_details_screen.dart';
// import 'change_pass_Screen.dart';
//
// class SettingsScreen extends StatefulWidget {
//   @override
//   _SettingsScreenState createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends State<SettingsScreen> {
//   var val = true;
//   var val2 = false;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Constants.white,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Constants.primaryAppColor,
//         elevation: 0.0,
//         leading: InkWell(
//           onTap: () => Navigator.pop(context),
//           child: const Padding(
//             padding: EdgeInsetsDirectional.only(start: 10),
//             child: Icon(Icons.arrow_back_ios),
//           ),
//         ),
//         title: const Text("Settings", style: TextStyle(fontSize: 19)),
//       ),
//       body: Column(
//         children: [
//           // Container(
//           //   height: size.height * .2,
//           //   width: size.width,
//           //   decoration: const BoxDecoration(
//           //     borderRadius: BorderRadius.only(
//           //       bottomLeft: Radius.circular(60.0),
//           //       bottomRight: Radius.circular(60.0),
//           //     ),
//           //     color: Color(0xffe44544),
//           //   ),
//           //   child: Padding(
//           //     padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
//           //     child: Row(
//           //       children: [
//           //         InkWell(
//           //             onTap: () => Navigator.pop(context),
//           //             child: SvgPicture.asset('assets/images/back-arrow.svg',
//           //                 width: 25, color: Constants.white)),
//           //         const SizedBox(width: 15),
//           //         const Text(
//           //           'sett',
//           //           style: TextStyle(
//           //             fontFamily: 'Poppins',
//           //             fontSize: 25,
//           //             color: Color(0xffffffff),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//           // const SizedBox(height: 30),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//             child: Column(
//               children: [
//                 ListTile(
//                   horizontalTitleGap: 0,
//                   leading: SvgPicture.asset("assets/accdet.svg",
//                       width: size.width * 0.025,
//                       height: size.height * 0.025,
//                       color: Constants.HINT.withOpacity(0.7)),
//                   title: const Text("Account Details",
//                       style: TextStyle(
//                           fontSize: 19,
//                           color: Constants.HINT,
//                           fontWeight: FontWeight.w500)),
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (context) {
//                     return AccountDetailsScreen();
//                   })),
//                 ),
//                 ListTile(
//                   horizontalTitleGap: 0,
//                   leading: SvgPicture.asset("assets/lock.svg",
//                       width: size.width * 0.025,
//                       height: size.height * 0.025,
//                       color: Constants.HINT.withOpacity(0.7)),
//                   title: const Text("Change Password",
//                       style: TextStyle(
//                           fontSize: 19,
//                           color: Constants.HINT,
//                           fontWeight: FontWeight.w500)),
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (context) {
//                     return ChangePasswordScreen();
//                   })),
//                 ),
//                 ListTile(
//                     horizontalTitleGap: 0,
//                     leading: SvgPicture.asset("assets/lang.svg",
//                         width: size.width * 0.025,
//                         height: size.height * 0.025,
//                         color: Constants.HINT.withOpacity(0.7)),
//                     title: const Text("Language",
//                         style: TextStyle(
//                             fontSize: 19,
//                             color: Constants.HINT,
//                             fontWeight: FontWeight.w500)),
//                     onTap: () => showAlertDialog(context)),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   showAlertDialog(BuildContext cont) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: const EdgeInsets.all(0.0),
//         content: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Container(
//               width: MediaQuery.of(context).size.width,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               color: Constants.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Center(
//                       child: Text(
//                     'Change Language',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Constants.HINT,
//                         fontWeight: FontWeight.w500),
//                   )),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'English',
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Constants.HINT,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       Transform.scale(
//                         scale: 1.05,
//                         child: Checkbox(
//                             tristate: true,
//                             activeColor: Constants.primaryAppColor,
//                             value: val,
//                             shape: CircleBorder(
//                               side: BorderSide(
//                                 color: Constants.primaryAppColor,
//                               ),
//                             ),
//                             onChanged: (value) {
//                               setState(() {
//                                 val = value!;
//                               });
//                             }),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Arabic",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Constants.HINT,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       Transform.scale(
//                         scale: 1.05,
//                         child: Checkbox(
//                             value: val2,
//                             activeColor: Constants.primaryAppColor,
//                             shape: CircleBorder(
//                               side: BorderSide(
//                                 color: Constants.primaryAppColor,
//                               ),
//                             ),
//                             onChanged: (value) {
//                               setState(() {
//                                 val2 = value!;
//                               });
//                             }),
//                       )
//                     ],
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
