// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

import '../../Style/Colors.dart';

class InstructionsScreen extends StatefulWidget {
  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constants.primaryAppColor,
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsetsDirectional.only(start: 10),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text("Instructions", style: TextStyle(fontSize: 19)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              top: size.height * 0.03,
              bottom: size.height * 0.03,
              start: size.width * 0.06,
              end: size.width * 0.06),
          child: Column(
            children: const [
              Text(
                "WHO WE ARE AND WHAT THIS AGREEMENT DOES : We are Deliver E Hub Limited, a company registered in England and Wales whose company number is 10547511 and our registered office is at Bonded Warehouse, 18 Lower Byrom Street, Manchester, M3 4AP. (“We/us/our).You can contact us by writing to us at the above address or emailing us on support@deliveryapp.com YOUR PRIVACY We only use any personal data we collect through your use of the App and the Services in the ways set out in our privacy policy. Please be aware that internet transmissions are never completely private or secure and that any message or information you send using the App or any Service may be read or intercepted by others, even if there is a special notice that a particular transmission is encrypted. ADDITIONAL TERMS In addition to the terms set out in this Agreement, the following terms also apply:Our privacy and cookies policyOur website user terms and acceptable use policy Our Service terms and conditions: If you are a customer wishing to request the services of our drivers – Book a",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
              ),
              Text(
                "WHO WE ARE AND WHAT THIS AGREEMENT DOES : We are Deliver E Hub Limited, a company registered in England and Wales whose company number is 10547511 and our registered office is at Bonded Warehouse, 18 Lower Byrom Street, Manchester, M3 4AP. (“We/us/our).You can contact us by writing to us at the above address or emailing us on support@deliveryapp.com YOUR PRIVACY We only use any personal data we collect through your use of the App and the Services in the ways set out in our privacy policy. Please be aware that internet transmissions are never completely private or secure and that any message or information you send using the App or any Service may be read or intercepted by others, even if there is a special notice that a particular transmission is encrypted. ADDITIONAL TERMS In addition to the terms set out in this Agreement, the following terms also apply:Our privacy and cookies policyOur website user terms and acceptable use policy Our Service terms and conditions: If you are a customer wishing to request the services of our drivers – Book a",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
              ),
              Text(
                "WHO WE ARE AND WHAT THIS AGREEMENT DOES : We are Deliver E Hub Limited, a company registered in England and Wales whose company number is 10547511 and our registered office is at Bonded Warehouse, 18 Lower Byrom Street, Manchester, M3 4AP. (“We/us/our).You can contact us by writing to us at the above address or emailing us on support@deliveryapp.com YOUR PRIVACY We only use any personal data we collect through your use of the App and the Services in the ways set out in our privacy policy. Please be aware that internet transmissions are never completely private or secure and that any message or information you send using the App or any Service may be read or intercepted by others, even if there is a special notice that a particular transmission is encrypted. ADDITIONAL TERMS In addition to the terms set out in this Agreement, the following terms also apply:Our privacy and cookies policyOur website user terms and acceptable use policy Our Service terms and conditions: If you are a customer wishing to request the services of our drivers – Book a",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
              ),
              Text(
                "WHO WE ARE AND WHAT THIS AGREEMENT DOES : We are Deliver E Hub Limited, a company registered in England and Wales whose company number is 10547511 and our registered office is at Bonded Warehouse, 18 Lower Byrom Street, Manchester, M3 4AP. (“We/us/our).You can contact us by writing to us at the above address or emailing us on support@deliveryapp.com YOUR PRIVACY We only use any personal data we collect through your use of the App and the Services in the ways set out in our privacy policy. Please be aware that internet transmissions are never completely private or secure and that any message or information you send using the App or any Service may be read or intercepted by others, even if there is a special notice that a particular transmission is encrypted. ADDITIONAL TERMS In addition to the terms set out in this Agreement, the following terms also apply:Our privacy and cookies policyOur website user terms and acceptable use policy Our Service terms and conditions: If you are a customer wishing to request the services of our drivers – Book a",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}
