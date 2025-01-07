import 'package:flutter/material.dart';
import '../../data/models/user/user.dart';
import '../../data/services/auth_service.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  // Text Controllers
  TextEditingController textIsim = TextEditingController();
  TextEditingController textSoyisim = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textSifre = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  bool _checkBoxKontrolOgrenci = false;
  bool _checkBoxKontrolEgitmen = false;
  bool get checkBoxKontrolOgrenci => _checkBoxKontrolOgrenci;
  bool get checkBoxKontrolEgitmen => _checkBoxKontrolEgitmen;

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void toggleCheckbox(bool isEgitmenSelected) {
    if (isEgitmenSelected) {
      _checkBoxKontrolEgitmen = !_checkBoxKontrolEgitmen;
      if (_checkBoxKontrolEgitmen) {
        _checkBoxKontrolOgrenci = false;
      }
    } else {
      _checkBoxKontrolOgrenci = !_checkBoxKontrolOgrenci;
      if (_checkBoxKontrolOgrenci) {
        _checkBoxKontrolEgitmen = false;
      }
    }
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    if (!_validateInputs(context)) return;

    try {
      _isLoading = true;
      notifyListeners();

      // Role kontrolü
      if (!_checkBoxKontrolOgrenci && !_checkBoxKontrolEgitmen) {
        throw Exception('Kullanıcı türü seçilmedi');
      }

      final String role = _checkBoxKontrolOgrenci ? 'student' : 'instructor';

      print('Registration started for role: $role'); // Debug log

      // Create user with Firebase Authentication
      final user = await _authService.createUserWithEmail(
        textEmail.text.trim(),
        textSifre.text,
        role,
      );

      print('User created in Firebase Auth: ${user?.uid}'); // Debug log

      if (user != null) {
        // Create user data model
        final userData = role == 'student'
            ? StudentModel(
          uid: user.uid,
          email: textEmail.text.trim(),
          role: role,
          name: textIsim.text.trim(),
          surname: textSoyisim.text.trim(),
          profilPictures: "asset/images/user.png",
          joinedCourses: [],
          createdAt: DateTime.now().toIso8601String(),
        )
            : InstructorModel(
          uid: user.uid,
          email: textEmail.text.trim(),
          role: role,
          name: textIsim.text.trim(),
          surname: textSoyisim.text.trim(),
          profilPictures: "asset/images/user.png",
          biography: "",
          createdAt: DateTime.now().toIso8601String(),
          createdCourses: [],
        );

        print('User model created: ${userData.toMap()}'); // Debug log

        // Save additional user data to Firestore
        await _authService.saveUserData(userData);

        print('User data saved to Firestore'); // Debug log

        _isLoading = false;
        notifyListeners();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kayıt başarılı! Giriş yapabilirsiniz.')),
        );

        // Navigate to login page
        Navigator.pushReplacementNamed(context, '/loginPage');
      }
    } catch (e, stackTrace) {
      print('Registration error: $e'); // Debug log
      print('Stack trace: $stackTrace'); // Debug log

      _isLoading = false;
      notifyListeners();

      String errorMessage = 'Kayıt işlemi başarısız: ${e.toString()}';
      if (e.toString().contains('email-already-in-use')) {
        errorMessage = 'Bu email adresi zaten kullanımda';
      } else if (e.toString().contains('weak-password')) {
        errorMessage = 'Şifre çok zayıf';
      } else if (e.toString().contains('invalid-email')) {
        errorMessage = 'Geçersiz email formatı';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  bool _validateInputs(BuildContext context) {
    if (textIsim.text.isEmpty || textSoyisim.text.isEmpty ||
        textEmail.text.isEmpty || textSifre.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
      return false;
    }

    if (!_checkBoxKontrolOgrenci && !_checkBoxKontrolEgitmen) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen kullanıcı türünü seçin')),
      );
      return false;
    }

    if (!textEmail.text.contains('@')||!textEmail.text.contains('gmail.com')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Geçerli bir email adresi girin')),
      );
      return false;
    }

    if (!RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).{8,}$').hasMatch(textSifre.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Şifre en az 8 karakter olmalı, bir büyük harf ve bir simge içermelidir'),
        ),
      );
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    textIsim.dispose();
    textSoyisim.dispose();
    textEmail.dispose();
    textSifre.dispose();
    super.dispose();
  }
}