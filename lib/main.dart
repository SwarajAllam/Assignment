import 'package:assignment/view/home/home_screen.dart';
import 'package:assignment/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Fitness App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,  // Use system theme
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}


