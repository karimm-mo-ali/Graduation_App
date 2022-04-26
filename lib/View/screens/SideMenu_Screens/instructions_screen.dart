import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../../Data/Cubit/app_cubit/app_state.dart';

class InstructionsScreen extends StatefulWidget {
  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates states) {},
          builder: (BuildContext context, AppStates state) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title:
                    const Text("Instructions", style: TextStyle(fontSize: 19)),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: size.height * 0.03,
                      bottom: size.height * 0.03,
                      start: size.width * 0.06,
                      end: size.width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      //first & second
                      Text(
                        " First, we need to warn that food or clothing should be delivered to those who deserve it, the needy and the poor, so that we may receive the reward for all. \n \n Second, we will explain some of the instructions that must be followed with food of all kinds or clothing, whether you are a donor or an applicant for food or clothing:",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //uncooked
                      Text(
                        " * UnCooked ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Meat and fish and chicken
                      Text(
                        ">> Meat and fish and chicken",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1- Products should have a distinctive appearance, color and aroma",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "2- Check the expiration date",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "3-Products should be stored in the fridge or freezer according to the manufacturer's or pressing/butcher's instructions",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "4- To be away from any source of pollution ",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "5- Separate different types of meat, poultry and fish from each other and from other foods ",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //Vegetables and Fruits
                      Text(
                        ">> Vegetables and Fruits",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1- Vegetables should be washed well in cold water and then dried with a paper towel.",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "2- Put the vegetables in plastic bags and close them tightly after they are completely deflated.",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "3- It is not preferable to keep vegetables and fruits together in one place in the refrigerator",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "4- Leave some space in the bags with holes in them so that the fruit can breathe",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "5- Keeping fruits and Vegetables in the fridge",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //Legumes and grains
                      Text(
                        ">> Legumes and grains",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1- Use airtight glass containers for preservation",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "2-Ensure that the container is completely clean and dry of water or liquids to avoid moisture during preservation, which damages the legumes",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //Cooked
                      Text(
                        " * Cooked ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1- Make sure to put food in the fridge before putting it in the freezer.",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "2- Food quality should be good and in good condition",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "3- Make sure to use plastic bags designated for freezing and not copper or cooking utensils.",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "4- Do not leave food out of the refrigerator for more than two hours.",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "5- Put the date of release on the bags.",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "6- When you take food out of the freezer, do not thaw it at room temperature, but rather put it in the refrigerator.",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //Clothes
                      Text(
                        " * Clothes ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1- Clothes must be washed and clean",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "2- It must be ironed",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "3- Packing in plastic bags",
                        style: TextStyle(fontSize: 15),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
