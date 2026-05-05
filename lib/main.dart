import 'package:bloc_test/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(appRouts: AppRouts()));
}

class MyApp extends StatelessWidget {
  final AppRouts appRouts;

  const MyApp({super.key, required this.appRouts});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouts.generateRoute,
    );
  }
}
