// // ignore_for_file: use_key_in_widget_constructors
// import 'package:flutter/material.dart';
// import 'package:flutter_graduation/View/screens/terms_and_conditions_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../Data/Cubit/app_cubit/app_cubit.dart';
// import '../../Style/Colors.dart';
// import '../screens/aboutUs_screen.dart';
// import '../screens/conact_us_screen.dart';
// import '../screens/instructions_screen.dart';
// import '../screens/login_screen.dart';
// import '../screens/setting_screen.dart';
//
// class DrawerWidget extends StatefulWidget {
//   @override
//   State<DrawerWidget> createState() => _DrawerWidgetState();
// }
//
// class _DrawerWidgetState extends State<DrawerWidget> {
//   var val = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // MyApplication.checkConnection().then((value) {
//     //   if (!value) {
//     //     Fluttertoast.showToast(
//     //         msg: getTranslated(context, 'noInternet')!,
//     //         toastLength: Toast.LENGTH_LONG,
//     //         gravity: ToastGravity.BOTTOM,
//     //         timeInSecForIosWeb: 1,
//     //         backgroundColor: Colors.red,
//     //         textColor: Colors.white,
//     //         fontSize: 16.0);
//     //   } else {
//     //     BlocProvider.of<DriverInfoCubit>(context)
//     //         .driverInfo(token: sharedPrefs.token, context: context);
//     //   }
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Drawer(
//       backgroundColor: Constants.white,
//       child: Padding(
//         padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
//         child: Column(
//           children: [
//             SizedBox(height: size.height * 0.08),
//             Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(100.0),
//                   child: Image.asset(
//                     "assets/no-profile.jpg",
//                     fit: BoxFit.fill,
//                     height: size.height * 0.11,
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.012),
//                 const Center(
//                   child: Text("Karim Mohamed",
//                       style: TextStyle(fontSize: 20, color: Constants.HINT)),
//                 ),
//               ],
//             ),
//             SizedBox(height: size.height * 0.03),
//             ListTile(
//               horizontalTitleGap: 0,
//               visualDensity: const VisualDensity(horizontal: 0, vertical: -1.5),
//               leading:
//                   Icon(Icons.dark_mode, color: Constants.HINT.withOpacity(0.3)),
//               title: const Text("Dark Mode",
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Constants.HINT,
//                       fontWeight: FontWeight.w400)),
//               trailing: IconButton(
//                 onPressed: () {
//                   AppCubit.get(context).changeAppMode();
//                 },
//                 icon: Icon(Icons.brightness_4_outlined,
//                     color: AppCubit.get(context).isDark
//                         ? Colors.white
//                         : Colors.black),
//               ),
//             ),
//             ListTile(
//               horizontalTitleGap: 0,
//               visualDensity: const VisualDensity(horizontal: 0, vertical: -1.5),
//               leading:
//                   Icon(Icons.error, color: Constants.HINT.withOpacity(0.3)),
//               title: const Text("About",
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Constants.HINT,
//                       fontWeight: FontWeight.w400)),
//               onTap: () =>
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return AboutScreen();
//               })),
//             ),
//             ListTile(
//               horizontalTitleGap: 0,
//               visualDensity: const VisualDensity(horizontal: 0, vertical: -1.5),
//               leading:
//                   Icon(Icons.notes, color: Constants.HINT.withOpacity(0.3)),
//               title: const Text("Instructions",
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Constants.HINT,
//                       fontWeight: FontWeight.w400)),
//               onTap: () =>
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return InstructionsScreen();
//               })),
//             ),
//             ListTile(
//               horizontalTitleGap: 0,
//               visualDensity: const VisualDensity(horizontal: 0, vertical: -1.5),
//               leading: SvgPicture.asset("assets/settings.svg",
//                   width: size.width * 0.025,
//                   height: size.height * 0.025,
//                   color: Constants.HINT.withOpacity(0.7)),
//               title: const Text("Settings",
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Constants.HINT,
//                       fontWeight: FontWeight.w400)),
//               onTap: () =>
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return SettingsScreen();
//               })),
//             ),
//             ListTile(
//               horizontalTitleGap: 0,
//               visualDensity: const VisualDensity(horizontal: 0, vertical: -1.5),
//               leading: SvgPicture.asset("assets/termcond.svg",
//                   width: size.width * 0.025,
//                   height: size.height * 0.025,
//                   color: Constants.HINT.withOpacity(0.7)),
//               title: const Text("Terms And Conditions",
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Constants.HINT,
//                       fontWeight: FontWeight.w400)),
//               onTap: () =>
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return TermsAndConditionsScreen();
//               })),
//             ),
//             ListTile(
//               horizontalTitleGap: 0,
//               visualDensity: const VisualDensity(horizontal: 0, vertical: -1.5),
//               leading:
//                   Icon(Icons.message, color: Constants.HINT.withOpacity(0.3)),
//               title: const Text("ContactUs",
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Constants.HINT,
//                       fontWeight: FontWeight.w400)),
//               onTap: () =>
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return Profile();
//               })),
//             ),
//             const Spacer(),
//             ListTile(
//                 horizontalTitleGap: 0,
//                 leading: SvgPicture.asset("assets/logout.svg",
//                     width: size.width * 0.025,
//                     height: size.height * 0.025,
//                     color: Constants.HINT.withOpacity(0.7)),
//                 title: const Text("Logout",
//                     style: TextStyle(
//                         fontSize: 19,
//                         color: Constants.HINT,
//                         fontWeight: FontWeight.w600)),
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return const LoginScreen();
//                   }));
//                 }),
//             SizedBox(height: size.height * 0.04),
//           ],
//         ),
//       ),
//     );
//   }
// }
