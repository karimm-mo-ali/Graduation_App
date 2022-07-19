import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/Style/Colors.dart';
import '../../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../../Data/Cubit/app_cubit/app_state.dart';

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
           /*appBar: AppBar(
             leading: IconButton(
               onPressed: () {
                 Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                       return SideMenuScreen();
              }));
               },
               icon: Icon(Icons.menu,
                   color:
                       AppCubit.get(context).isDark ? Colors.white : Colors.black),
             ),
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
           ),*/
          body: ConditionalBuilder(
            condition: true,
            builder: (context) => cubit.screens[cubit.currentIndex],
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:  Constants.primaryAppColor,
            items:  [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.touch_app_rounded,
                ),
                label: 'DONATE',
              ),
              BottomNavigationBarItem(
                backgroundColor: Constants.primaryAppColor,
                icon: Icon(
                  Icons.hail_rounded,
                ),
                label: 'REQUEST',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.chat_rounded,
              //   ),
              //   label: 'CONTACTUS',
              // ),
            ],
            type: BottomNavigationBarType.fixed,
            // elevation: 200.0,
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
