import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation/View/screens/Home_Screens/home_screen.dart';
import 'package:flutter_graduation/View/screens/SideMenu_Screens/aboutUs_screen.dart';
import 'package:flutter_graduation/View/screens/SideMenu_Screens/settings_screen.dart';
import 'package:flutter_graduation/app/webview_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Data/Cubit/logout_cubit/logout_cubit.dart';
import '../../../Data/Cubit/logout_cubit/logout_state.dart';
import '../../../Style/Colors.dart';
import '../../../helpers/myApplication.dart';
import 'conact_us_screen.dart';
import 'instructions_screen.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SideMenuScreenState createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;

  @override
  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildContent(),
          _buildDrawer(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Home Screen',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: [
        AnimatedBuilder(
          animation: _drawerSlideController,
          builder: (context, child) {
            return IconButton(
              onPressed: _toggleDrawer,
              icon: _isDrawerOpen() || _isDrawerOpening()
                  ? const Icon(
                      Icons.clear,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContent() {
    // Put page content here.
    return Home();
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - _drawerSlideController.value, 0.0),
          child: _isDrawerClosed() ? Home() : const Menu(),
        );
      },
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _menuTitles = [
    'Instructions',
    'Settings',
    'About',
    'ContactUs',
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    super.initState();
    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (_menuTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildFlutterLogo(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return Positioned(
      right: 50,
      left: 50,
      bottom: 50,
      child: Opacity(
        opacity: 0.5,
        child: Image.asset("assets/logo3.jpg", height: 300),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ..._buildListItems(),
        const Spacer(),
        _buildGetStartedButton(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
            child: InkWell(
              onTap: () => _menuTitles[i] == "About"
                  ? MyApplication.navigateTo(context, WebViewScreen('https://fi-alkhair.webautobazaar.com/en/lang/about'))
                  : _menuTitles[i] == "Instructions"
                      ? MyApplication.navigateTo(context,WebViewScreen('https://fi-alkhair.webautobazaar.com/en/lang/instructions'))
                      : _menuTitles[i] == "Settings"
                          ? MyApplication.navigateTo(context, SettingsScreen())
                          : _menuTitles[i] == "ContactUs"
                              ? MyApplication.navigateTo(
                                  context, ContactUsScreen())
                              : null,
              child: Text(
                _menuTitles[i],
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    color: Constants.HINT,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  Widget _buildGetStartedButton() {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<LogoutCubit, LogoutState>(builder: (context, state) {
      if (state is LogoutLoading) {
        return Column(
          children: [
            SpinKitThreeBounce(
              color: Constants.primaryAppColor,
              size: size.width * .08,
            ),
            SizedBox(height: size.height * 0.05)
          ],
        );
      } else {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: AnimatedBuilder(
              animation: _staggeredController,
              builder: (context, child) {
                final animationPercent = Curves.elasticOut.transform(
                    _buttonInterval.transform(_staggeredController.value));
                final opacity = animationPercent.clamp(0.0, 1.0);
                final scale = (animationPercent * 0.5) + 0.5;
                return Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: child,
                  ),
                );
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Constants.primaryAppColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                ),
                onPressed: () {
                  MyApplication.checkConnection().then((value) {
                    if (value == true) {
                      BlocProvider.of<LogoutCubit>(context)
                          .logout(context: context);
                    } else {
                      Fluttertoast.showToast(
                          msg: 'no Internet',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Constants.primaryAppColor,
                          textColor: Constants.white,
                          fontSize: 16.0);
                    }
                  });
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Constants.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
