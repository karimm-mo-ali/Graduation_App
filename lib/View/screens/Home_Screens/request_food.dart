import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/Data/Cubit/food_request_cubit/food_request_cubit.dart';
import 'package:flutter_graduation/helpers/sharedPreference.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../../Data/Cubit/app_cubit/app_state.dart';
import '../../../Data/Cubit/food_request_cubit/food_request_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';
import '../../widgets/btn_widget.dart';
import '../../widgets/reusable.dart';

class RequestFood extends StatefulWidget {
  @override
  State<RequestFood> createState() => _RequestFoodState();
}

class _RequestFoodState extends State<RequestFood> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  //List type
  String? type;
  List<String> listType = [
    'Cooked',
    'Uncooked',
  ];

  //food source
  String? foodSource;
  List<String> listFoodSource = [
    'Restaurant',
    'Weddings',
    'Restaurant Customer',
    'The House',
    'Other'
  ];

  //List Food
  String? typeOfFood;
  List<String> listTypeOfFood = [
    'Rice',
    'Pasta',
    'Meat',
    'Chicken',
    'Fish',
    'Flour',
    'Sugar',
    'Tea',
    'Oil',
    'Butter',
    'Dessert',
    'Legumes',
    'Yamish Ramadan',
    'Meals',
    'Bakery',
    'Vegetables and Fruits',
    'Other',
  ];

  //type of quantity
  String? typeOfQuantity;
  List<String> listTypeOfQuantity = [
    'Kilo',
    'Meal',
  ];

  //List Deliver
  String? deliver;
  List<String> listOfDeliver = [
    'Send Delegate',
    'Deliver to us',
  ];

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
        print(selectedDate);
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(selectedDate);
        print(formatted);
        dateController.text = formatted;
        print(dateController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates states) {
        if (states is AppInsertDatabaseState) {
          Navigator.pop(context);
        }
      }, builder: (BuildContext context, AppStates state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Food Request',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
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
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            padding: const EdgeInsets.only(
                                bottom: 8, top: 8, left: 15, right: 7),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Constants.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Constants.primaryAppColor,
                                    width: 0.7)),
                            child: DropdownButton<String>(
                              isDense: true,
                              isExpanded: true,
                              underline: const SizedBox(),
                              hint: Text(
                                'Select Item',
                                style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              dropdownColor: Colors.grey,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18.0),
                              value: type,
                              onChanged: (newValue) {
                                setState(() {
                                  type = newValue!;
                                });
                              },
                              items: listType.map((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    defaultLine(context),

                    //Food Source
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            padding: const EdgeInsets.only(
                                bottom: 8, top: 8, left: 15, right: 7),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Constants.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Constants.primaryAppColor,
                                    width: 0.7)),
                            child: DropdownButton<String>(
                              isDense: true,
                              isExpanded: true,
                              underline: const SizedBox(),
                              hint: Text(
                                'Select Item',
                                style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              dropdownColor: Colors.grey,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18.0),
                              value: foodSource,
                              onChanged: (newValue) {
                                setState(() {
                                  foodSource = newValue!;
                                });
                              },
                              items: listFoodSource.map((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    defaultLine(context),

                    //type of Food
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            padding: const EdgeInsets.only(
                                bottom: 8, top: 8, left: 15, right: 7),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Constants.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Constants.primaryAppColor,
                                    width: 0.7)),
                            child: DropdownButton<String>(
                              isDense: true,
                              isExpanded: true,
                              underline: const SizedBox(),
                              hint: Text(
                                'Select Item',
                                style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              dropdownColor: Colors.grey,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18.0),
                              value: typeOfFood,
                              onChanged: (newValue) {
                                setState(() {
                                  typeOfFood = newValue!;
                                });
                              },
                              items: listTypeOfFood.map((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    defaultLine(context),
                    //Expiration Date
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 30),
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
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              labelText: 'Task Date',
                              prefixIcon: Icon(
                                Icons.calendar_today,
                              ),
                            ),
                            onTap: () => _selectDate(context),
                          ),
                        ],
                      ),
                    ),
                    defaultLine(context),

                    //Quantity
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 30),
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
                            padding: const EdgeInsets.only(
                                bottom: 8, top: 8, left: 15, right: 7),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: Constants.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Constants.primaryAppColor,
                                    width: 0.7)),
                            child: DropdownButton<String>(
                              isDense: true,
                              isExpanded: true,
                              underline: const SizedBox(),
                              hint: Text(
                                'Select Item',
                                style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              dropdownColor: Colors.grey,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18.0),
                              value: typeOfQuantity,
                              onChanged: (newValue) {
                                setState(() {
                                  typeOfQuantity = newValue!;
                                });
                              },
                              items: listTypeOfQuantity.map((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),
                          TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              labelText: 'Quantity',
                              prefixIcon: Icon(
                                Icons.production_quantity_limits,
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Should enter Quantity';
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
                      padding: const EdgeInsets.only(top: 20.0, bottom: 30),
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
                            controller: locationController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
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
                    //needy adress
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Needy Addresses',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Constants.primaryAppColor,
                                      width: 0.7)),
                              labelText: 'Address',
                              prefixIcon: Icon(
                                Icons.location_on,
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Address Needed';
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
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            padding: const EdgeInsets.only(
                                bottom: 8, top: 8, left: 15, right: 7),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: Constants.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Constants.primaryAppColor,
                                    width: 0.7)),
                            child: DropdownButton<String>(
                              isDense: true,
                              isExpanded: true,
                              underline: const SizedBox(),
                              hint: Text(
                                'Select Item',
                                style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              dropdownColor: Colors.grey,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18.0),
                              value: deliver,
                              onChanged: (newValue) {
                                setState(() {
                                  deliver = newValue!;
                                });
                              },
                              items: listOfDeliver.map((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: BlocBuilder<FoodRequestCubit, FoodRequestState>(
                          builder: (context, state) {
                        if (state is FoodRequestLoading) {
                          return SpinKitThreeBounce(
                            color: Constants.primaryAppColor,
                            size: size.width * .08,
                          );
                        } else {
                          return BtnWidget(
                            txt: "Done",
                            color: Constants.primaryAppColor,
                            onClicked: () {
                              MyApplication.checkConnection().then((value) {
                                if (formKey.currentState!.validate()) {
                                  if (value == true) {
                                    BlocProvider.of<FoodRequestCubit>(context)
                                        .requestFood(
                                            type: type,
                                            foodSource: foodSource,
                                            typeFood: typeOfFood,
                                            expDate: dateController.text,
                                            typeQuantity: typeOfQuantity,
                                            quantity: titleController.text,
                                            deliveryType: deliver,
                                            location: locationController.text,
                                            needyAddresses: addressController.text,
                                            context: context);
                                    print(sharedPrefs.id);
                                    print(type);
                                    print(foodSource);
                                    print(typeOfFood);
                                    print(dateController.text);
                                    print(typeOfQuantity);
                                    print(titleController.text);
                                    print(deliver);
                                    print(locationController.text);
                                    print(addressController.text);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'no Internet',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.SNACKBAR,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor:
                                            Constants.primaryAppColor,
                                        textColor: Constants.white,
                                        fontSize: 16.0);
                                  }
                                }
                              });
                            },
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
