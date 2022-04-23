
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../../Data/Cubit/app_cubit/app_state.dart';
import '../../widgets/reusable.dart';
import '../../widgets/reusable_component.dart';
import '../SideMenu_Screens/instructions_screen.dart';

class Food extends StatefulWidget {

  @override
  State<Food> createState() => _FoodState();
}


class _FoodState extends State<Food> {


  //List type
  String? type;
  List <String>listType=[
    'Cooked','Uncooked',
  ];


  //food source
  String? foodSource;
  List <String> listFoodSource=[
    'Restaurant', 'Weddings','Restaurant Customer','The House','Other'
  ];

  //List Food
  String? typeOfFood;
  List <String> listTypeOfFood=[
    'Rice','Pasta','Meat','Chicken','Fish','Flour','Sugar','Tea','Oil','Butter','Dessert'
    ,'Legumes','Yamish Ramadan','Meals','Bakery','Vegetables and Fruits','Other',
  ];


  //type of quantity
  String? typeOfQuantity;
  List <String> listTypeOfQuantity=[
    'Kilo','Meal',
  ];



  //List Deliver
  String? deliver;
  List <String> listOfDeliver=[
    'Send Delegate', 'Deliver to us',
  ];
  var titleController=TextEditingController();
  var dateController=TextEditingController();


  var scaffoldKey =GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  // DatePiker
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit ,AppStates >(
        listener: (BuildContext context , AppStates states){
          if(states is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder:(BuildContext context , AppStates state)
            {
              return Scaffold(
                key: scaffoldKey,
                appBar:AppBar(
                  title: const Text(
                    'Food Donation',
                    style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          //Type
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:20.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  'Type',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: DropdownButton<String>(
                                    hint:Text(
                                      'Select Item',
                                      style: TextStyle(
                                        color: AppCubit.get(context).isDark?Colors.white:Colors.black,
                                      ),
                                    ),
                                    dropdownColor: Colors.grey,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 36,
                                    style:  TextStyle(
                                        color:  AppCubit.get(context).isDark?Colors.white:Colors.black,
                                        fontSize: 18.0
                                    ),
                                    value: type,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (newValue){
                                      setState(() {
                                        listType =newValue as List<String>;
                                      });
                                    },
                                    items: listType.map((valueItem){
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem));
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          defaultLine(context),



                          //Food Source
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:20.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Food Source',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: DropdownButton<String>(
                                    hint:Text(
                                      'Select Item',
                                      style: TextStyle(
                                        color: AppCubit.get(context).isDark?Colors.white:Colors.black,
                                      ),
                                    ),
                                    dropdownColor: Colors.grey,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 36,
                                    style:  TextStyle(
                                        color:  AppCubit.get(context).isDark?Colors.white:Colors.black,
                                        fontSize: 18.0
                                    ),
                                    value: foodSource,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (newValue){
                                      setState(() {
                                        listFoodSource =newValue as List<String>;
                                      });
                                    },
                                    items: listFoodSource.map((valueItem){
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem));
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          defaultLine(context),

                          //type of Food
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:20.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Type of Food',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: DropdownButton<String>(
                                    hint:Text(
                                      'Select Item',
                                      style: TextStyle(
                                        color: AppCubit.get(context).isDark?Colors.white:Colors.black,
                                      ),
                                    ),
                                    dropdownColor: Colors.grey,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 36,
                                    style:  TextStyle(
                                        color:  AppCubit.get(context).isDark?Colors.white:Colors.black,
                                        fontSize: 18.0
                                    ),
                                    value: typeOfFood,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (newValue){
                                      setState(() {
                                        listTypeOfFood =newValue as List<String>;
                                      });
                                    },
                                    items: listTypeOfFood.map((valueItem){
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem));
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Expiration Date
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:20.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Expiration Date',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: dateController,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Should enter date';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Task Date',
                                    prefixIcon: Icon(
                                        Icons.calendar_today,

                                    ),
                                  ),
                                  onTap: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2100-10-10'))
                                        .then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          defaultLine(context),

                          //Quantity
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:20.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: DropdownButton<String>(
                                    hint:Text(
                                      'Select Item',
                                      style: TextStyle(
                                        color: AppCubit.get(context).isDark?Colors.white:Colors.black,
                                      ),
                                    ),
                                    dropdownColor: Colors.grey,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 36,
                                    style:  TextStyle(
                                        color:  AppCubit.get(context).isDark?Colors.white:Colors.black,
                                        fontSize: 18.0
                                    ),
                                    value: typeOfQuantity,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (newValue){
                                      setState(() {
                                        listTypeOfQuantity =newValue as List<String>;
                                      });
                                    },
                                    items: listTypeOfQuantity.map((valueItem){
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem));
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Quantity',

                                    prefixIcon: Icon(
                                        Icons.production_quantity_limits,

                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Should enter title';
                                    }
                                    return null;
                                  },
                                ),

                              ],
                            ),
                          ),
                          defaultLine(context),

                          //location
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:20.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Location',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Location',

                                    prefixIcon: Icon(
                                      Icons.location_on,

                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Location Needed';
                                    }
                                    return null;
                                  },
                                ),

                              ],
                            ),
                          ),
                          defaultLine(context),

                          //Buttons
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:20.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  'Deliver',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: DropdownButton<String>(
                                    hint:Text(
                                      'Select Item',
                                      style: TextStyle(
                                        color: AppCubit.get(context).isDark?Colors.white:Colors.black,
                                      ),
                                    ),
                                    dropdownColor: Colors.grey,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 36,
                                    style:  TextStyle(
                                        color:  AppCubit.get(context).isDark?Colors.white:Colors.black,
                                        fontSize: 18.0
                                    ),
                                    value: deliver,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (newValue){
                                      setState(() {
                                        listOfDeliver =newValue as List<String>;
                                      });
                                    },
                                    items: listOfDeliver.map((valueItem){
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem));
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            width: double.infinity,

                            height: 40.0,
                            child: MaterialButton(
                              onPressed: (){
                                if (formKey.currentState!.validate()) {

                                }
                              },
                              child: const Text(
                                'DONE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

      ),
    );
  }
}
