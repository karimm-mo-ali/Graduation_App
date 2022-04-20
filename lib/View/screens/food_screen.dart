
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../Data/Cubit/app_cubit/app_state.dart';
import '../widgets/reusable.dart';
import '../widgets/reusable_component.dart';
import 'instructions_screen.dart';

class Food extends StatefulWidget {

  @override
  State<Food> createState() => _FoodState();
}


class _FoodState extends State<Food> {

  bool check1 =false;
  bool check2 = false;
  //List Gender
  String? genderChoose;
  List <String>listGender=[
    'Male','Female','Prefer Not Answer',
  ];
  //List Food
  String? foodType;

  List <String> listFood=[
    'Cooked','Un Cooked','Restaurant','Sweets','Others'
  ];
  //List Quantity
  String? quantityMeal;
  String? quantityKilo;
  List <String> listMeal=[
    '1 Meal','2 Meal','3 Meal','4 Meal','5 Meal','More',
  ];

  List <String> listKilo=[
    '1 Kilo','2 Kilo','3 Kilo','4 Kilo','5 Kilo','More',
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
                    'Food flutter_graduation',
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
                                    value: genderChoose,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (newValue){
                                      setState(() {
                                        genderChoose =newValue;
                                      });
                                    },
                                    items: listGender.map((valueItem){
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
                          //Food Type
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:20.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Food Type',
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
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Task Title',
                                    prefix: Icon(
                                      Icons.title,
                                    ),
                                  ),
                                  validator: (value) {
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Should enter date';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Task Date',
                                    border: OutlineInputBorder(),
                                    prefix: Icon(
                                      Icons.calendar_today,
                                    ),
                                  ),
                                  onTap: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2222-10-10'))
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value:check1 ,
                                                onChanged: (value){
                                                  if(check2=false){
                                                    check1=true;
                                                    setState(() {
                                                      check1=! value!;
                                                    });
                                                  }else{
                                                    setState(() {
                                                      check1= value!;
                                                    });
                                                  }
                                                },
                                                activeColor: Colors.green,
                                                checkColor: AppCubit.get(context).isDark?Colors.white:Colors.black,
                                              ),
                                              const Text(
                                                'Kilo',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value:check2,
                                                onChanged: (value){
                                                  if(check1=false){
                                                    check2=true;
                                                    setState(() {
                                                      check2=! value!;
                                                    });
                                                  }else{
                                                    setState(() {
                                                      check2= value!;
                                                    });
                                                  }

                                                }
                                                ,
                                                activeColor: Colors.green,
                                                checkColor: AppCubit.get(context).isDark?Colors.white:Colors.black,
                                              ),
                                              const Text(
                                                'Meal',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: DropdownButton<String>(
                                      hint:Text(
                                        check1 ?'Select Number Of Kilo': 'Select Number Of Meal',
                                        style: TextStyle(
                                          color: AppCubit.get(context).isDark?Colors.white:Colors.black,
                                        ),
                                      ),
                                      dropdownColor: Colors.grey,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 36,
                                      style: TextStyle(
                                          color:  AppCubit.get(context).isDark?Colors.white:Colors.black,
                                          fontSize: 18.0
                                      ),
                                      value: check1? quantityKilo:quantityMeal,
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      onChanged: (newValue){
                                        if(check1){
                                          setState(() {
                                            quantityKilo =newValue;
                                          });
                                        }else{
                                          setState(() {
                                            quantityMeal =newValue;
                                          });
                                        }
                                      },
                                      items: check1? listKilo.map((valueItem){
                                        return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(valueItem));
                                      }).toList():listMeal.map((valueItem){
                                        return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(valueItem));
                                      }).toList()
                                  ),
                                ),
                              ],
                            ),
                          ),
                          defaultLine(context),
                          const SizedBox(
                            height: 20.0,
                          ),
                          //Buttons
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
                                'Send Delegate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),),
                          ),
                          const SizedBox(
                            height: 20.0,
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
                                'Deliver To Us',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          defaultLine(context),
                          //instruction
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

      ),
    );
  }
}
