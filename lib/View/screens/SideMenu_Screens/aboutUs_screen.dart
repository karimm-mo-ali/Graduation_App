// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Style/Colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // leading: InkWell(
        //   onTap: () => Navigator.pop(context),
        //   child: const Padding(
        //     padding: EdgeInsetsDirectional.only(start: 10),
        //     child: Icon(Icons.arrow_back_ios),
        //   ),
        // ),
        title: const Text("About US", style: TextStyle(fontSize: 19)),
      ),
      // appBar: AppBar(
      //   backgroundColor: Constants.primaryAppColor,
      //   shape: CustomShapeBorder(),
      //   leading: const Icon(Icons.arrow_back_ios),
      //   title: const Text("About", style: TextStyle(fontSize: 19)),
      // ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Constants.primaryAppColor,
      //   elevation: 0.0,
      //   leading: InkWell(
      //     onTap: () => Navigator.pop(context),
      //     child: const Padding(
      //       padding: EdgeInsetsDirectional.only(start: 10),
      //       child: Icon(Icons.arrow_back_ios),
      //     ),
      //   ),
      //   title: const Text("About", style: TextStyle(fontSize: 19)),
      // ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsetsDirectional.only(
                top: size.height * 0.06,
                bottom: size.height * 0.03,
                start: size.width * 0.06,
                end: size.width * 0.06),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "OUR STORY",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "At the beginning of the talk, we will explain to you who we are...",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "We are a group of youth studying at the Faculty of Computers and Information,",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "and we decided together that our graduation project should be first and foremost in charitable work.",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "And now we will explain a brief overview of what we present in this application.",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )),
        Column(
          children: const [
            Text(
              " The application is divided into two parts : ",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "-  the first part is a donation:",
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "in this part any person or institution can donate clothes or food of all kinds  ",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              " and be sure one hundred percent that donate God willing It will reach those who deserve it.",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " - The second part is a request:",
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "In this part people who are familiar with the places of the needy and the poor  ",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "or charitable institutions can submit a request to us, whether (food or clothing). ",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "Also for safety, the person making the request should put the addresses of the poor ",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "and needy who these things will reach to them , ",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "and we will also go to these addresses every period to make sure that food ",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              " and clothing reach them for sure. ",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Finally, we will explain why we do this :",
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "In fact we see many and many poor and needy people who need help   ",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "and we try our best to be a reason to help them in one way or another.",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "We pray to God that this application will be of assistance to them",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              "and that God reward us with goodness for that.",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Image.asset("assets/images.jpg", height: size.height * 0.7),
        Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
              SizedBox(
                height: 40,
              ),
              Text(
                "Designed By :",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ahmed Tarek , Ahmed Sabry , Kariem Mohamed",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Haidy mohamed , Mona Samir , Entesar Mohamed ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 40,
              )
            ]))
      ])),
    );
  }
}

// class CustomShapeBorder extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     const double innerCircleRadius = 150.0;
//
//     Path path = Path();
//     path.lineTo(0, rect.height);
//     path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30,
//         rect.height + 15, rect.width / 2 - 75, rect.height + 50);
//     path.cubicTo(
//         rect.width / 2 - 40,
//         rect.height + innerCircleRadius - 40,
//         rect.width / 2 + 40,
//         rect.height + innerCircleRadius - 40,
//         rect.width / 2 + 75,
//         rect.height + 50);
//     path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30,
//         rect.height + 15, rect.width, rect.height);
//     path.lineTo(rect.width, 0.0);
//     path.close();
//
//     return path;
//   }
// }
