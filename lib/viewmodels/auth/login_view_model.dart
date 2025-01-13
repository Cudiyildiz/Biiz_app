import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void updateRememberMe(bool? value) {
    _rememberMe = value ?? false;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (!_validateInputs(context)) return;

    try {
      _isLoading = true;
      notifyListeners();

      // Sign in with Firebase
      final user = await _authService.signInWithEmail(
        emailController.text.trim(),
        passwordController.text,
      );

      if (user != null) {
        // Get user role
        final role = await _authService.getUserRole(user.uid);

        _isLoading = false;
        notifyListeners();

        // Navigate based on role
        if (role == 'student') {
          Navigator.pushReplacementNamed(context, '/studentView');
        } else if (role == 'instructor') {
          Navigator.pushReplacementNamed(context, '/instructorPage');
        }
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();

      String errorMessage = 'Giriş başarısız';
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'Kullanıcı bulunamadı';
            break;
          case 'wrong-password':
            errorMessage = 'Yanlış şifre';
            break;
          case 'invalid-email':
            errorMessage = 'Geçersiz email formatı';
            break;
          case 'user-disabled':
            errorMessage = 'Kullanıcı hesabı devre dışı';
            break;
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  bool _validateInputs(BuildContext context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email ve şifre boş olamaz')),
      );
      return false;
    }

    if (!emailController.text.contains('@') ||!emailController.text.contains('gmail.com')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Geçerli bir email adresi girin')),
      );
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}