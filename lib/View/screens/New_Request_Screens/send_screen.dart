import 'package:flutter/material.dart';
import 'package:flutter_graduation/Style/Colors.dart';
import 'package:flutter_graduation/View/screens/Home_Screens/home_screen.dart';
import 'package:flutter_graduation/View/screens/New_Request_Screens/map_utils.dart';
import 'package:flutter_graduation/View/widgets/btn_widget.dart';
import 'package:flutter_graduation/View/widgets/reusable_component.dart';
import 'package:flutter_graduation/View/widgets/txtfield_widget.dart';
import 'package:flutter_graduation/helpers/myApplication.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendScreen extends StatelessWidget {
  SendScreen({Key? key}) : super(key: key);

  final TextEditingController locationTextEditingController =
  TextEditingController();

  final TextEditingController needyLocationTextEditingController =
  TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar (),
      body :SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //logo
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * .0001, bottom: size.height * .001),
                  child: Center(
                    child: Image.asset("assets/logo3.jpg",
                        height: size.height * 0.4),
                  ),
                ),


                //location
                Text(
                    'Your Location'
                ),
                SizedBox(
                  height: 10.0,
                ),
                TxtFieldWidget(
                  hintTxt: "Location",
                  textInputType: TextInputType.streetAddress,
                  isHasNextFocus: true,
                  textEditingController: locationTextEditingController,
                ),

                SizedBox(
                  height: 10.0,
                ),


                // needy location
                Text(
                    'Needy Location'
                ),
                SizedBox(
                  height: 10.0,
                ),
                TxtFieldWidget(
                  hintTxt: "Location",
                  textInputType: TextInputType.streetAddress,
                  isHasNextFocus: true,
                  textEditingController: needyLocationTextEditingController,
                ),

                SizedBox(
                  height: 10.0,
                ),

                //buttons
                BtnWidget(
                txt: "Send Delegate",
                color: Constants.primaryAppColor,
                onClicked: () {
                  MyApplication.checkConnection().then((value) {
                    if (_formKey.currentState!.validate()) {
                      Fluttertoast.showToast(
                          msg: 'Request done Successfully',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 3,
                          backgroundColor:
                          Constants.primaryAppColor,
                          textColor: Constants.white,
                          fontSize: 16.0);
                      navigateAndFinish(context, Home());
                    }else{
                      Fluttertoast.showToast(
                          msg: 'Enter Locations',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 3,
                          backgroundColor:
                          Constants.primaryAppColor,
                          textColor: Constants.white,
                          fontSize: 16.0);
                    }
                  });
                },
              ),

                SizedBox(
                  height: 15,
                ),
                BtnWidget(
                  txt: "Deliver To Us",
                  color: Constants.primaryAppColor,
                  onClicked: () {
                    MyApplication.checkConnection().then((value) {
                      if (_formKey.currentState!.validate()) {
                        Fluttertoast.showToast(
                            msg: 'Request done Successfully',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 3,
                            backgroundColor:
                            Constants.primaryAppColor,
                            textColor: Constants.white,
                            fontSize: 16.0);
                        navigateAndFinish(context, Home());
                      }else{
                        Fluttertoast.showToast(
                            msg: 'Enter Locations',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 3,
                            backgroundColor:
                            Constants.primaryAppColor,
                            textColor: Constants.white,
                            fontSize: 16.0);
                      }
                    });
                  },
                ),

                SizedBox(
                  height: 20.0,
                ),
                //our location
                Row(
                  children: [
                    Text(
                        'you can see our location from',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                          MapUtils.openMap(30.6158239, 31.1137432);
                        },
                        child: Text(
                          'Here',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),

                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
