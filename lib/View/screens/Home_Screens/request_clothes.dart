import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/Data/Cubit/clothes_request_cubit/clothes_request_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../../Data/Cubit/app_cubit/app_state.dart';
import '../../../Data/Cubit/clothes_request_cubit/Clothes_Request_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';
import '../../../helpers/sharedPreference.dart';
import '../../widgets/btn_widget.dart';
import '../../widgets/reusable.dart';

class RequestClothes extends StatefulWidget {
  const RequestClothes({Key? key}) : super(key: key);

  @override
  State<RequestClothes> createState() => _RequestClothesState();
}

class _RequestClothesState extends State<RequestClothes> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  String? gender;
  List<String> listOfGender = [
    'Men',
    'Woman',
    'Children',
  ];

  //List Of Clothes
  String? typeOfClothes;
  List<String> listTypeOfClothes = [
    'Skirt',
    'Dress',
    'Jacket',
    'Pants',
    'Shoes',
    'T_Shirt',
    'Socks',
    'Other',
  ];

  String? sizeOfClothes;
  List<String> listOfSize = [
    'Small',
    'Medium',
    'Large',
    '1X-Large',
    '2X-Large',
    '3X-Large',
    '4X-Large',
    '5X-Large',
    'Oversize',
  ];

  //List Quantity

  String? deliver;
  List<String> listOfDeliver = ['Send Delegate', 'Deliver to us'];

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
            title: const Text(
              ' Clothes Request',
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
                    //Gender
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: DropdownButton<String>(
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
                              value: gender,
                              isExpanded: true,
                              underline: const SizedBox(),
                              onChanged: (newValue) {
                                setState(() {
                                  gender = newValue;
                                });
                              },
                              items: listOfGender.map((valueItem) {
                                return DropdownMenuItem(
                                    value: valueItem, child: Text(valueItem));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    defaultLine(context),

                    //type of Clothes
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Type of Clothes',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: DropdownButton<String>(
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
                              value: typeOfClothes,
                              isExpanded: true,
                              underline: const SizedBox(),
                              onChanged: (newValue) {
                                setState(() {
                                  typeOfClothes = newValue;
                                });
                              },
                              items: listTypeOfClothes.map((valueItem) {
                                return DropdownMenuItem(
                                    value: valueItem, child: Text(valueItem));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    defaultLine(context),

                    //Size
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: DropdownButton<String>(
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
                              value: sizeOfClothes,
                              isExpanded: true,
                              underline: const SizedBox(),
                              onChanged: (newValue) {
                                setState(() {
                                  sizeOfClothes = newValue;
                                });
                              },
                              items: listOfSize.map((valueItem) {
                                return DropdownMenuItem(
                                    value: valueItem, child: Text(valueItem));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    defaultLine(context),

                    //Quantity
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.number,
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
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
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

                    //Needy Address
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
                              border: OutlineInputBorder(),
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
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: DropdownButton<String>(
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
                              isExpanded: true,
                              underline: const SizedBox(),
                              onChanged: (newValue) {
                                setState(() {
                                  deliver = newValue;
                                });
                              },
                              items: listOfDeliver.map((valueItem) {
                                return DropdownMenuItem(
                                    value: valueItem, child: Text(valueItem));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child:
                          BlocBuilder<ClothesRequestCubit, ClothesRequestState>(
                              builder: (context, state) {
                        if (state is ClothesRequestLoading) {
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
                                    BlocProvider.of<ClothesRequestCubit>(
                                            context)
                                        .requestClothes(
                                            gender: gender,
                                            type: typeOfClothes,
                                            size: sizeOfClothes,
                                            quantity: titleController.text,
                                            location: locationController.text,
                                            needyAddresses:
                                                addressController.text,
                                            deliveryType: deliver,
                                            context: context);
                                    print(sharedPrefs.id);
                                    print(gender);
                                    print(typeOfClothes);
                                    print(sizeOfClothes);
                                    print(titleController.text);
                                    print(locationController.text);
                                    print(addressController.text);
                                    print(deliver);
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
