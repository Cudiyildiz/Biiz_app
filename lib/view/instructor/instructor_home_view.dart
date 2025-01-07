import 'package:flutter/material.dart';

class InstructorHomeView extends StatelessWidget {
  const InstructorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ana Sayfa",style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
