import 'package:flutter/material.dart';

class InstructorHomeView extends StatefulWidget {
  const InstructorHomeView({super.key});

  @override
  State<InstructorHomeView> createState() => _InstructorHomeViewState();
}

class _InstructorHomeViewState extends State<InstructorHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eğitmen Sayfası"),
      ),
    );
  }
}
