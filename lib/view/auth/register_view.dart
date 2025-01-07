import 'package:biiz/core/theme/color.dart';
import 'package:biiz/view/auth/login_view.dart';
import 'package:biiz/view/shared/components/custom_button.dart';
import 'package:biiz/view/shared/components/custom_text_button.dart';
import 'package:biiz/view/shared/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth/register_view_model.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<RegisterView> {

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegisterViewModel>(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 40, left: 40, top: 65),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Text(
                              "Yeni !\nHesap Oluştur,",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "popi",
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: 140,
                            child: Image.asset("asset/icon/logo2.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomTextField(controller: viewModel.textIsim, text: "İsim"),
                      SizedBox(height: 10),
                      CustomTextField(controller: viewModel.textSoyisim, text: "Soyisim"),
                      SizedBox(height: 10),
                      CustomTextField(controller: viewModel.textEmail, text: "Email"),
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: viewModel.textSifre,
                        text: "Şifre",
                        icon: IconButton(onPressed: viewModel.togglePasswordVisibility, icon:  Icon(
                          viewModel.obscureText ? Icons.visibility_off : Icons.visibility,
                        ),),
                        obsruceText: viewModel.obscureText,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  child: Checkbox(
                                    value: viewModel.checkBoxKontrolOgrenci,
                                    onChanged: (_) => viewModel.toggleCheckbox(false),
                                  ),
                                ),
                                Text(
                                  "Öğrenci",
                                  style: TextStyle(color: siyah),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  child: Checkbox(
                                    value: viewModel.checkBoxKontrolEgitmen,
                                    onChanged: (_) => viewModel.toggleCheckbox(true),
                                  ),
                                ),
                                Text(
                                  "Eğitmen",
                                  style: TextStyle(color: siyah),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      CustomButton(text: "Kayıt Ol",isLoading: viewModel.isLoading, onPressed: (){viewModel.register(context);},color: siyah,sideColor: siyah,),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hesabınız var mı?",
                            style: TextStyle(
                              fontFamily: "popi",
                              fontSize: 12,
                            ),
                          ),
                          CustomTextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));}, text: "Giriş Yap")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        );
  }
}
