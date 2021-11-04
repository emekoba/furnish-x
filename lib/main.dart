import 'package:flutter/material.dart';
import 'package:furnish_x/furnish_x/furnish_x.dart';
import 'package:furnish_x/globals/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furnish X',
      theme: AppTheme.light,
      home: const FurnishX(),
    );
  }
}
