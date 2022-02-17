import 'package:flutter/material.dart';
import 'package:fruit_hub/constants/app_colors.dart';
import 'package:fruit_hub/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        fontFamily: "Grotesque",
      ),
      initialRoute: "/splash",
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
