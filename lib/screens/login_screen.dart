import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/provider/login_provider.dart';
import 'package:mini_projects_valorant/screens/widgets/textfieldcustom_widgets.dart';
import 'package:provider/provider.dart';

import 'theme/font_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -80,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: primaryColor,
            ),
          ),
          Positioned(
            bottom: -100,
            right: -80,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: valorantStyle.copyWith(fontSize: 30),
                  ),
                ),
                const SizedBox(height: 10),
                TextfieldCustomWidget(
                  labelText: "Username",
                  onChanged: (value) => loginProvider.validateUsername(value),
                  isValidTextfield: loginProvider.isUsernameValid,
                  errorMessage: loginProvider.errorUsernameMessage,
                ),
                const SizedBox(height: 10),
                TextfieldCustomWidget(
                  labelText: "Password",
                  isObscureText: loginProvider.isHidePassword,
                  onChanged: (value) => loginProvider.validatePassword(value),
                  isValidTextfield: loginProvider.isPasswordValid,
                  errorMessage: loginProvider.errorPasswordMessage,
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginProvider.showHidePassword();
                    },
                    icon: loginProvider.isHidePassword
                        ? const Icon(Icons.lock)
                        : const Icon(Icons.lock_open),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loginProvider.isButtonUsernameDisable &&
                            loginProvider.isButtonPasswordDisable
                        ? () {
                            loginProvider.navigateToHomeScreen(context);
                          }
                        : null,
                    child: Text(
                      'Login',
                      style: poppinsWhiteStyle.copyWith(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
