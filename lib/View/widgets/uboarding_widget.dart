import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Style/Colors.dart';
import '../screens/login_screen.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class OnBoardingWidget extends StatelessWidget {
  final String imagePath;
  // final String sliderPhotoPath;
  final String title;
  final String subtitle1;
  final String subtitle2;
  VoidCallback onButtonClick;
  OnBoardingWidget(
      {Key? key,
      required this.imagePath,
      //  required this.sliderPhotoPath,
      required this.title,
      required this.subtitle1,
      required this.subtitle2,
      required this.onButtonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Constants.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + size.height * 0.02,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            },
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Constants.HINT,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .03,
          ),
          SvgPicture.asset(
            imagePath,
            height: size.height * .35,
            width: size.width,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: size.height * .05,
          ),
          // SvgPicture.asset(
          //   sliderPhotoPath,
          // ),
          SizedBox(height: size.height * .08),
          Text(
            title,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Constants.HINT,
                height: 2),
          ),
          SizedBox(
            height: size.height * .015,
          ),
          Text(
            subtitle1,
            style: const TextStyle(
                fontSize: 18.0, color: Constants.HINT, height: 2),
          ),
          Text(
            subtitle2,
            style: const TextStyle(
                fontSize: 16.0, color: Constants.HINT, height: 2),
          ),
          SizedBox(
            height: size.height * .1,
          ),
          InkWell(
            onTap: onButtonClick,
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Next',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Constants.HINT,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
