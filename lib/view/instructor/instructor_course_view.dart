import 'package:flutter/material.dart';

class InstructorCourseView extends StatelessWidget {
  const InstructorCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kurslar",style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
