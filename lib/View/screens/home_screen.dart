import 'package:flutter_graduation/View/screens/aboutUs_screen.dart';

import 'package:flutter_graduation/View/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../Data/Cubit/app_cubit/app_state.dart';
import '../widgets/drawer.dart';
import 'instructions_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(context,
            //         MaterialPageRoute(builder: (context) {
            //           return DrawerWidget();
            //         }));
            //   },
            //   icon: Icon(Icons.menu,
            //       color:
            //           AppCubit.get(context).isDark ? Colors.white : Colors.black),
            // ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined,
                      color: AppCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ],
          ),
          // body: ConditionalBuilder(
          //   condition: true,
          //   builder: (context) => cubit.screens[cubit.currentIndex],
          //   fallback: (context) => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
          // drawer: DrawerWidget(),
          // drawer: Drawer(
          //   child: ListView(
          //     children: [
          //       DrawerHeader(
          //           child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children:   [
          //                   const CircleAvatar(
          //                     radius: 30.0,
          //                     backgroundImage:  NetworkImage('https://ar.scoopempire.com/wp-content/uploads/sites/4/2022/01/%D9%88%D9%8A%D8%AC%D8%B2-1024x1024.jpg'),
          //                   ),
          //                   const SizedBox(
          //                     height: 15.0,
          //                   ),
          //                   const Text(
          //                     'Profile Name',
          //                     style: TextStyle(
          //                       fontSize: 20.0
          //                     ),
          //                   ),
          //                   Text(
          //                     '@username👋',
          //                     style: TextStyle(
          //                       color: HexColor('#616A6B'),
          //                       fontSize: 15.0
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //
          //
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //             horizontal: 15.0,
          //             vertical: 8.0
          //         ),
          //         child: Row(
          //           children: [
          //             const Expanded(
          //               child:  Text(
          //                 'About Us',
          //                 style: TextStyle(
          //                   fontSize: 15.0,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //             CircleAvatar(
          //               radius: 20.0,
          //               backgroundColor: AppCubit.get(context).isDark?HexColor('#BDC3C7'):HexColor('#2E4053'),
          //               child: IconButton(
          //                 onPressed: (){
          //                   navigateTo(context, AboutUs());
          //                 },
          //                 icon: Icon(
          //                   Icons.chrome_reader_mode,
          //                   color:AppCubit.get(context).isDark?HexColor('#2E4053'):Colors.white,
          //                 ),
          //
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         width: double.infinity,
          //         height: 1.0,
          //         color:AppCubit.get(context).isDark?HexColor('#212F3D'):HexColor('#EAEDED'),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //             horizontal: 15.0,
          //             vertical: 8.0
          //         ),
          //         child: Row(
          //           children: [
          //             const Expanded(
          //               child:  Text(
          //                 'Instruction',
          //                 style: TextStyle(
          //                   fontSize: 15.0,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //             CircleAvatar(
          //               radius: 20.0,
          //               backgroundColor: AppCubit.get(context).isDark?HexColor('#BDC3C7'):HexColor('#2E4053'),
          //               child: IconButton(
          //                 onPressed: (){
          //                   navigateTo(context, Instruction());
          //                 },
          //                 icon: Icon(
          //                   Icons.integration_instructions_rounded,
          //                   color:AppCubit.get(context).isDark?HexColor('#2E4053'):Colors.white,
          //                 ),
          //
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         width: double.infinity,
          //         height: 1.0,
          //         color:AppCubit.get(context).isDark?HexColor('#212F3D'):HexColor('#EAEDED'),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //             horizontal: 15.0,
          //             vertical: 8.0
          //         ),
          //         child: Row(
          //           children: [
          //             const Expanded(
          //               child:  Text(
          //                 'Setting',
          //                 style: TextStyle(
          //                   fontSize: 15.0,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //             CircleAvatar(
          //               radius: 20.0,
          //               backgroundColor: AppCubit.get(context).isDark?HexColor('#BDC3C7'):HexColor('#2E4053'),
          //               child: IconButton(
          //                 onPressed: (){
          //                   navigateTo(context, Setting());
          //                 },
          //                 icon: Icon(
          //                   Icons.settings_rounded,
          //                   color:AppCubit.get(context).isDark?HexColor('#2E4053'):Colors.white,
          //                 ),
          //
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         width: double.infinity,
          //         height: 1.0,
          //         color:AppCubit.get(context).isDark?HexColor('#212F3D'):HexColor('#EAEDED'),
          //       ),
          //
          //     ],
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.touch_app_rounded,
                ),
                label: 'DONATE',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.hail_rounded,
                ),
                label: 'REQUEST',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_rounded,
                ),
                label: 'CONTACTUS',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            elevation: 50.0,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              AppCubit.get(context).changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
