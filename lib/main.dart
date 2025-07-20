import 'package:class_task/mediaquery.dart';
import 'package:class_task/reelPage.dart';
import 'package:class_task/screen1.dart';
import 'package:class_task/tabbar.dart';
import 'package:class_task/testStack.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ReelsPage());
  }
}