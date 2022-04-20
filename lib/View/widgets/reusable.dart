import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Data/Cubit/app_cubit/app_cubit.dart';

Widget defaultLine(context) => Container(
      width: double.infinity,
      height: 1.0,
      color: AppCubit.get(context).isDark
          ? HexColor('#212F3D')
          : HexColor('#EAEDED'),
    );
