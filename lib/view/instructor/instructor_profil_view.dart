import 'package:biiz/core/theme/color.dart';
import 'package:biiz/view/shared/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstructorProfilView extends StatelessWidget {
  const InstructorProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(child: CustomText(icerik: "PROFİL",fontSize: 25,fontWeight: FontWeight.w500,fontFamily: "rust"),opacity: 0.6,),
                Opacity(child: IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.cartShopping)),opacity: 0.8,),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Column(
            children: [
              Stack(
                children: [
                  Image.asset("asset/images/user.png",width: 165,height: 165,),
                  Positioned(
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.settings,size: 30,),),
                    top: -11,
                    right: -5,
                  )
                ],
              ),
              CustomText(icerik: "Cudi Yıldız",fontSize: 20,fontWeight: FontWeight.bold,),
              SizedBox(height: 10,),
              CustomText(icerik: "cudiyildiz36@gmail.com",fontSize: 15,),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [CustomText(icerik: "600",fontSize: 15,),SizedBox(width: 5,),CustomText(icerik: "Öğrenci",fontSize: 15,)],),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [CustomText(icerik: "5",fontSize: 15,),SizedBox(width: 5,),CustomText(icerik: "Kurs",fontSize: 15,)],),
            ],
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(child: CustomText(icerik: "Hesap Ayarları",fontSize: 18,fontWeight: FontWeight.bold,),opacity: 0.75,),
                SizedBox(height: 10,),
                CustomText(icerik: "Dil tercihi",fontSize: 16,),
                SizedBox(height: 10,),
                CustomText(icerik: "Hesap güvenliği",fontSize: 16,),
                SizedBox(height: 20,),
                Opacity(child: CustomText(icerik: "Yardım ve Destek",fontSize: 18,fontWeight: FontWeight.bold,),opacity: 0.75,),
                SizedBox(height: 10,),
                CustomText(icerik: "Biiz Kimiz?",fontSize: 16,),
                SizedBox(height: 10,),
                CustomText(icerik: "Biiz uygulamasını paylaş",fontSize: 16,),
                SizedBox(height: 10,),
              ],
            ),
          ),
          SizedBox(height: 25,),
          Center(
            child: CustomText(icerik: "Çıkış yap",fontSize: 20,fontWeight: FontWeight.bold,color: mavi,),
          )
        ],
      ),
    );
  }
}
