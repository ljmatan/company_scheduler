import 'package:company_scheduler/logic/data/user_info.dart';
import 'package:company_scheduler/ui/dashboard/dashboard_screen.dart';
import 'package:company_scheduler/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  bool _loggedIn = UserInfo.id != null;

  AnimationController _animationController;
  Animation<double> _offset;
  Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    final Animation curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _opacity = Tween<double>(begin: 1, end: 0).animate(_animationController);
    _offset = Tween<double>(
      begin: 0.0,
      end: 2000,
    ).animate(curve);
    _animationController.addListener(() => setState(() {
          if (_animationController.isCompleted) {
            _loggedIn = true;
            _animationController.reverse();
          }
        }));
  }

  final String _image = math.Random().nextInt(7).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: ClipRRect(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/dash/' + _image + '.jpg',
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    child: Container(color: Colors.black12),
                    filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                  )
                ],
              ),
            ),
            width: double.infinity,
          ),
          Opacity(
            opacity: _opacity.value,
            child: Transform.translate(
              offset: Offset(0, _offset.value),
              child: _loggedIn
                  ? DashboardScreen()
                  : LoginScreen(animationController: _animationController),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
