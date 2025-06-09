import "package:flutter/material.dart";

import "../../../../data/models/user.dart";


class LoginViewModel extends ChangeNotifier{

  final UserModel userModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  LoginViewModel(this.userModel);

  void updateEmailController(String text){
    emailController.text = text;
    notifyListeners();
  }

  void updatePasswordController(String text){
    passwordController.text = text;
    notifyListeners();
  }


  void validateForm(){

    if(_formKey.currentState!.validate()){


    }else{


    }

  }




}