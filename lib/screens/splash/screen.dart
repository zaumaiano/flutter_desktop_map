import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter_desktop_map/screens/map/screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _boot(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GlowingProgressIndicator(
        child: Image.asset(
          'assets/logo/white-logo.png',
          height: 120,
        ),
      )),
    );
  }

  void _boot(BuildContext context) async {
    Future.delayed(
      const Duration(
        milliseconds: 2000,
      ),
      () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MapScreen()),
          (route) => false),
    );
  }
}
