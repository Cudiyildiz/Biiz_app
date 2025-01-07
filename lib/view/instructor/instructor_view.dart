import 'package:biiz/core/theme/color.dart';
import 'package:biiz/view/instructor/instructor_course_view.dart';
import 'package:biiz/view/instructor/instructor_home_view.dart';
import 'package:biiz/view/instructor/instructor_profil_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstructorView extends StatefulWidget {
  const InstructorView({super.key});

  @override
  State<InstructorView> createState() => _InstructorViewState();
}
var viewsPage = [InstructorHomeView(), InstructorCourseView(), InstructorProfilView(),];

int _selectedIndex = 0;
class _InstructorViewState extends State<InstructorView> {
  // Widget türünde sayfalar


  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beyaz,
      body: viewsPage[_selectedIndex], // Widget nesnesi burada kullanılıyor
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: beyaz,
        elevation: 35,
        selectedItemColor: mavi,
        unselectedItemColor: Colors.grey[600],
        iconSize: 25,
        items:[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house), label: "Ana Sayfa"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.graduationCap), label: "Kurslar"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: "Profil"),
        ],
      ),
    );
  }
}
