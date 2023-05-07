import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/screens/home_screen.dart';
import 'package:mini_projects_valorant/utility/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  // Username Property //
  String _username = "";
  String get username => _username;

  bool _isUsernameValid = true;
  bool get isUsernameValid => _isUsernameValid;

  String _errorUsernameMessage = "";
  String get errorUsernameMessage => _errorUsernameMessage;
  // End of Username Property //

  // Password Property //
  String _password = "";
  String get password => _password;

  bool _isPasswordValid = true;
  bool get isPasswordValid => _isPasswordValid;

  String _errorPasswordMessage = "";
  String get errorPasswordMessage => _errorPasswordMessage;

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;
  // End of Password Property //

  // Button Prorerty
  bool _isButtonUsernameDisable = false;
  bool get isButtonUsernameDisable => _isButtonUsernameDisable;

  bool _isButtonPasswordDisable = false;
  bool get isButtonPasswordDisable => _isButtonPasswordDisable;
  // End of Button Property //

  void validateUsername(String value) {
    _username = value;
    if (_username.isEmpty) {
      _isUsernameValid = false;
      _isButtonUsernameDisable = false;

      _errorUsernameMessage = "Username tidak boleh kosong!";
    } else if (_username.length < 4) {
      _isUsernameValid = false;
      _isButtonUsernameDisable = false;

      _errorUsernameMessage = "Username harus lebih dari 4 digit";
    } else {
      _isUsernameValid = true;
      _isButtonUsernameDisable = true;
    }
    notifyListeners();
  }

  void validatePassword(String value) {
    _password = value;
    if (_password.isEmpty) {
      _isPasswordValid = false;
      _isButtonPasswordDisable = false;

      _errorPasswordMessage = "Password Tidak Boleh Kosong";
    } else {
      _isPasswordValid = true;
      _isButtonPasswordDisable = true;
    }
    notifyListeners();
  }

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  void navigateToHomeScreen(
    BuildContext context,
  ) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
    saveToken(valueToken: _username);
  }
}
