import 'package:flutter/material.dart';
import '../../data/services/auth_service.dart';


class PasswordResetViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  Future<bool> sendPasswordResetEmail() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      await _authService.sendPasswordResetEmail(controller.text.trim());
      return true;
    } catch (e) {
      errorMessage = 'Email gönderilirken bir hata oluştu. Lütfen tekrar deneyin.';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}