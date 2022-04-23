import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/Data/Cubit/signUp_cubit/signUP_cubit.dart';
import 'package:flutter_graduation/View/screens/Auth_Screens/splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Data/Cubit/app_cubit/app_cubit.dart';
import 'Data/Cubit/app_cubit/app_state.dart';
import 'Data/Cubit/login_cubit/login_cubit.dart';
import 'View/screens/SideMenu_Screens/instructions_screen.dart';
import 'app/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  // ignore: prefer_const_constructors_in_immutables
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //   BlocProvider<ForgetPassCubit>(create: (context) => ForgetPassCubit()),
        //   BlocProvider<OrdersListCubit>(create: (context) => OrdersListCubit()),
        // BlocProvider<NotificationsCubit>(
        //     create: (context) => NotificationsCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                drawerTheme: DrawerThemeData(
                  backgroundColor: HexColor('#F4F6F7'),
                ),
                primarySwatch: Colors.green,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    titleSpacing: 20.0,
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white,
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    )),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.green,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  bodyText2: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            darkTheme: ThemeData(
              buttonTheme: const ButtonThemeData(),
              drawerTheme: DrawerThemeData(
                backgroundColor: HexColor('#1C2833'),
              ),
              scaffoldBackgroundColor: HexColor('#1C2833'),
              primarySwatch: Colors.green,
              backgroundColor: HexColor('#1C2833'),
              appBarTheme: AppBarTheme(
                backgroundColor: HexColor('#1C2833'),
                titleSpacing: 20.0,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: HexColor('#1C2833 '),
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('#1C2833 '),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                bodyText2: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: InstructionsScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
