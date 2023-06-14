import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_calculator/view/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: HomeScreen(),
      );
    });
  }
}
