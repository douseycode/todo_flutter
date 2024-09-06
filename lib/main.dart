import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:todo/rootes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
          )
        ),
        primarySwatch: Colors.blue,
        fontFamily: "Poppins"
      ),
      initialRoute: GetRoutes.login, 
      getPages: GetRoutes.routes,
    );
  }
}

