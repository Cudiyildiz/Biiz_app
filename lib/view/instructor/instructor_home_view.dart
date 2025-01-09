import 'package:biiz/core/theme/color.dart';
import 'package:biiz/view/shared/components/custom_button.dart';
import 'package:biiz/view/shared/components/custom_text.dart';
import 'package:flutter/material.dart';

class InstructorHomeView extends StatelessWidget {
  const InstructorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start, // Yazıları sola hizalar
          children: [
            Center(
              child: Image.asset("asset/images/image1.png"),
            ),
            const SizedBox(height: 16),
            CustomText(icerik: "Kursunuzu oluşturun ve yüzlerce\nöğrenciye ulaşın.",fontSize: 15,),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: acikGri,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // İçerideki boşluklar
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(icerik: "Kurs Oluşturmaya başlayın!",fontSize: 16,fontWeight: FontWeight.w600,),
                    CustomButton(
                      text: "Kurs oluşturun",
                      onPressed: () {},
                      color: mavi,
                      sideColor: mavi,
                      borderRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomText(icerik: "İlk kursunuzu oluşturuyorsanız, rehberimize göz atın.",fontSize: 15,),
            const SizedBox(height: 20),
            CustomButton(
              text: "Kurs oluşturma rehberi",
              onPressed: () {},
              color: mavi,
              sideColor: mavi,
              borderRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
