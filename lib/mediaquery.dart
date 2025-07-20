import 'package:flutter/material.dart';

class MediaQueryPractice extends StatelessWidget {
  const MediaQueryPractice
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
  title: Text('Media Query Practice', style: TextStyle(color: Colors.white),),
),
body: Container(
  width: MediaQuery.of(context).size.width * 0.50,
  height:MediaQuery.of(context).size.height * 0.50 ,
  color: Colors.red,
),
    );
  }
}