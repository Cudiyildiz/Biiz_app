import 'package:flutter/material.dart';

class InstructorProfilView extends StatelessWidget {
  const InstructorProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profil",style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
