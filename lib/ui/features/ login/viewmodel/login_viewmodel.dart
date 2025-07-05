import "package:flutter/material.dart";

import "../../../../data/models/user.dart";


class LoginViewModel extends ChangeNotifier {

  UserModel? userModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginViewModel(userModel);


  get formKey => _formKey;

  void updateEmailController(String text) {
    emailController.text = text;
    notifyListeners();
  }

  void updatePasswordController(String text) {
    passwordController.text = text;
    notifyListeners();
  }

  void cleanControllers(){
    emailController.clear();
    passwordController.clear();
  }

  Future<bool> authenticate() async {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      if (email == "jvrezendemoura@gmail.com" && password == "32322916a") {
        return true;
      }
    }
    return false;
  }

}