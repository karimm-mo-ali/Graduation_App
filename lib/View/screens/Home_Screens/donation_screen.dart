import 'package:flutter/material.dart';
import 'package:flutter_graduation/Style/Colors.dart';
import 'package:flutter_graduation/View/screens/Home_Screens/donate_clothes.dart';
import 'package:flutter_graduation/View/screens/Home_Screens/donate_food.dart';
import '../../../helpers/myApplication.dart';
import '../SideMenu_Screens/instructions_screen.dart';

class Donation extends StatelessWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/onboard_1.jpg')),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'You can help people by donating',
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
                        onPressed: () =>
                            MyApplication.navigateTo(context, DonationFood()),
                        child:  Text(
                          'FOOD',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Constants.primaryAppColor),
                        )),
                    const SizedBox(
                      width: 20.0,
                    ),
                    TextButton(
                        onPressed: () => MyApplication.navigateTo(
                            context, DonationClothes()),
                        child:  Text(
                          'CLOTHES',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Constants.primaryAppColor),
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
                      'Know How To Donate From',
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
                        child:  Text(
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
  }
}
