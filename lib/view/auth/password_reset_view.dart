import 'package:biiz/core/theme/color.dart';
import 'package:biiz/view/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biiz/viewmodels/auth/password_reset_view_model.dart';

import '../shared/components/custom_text_button.dart';
import '../shared/components/custom_textfield.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordModel = Provider.of<PasswordResetViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 40, left: 40, top: 65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Şifre Yenileme\nEkranı",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "popi",
                      fontSize: 18,
                    ),
                  ),
                  Image.asset("asset/icon/logo2.png", height: 200, width: 180),
                ],
              ),
              const SizedBox(height: 130),
              CustomTextField(
                controller: passwordModel.controller,
                text: "Email adresinizi giriniz.",
              ),
              const SizedBox(height: 20),
              if (passwordModel.errorMessage != null)
                Text(
                  passwordModel.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 150),
              CustomButton(text: "Şifre Yenile",isLoading: passwordModel.isLoading,  onPressed: () async {
                try {
                  await passwordModel.sendPasswordResetEmail();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Şifre Yenileme bağlantısı gönderildi."),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  Navigator.pop(context); // Geriye yönlendir
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Bir hata oluştu. Lütfen tekrar deneyin."),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },color: siyah,sideColor: siyah,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hesabınız yok mu?",
                    style: TextStyle(fontFamily: "popi", fontSize: 12),
                  ),
                  CustomTextButton(onPressed: (){Navigator.pushNamed(context, "/registerPage");}, text:"Kayıt Ol")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}