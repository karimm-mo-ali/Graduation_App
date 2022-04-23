import 'package:flutter/material.dart';
import '../../../Data/Cubit/app_cubit/app_cubit.dart';
import '../../widgets/reusable.dart';
import '../../widgets/reusable_component.dart';
import '../SideMenu_Screens/instructions_screen.dart';

class Clothes extends StatefulWidget {

  @override
  State<Clothes> createState() => _Clothes();
}


class _Clothes extends State<Clothes> {

  bool check1 =false;
  bool check2 = false;
  //List Size
  String? sizeChoose;
  List <String>listSize=[
    'Small','Medium','Large','1 X-Large','2 X-Large','3 X-Large','4 X-Large','5 X-Large','OverSize',
  ];
  //List Food
  String? quantity;

  List <String> listQuantity=[
    '1 Pieces','2 Pieces','3 Pieces','4 Pieces','4 Pieces','6 Pieces','Other'
  ];
  //List Clothes
  String? maleClothes;
  String? femaleClothes;
  List <String> listFeMaleClothes=[
    'Shirt','Te-Shirt','Pants','Jacket','Shoes','Other',
  ];

  List <String> listMaleClothes=[
    'Skirt','Dress','Jacket','Shirt','Te-Shirt','Pants','Shoes','Other',
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text(
          'Clothes Donation',
          style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              //Gender and Clothes Type
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical:20.0
                ),
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
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
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
                                          'Male',
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
                                          'Female',
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, bottom: 12.0
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(left: 16,right: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: DropdownButton<String>(
                                  hint:Text(
                                    check1?'Select Type Of Male Clothes':'Select Type Of Female Clothes',
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
                                  value: check1? femaleClothes:maleClothes,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  onChanged: (newValue){
                                    if(check1){
                                      setState(() {
                                        femaleClothes =newValue;
                                      });
                                    }else{
                                      setState(() {
                                        maleClothes =newValue;
                                      });
                                    }
                                  },
                                  items: check1? listFeMaleClothes.map((valueItem){
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem));
                                  }).toList():listMaleClothes.map((valueItem){
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem));
                                  }).toList()
                              ),
                            ),
                          ),
                        ],
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
                  children:  [
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
                        value: sizeChoose,
                        isExpanded: true,
                        underline: const SizedBox(),
                        onChanged: (newValue){
                          setState(() {
                            sizeChoose =newValue;
                          });
                        },
                        items: listSize.map((valueItem){
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
              //Clothes Type
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
                          'Number Of Pieces',
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
                        value: quantity,
                        isExpanded: true,
                        underline: const SizedBox(),
                        onChanged: (newValue){
                          setState(() {
                            quantity =newValue;
                          });
                        },
                        items: listQuantity.map((valueItem){
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
    );
  }
}
