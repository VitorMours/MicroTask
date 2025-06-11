import "package:flutter/material.dart";

import "../../../../data/models/user.dart";


class LoginViewModel extends ChangeNotifier {

  UserModel? userModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginViewModel(userModel);


  void updateEmailController(String text) {
    emailController.text = text;
    notifyListeners();
  }

  void updatePasswordController(String text) {
    passwordController.text = text;
    notifyListeners();
  }

  get formKey => _formKey;


  authenticate(context) {
    if (_formKey.currentState!.validate()) {
      if (emailController.text ==
          "jvrezendemoura@gmail.com" &&
          passwordController.text == "32322916a") {
        notifyListeners();
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Credenciais inválidas"),
          ),
        );
      }
    }
  }
}