import 'package:biiz/core/theme/color.dart';
import 'package:biiz/view/shared/components/custom_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                    height: 250,
                    width: 300,
                    child: Image.asset("asset/images/logo.png")
                ),
                Text("Biiz'e Hoşgeldiniz.",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "popi",
                  fontSize: 18,
                ),),
              ],
            ),
            Column(
              children: [
                CustomButton(text: "Giriş Yap", onPressed: (){
                  Navigator.pushNamed(context,"/loginPage");
                },color: Colors.black,sideColor: Colors.black,),
                SizedBox(height: 10,),
                CustomButton(text: " Kayıt Ol ", onPressed: (){
                  Navigator.pushNamed(context, "/registerPage");
                },color: Colors.white,textColor: Colors.black,sideColor: mavi,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
