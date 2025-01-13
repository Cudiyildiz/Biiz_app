import 'package:biiz/view/student/myCourses.dart';
import 'package:biiz/view/student/myFavorites.dart';
import 'package:biiz/view/student/profil.dart';
import 'package:biiz/view/student/search.dart';
import 'package:biiz/view/student/student_home_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/theme/color.dart';

class StudentViews extends StatefulWidget {
  const StudentViews({super.key});
  @override
  State<StudentViews> createState() => _StudentViewsState();
}
var viewsPage = [StudentHomeView(), Search(),MyCourses(),MyFavorites(),Profil()];

int _selectedIndex = 0;
class _StudentViewsState extends State<StudentViews> {

  void _onItemTapped(index) {
    setState(() {
      if (index >= 0 && index < viewsPage.length) {
        _selectedIndex = index;
      }
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "My Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );;
  }
}
