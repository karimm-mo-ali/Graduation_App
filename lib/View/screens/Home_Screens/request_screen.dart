import 'package:flutter_graduation/View/screens/Home_Screens/request_clothes.dart';
import 'package:flutter_graduation/View/screens/Home_Screens/request_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/helpers/myApplication.dart';
import '../../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../../Data/Cubit/app_cubit/app_state.dart';
import '../../../Style/Colors.dart';
import '../SideMenu_Screens/instructions_screen.dart';

class Request extends StatelessWidget {
  const Request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage('assets/onboarding3.jpg')),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Please Choose What You Need',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () => MyApplication.navigateTo(
                                  context, RequestFood()),
                              child:  Text(
                                'FOOD',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color:  Constants.primaryAppColor),
                              )),
                          const SizedBox(
                            width: 20.0,
                          ),
                          TextButton(
                              onPressed: () => MyApplication.navigateTo(
                                  context, RequestClothes()),
                              child:  Text(
                                'CLOTHES',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color:  Constants.primaryAppColor),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Know How To Request From',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          TextButton(
                              onPressed: () => MyApplication.navigateTo(
                                  context, InstructionsScreen()),
                              child: Text(
                                'Here',
                                style: TextStyle(
                                  color:  Constants.primaryAppColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
