import 'package:flutter/material.dart';

import '../../Style/Colors.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class BtnWidget extends StatelessWidget {
  final String txt;
  VoidCallback onClicked;
  Color color;
  Widget? icon;
  BtnWidget(
      {Key? key,
      required this.txt,
      required this.onClicked,
      required this.color,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: SizedBox(
        height: size.height * 0.065,
        child: ElevatedButton(
          onPressed: onClicked,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              elevation: MaterialStateProperty.all(0.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Row(
                      children: [
                        icon!,
                        const SizedBox(
                          width: 10.0,
                        ),
                      ],
                    )
                  : Container(),
              Text(txt,
                  style: TextStyle(
                      color: color == Colors.redAccent.withOpacity(0.55)
                          ? Colors.black
                          : color == Colors.white
                              ? Constants.primaryAppColor
                              : Constants.white,
                      fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
