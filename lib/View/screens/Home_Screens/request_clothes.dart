import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../../Data/Cubit/app_cubit/app_state.dart';
import '../../widgets/reusable.dart';

class RequestClothes extends StatefulWidget {
  const RequestClothes({Key? key}) : super(key: key);

  @override
  State<RequestClothes> createState() => _RequestClothesState();
}

class _RequestClothesState extends State<RequestClothes> {
  String? gender;
  List <String>listOfGender=[
    'Men', 'Woman','Children',
  ];


  //List Of Clothes
  String? typeOfClothes;
  List <String> listTypeOfClothes=[
    'Skirt', 'Dress','Jacket','Pants','Shoes','T_Shirt','Socks','Other',
  ];

  String? size;
  List <String> listOfSize=[
    'Small', 'Medium','Large','1X-Large','2X-Large','3X-Large','4X-Large','5X-Large','Oversize',
  ];



  //List Quantity

  String? deliver;
  List <String> listOfDeliver=[
    'Send Delegate', 'Deliver to us'
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
                  ' Clothes Request',
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




                        //Gender
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical:20.0
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
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
                                  value: gender,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  onChanged: (newValue){
                                    setState(() {
                                      listOfGender =newValue as List<String>;
                                    });
                                  },
                                  items: listOfGender.map((valueItem){
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


                        //type of Clothes
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical:20.0
                          ),
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
                                  value: typeOfClothes,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  onChanged: (newValue){
                                    setState(() {
                                      listTypeOfClothes =newValue as List<String>;
                                    });
                                  },
                                  items: listTypeOfClothes.map((valueItem){
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


                        //Size
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical:20.0
                          ),
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
                                  value: size,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  onChanged: (newValue){
                                    setState(() {
                                      listOfSize =newValue as List<String>;
                                    });
                                  },
                                  items: listOfSize.map((valueItem){
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

                        //Needy Address
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical:20.0
                          ),
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
                                controller: titleController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Address',

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

