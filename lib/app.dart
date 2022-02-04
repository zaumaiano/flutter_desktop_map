import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_map/screens/splash/screen.dart';

class DesktopMapApp extends StatelessWidget {
  const DesktopMapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Desktop Map',
      theme: ThemeData(
        accentColor: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const SplashScreen(),
    );
  }
}
