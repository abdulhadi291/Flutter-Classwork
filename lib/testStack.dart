import 'package:flutter/material.dart';

class Teststack extends StatelessWidget {
  const Teststack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Stack', style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.deepPurple.shade300),
            width: 200,
            height: 200,
          ),
          Positioned(
              top: 20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green),
                height: 180,
                width: 200,
              )),
          Positioned(
              top: 40,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber),
                height: 170,
                width: 200,
              )),
          Positioned(
              top: 60,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 3, 250, 217)),
                height: 160,
                width: 200,
              )),
        ],
      ),
    );
  }
}
