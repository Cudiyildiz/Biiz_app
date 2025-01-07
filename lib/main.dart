import 'package:biiz/view/auth/login_view.dart';
import 'package:biiz/view/auth/password_reset_view.dart';
import 'package:biiz/view/auth/register_view.dart';
import 'package:biiz/view/instructor/instructor_course_view.dart';
import 'package:biiz/view/instructor/instructor_home_view.dart';
import 'package:biiz/view/instructor/instructor_profil_view.dart';
import 'package:biiz/view/instructor/instructor_view.dart';
import 'package:biiz/view/onboarding_view.dart';
import 'package:biiz/view/student/student_home_view.dart';
import 'package:biiz/viewmodels/auth/login_view_model.dart';
import 'package:biiz/viewmodels/auth/password_reset_view_model.dart';
import 'package:biiz/viewmodels/auth/register_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => PasswordResetViewModel()),
        // Diğer ViewModel'ler buraya eklenebilir
      ],
      child: MaterialApp(
        title: 'Biiz',
        debugShowCheckedModeBanner: false,
        routes: {
          "/loginPage": (context) => LoginPage(),
          "/registerPage": (context) => RegisterView(),
          "/onBoardingPage": (context) => OnBoardingPage(),
          "/studentPage": (context) => StudentHomeView(),
          "/instructorPage": (context) => InstructorView(),
          "/passwordResetPage": (context) =>PasswordResetView(),
          "/instructorHomePage": (context) =>InstructorHomeView(),
          "/instructorProfilPage": (context) =>InstructorProfilView(),
          "/instructorCoursePage": (context) =>InstructorCourseView(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: const OnBoardingPage(),
      ),
    );
  }
}
