import 'package:flutter/material.dart';
import 'package:flutter_desktop_map/screens/splash/screen.dart';

class DesktopMapApp extends StatelessWidget {
  const DesktopMapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const SplashScreen(),
    );
  }
}
