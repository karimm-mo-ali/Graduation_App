import 'package:flutter_graduation/View/screens/clothes_screen.dart';
import 'package:flutter_graduation/View/screens/food_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/reusable_component.dart';
import 'instructions_screen.dart';


class Donation extends StatelessWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body:  Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Image(
                        image: AssetImage('assets/onboard_1.jpg')),

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
                            onPressed: (){
                              navigateTo(context, Food());
                            },
                            child:const Text(
                              'FOOD',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.green
                              ),
                            )),
                        const SizedBox(
                          width: 20.0,
                        ),
                        TextButton(
                            onPressed: (){
                              navigateTo(context, Clothes());
                            },
                            child:const Text(
                              'CLOTHES',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.green
                              ),
                            )),


                      ],),
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
                          'Know How To Donate From' ,
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
                            onPressed: (){
                              navigateTo(context, InstructionsScreen());
                            }, child: const Text(
                          'Here',
                          style: TextStyle(
                            color: Colors.green,
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
