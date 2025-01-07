import 'package:biiz/core/theme/color.dart';
import 'package:biiz/view/shared/components/custom_button.dart';
import 'package:biiz/view/shared/components/custom_text_button.dart';
import 'package:biiz/view/shared/components/custom_textfield.dart';
import 'package:biiz/viewmodels/auth/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

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
                  Text(
                    "Merhaba !\nTekrardan\nHoşgeldiniz,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "popi",
                        fontSize: 18),
                  ),
                  Image.asset("asset/icon/logo2.png", height: 200, width: 180),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 80),
                child: Column(
                  children: [
                    CustomTextField(controller: loginViewModel.emailController, text: "Email"),
                    SizedBox(height: 10),
                    CustomTextField(
                      controller: loginViewModel.passwordController,
                      text: "Şifre",
                      icon: IconButton(onPressed: loginViewModel.togglePasswordVisibility, icon: Icon(
                        loginViewModel.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),),
                    ),

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Checkbox(
                          value: loginViewModel.rememberMe,
                          onChanged: loginViewModel.updateRememberMe,
                        ),
                        Text(
                          "Beni Hatırla",
                          style: TextStyle(fontFamily: "popi", fontSize: 12),
                        ),
                        Spacer(),

                        CustomTextButton(onPressed: (){Navigator.pushNamed(context, "/passwordResetPage");}, text: "Şifrenizi mi unuttunuz?",renk: siyah,),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  CustomButton(text: "Giriş Yap",isLoading: loginViewModel.isLoading, onPressed:(){
                    loginViewModel.login(context);
                  },color: Colors.black,sideColor: Colors.black,),
                  SizedBox(height: 15),
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
