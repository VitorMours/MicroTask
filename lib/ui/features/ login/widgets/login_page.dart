import 'package:flutter/material.dart';

import '../../../../data/models/user.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginPage extends StatelessWidget {

  UserModel userModel = UserModel();
  LoginPage({super.key, required this.viewModel})

  LoginViewModel viewModel = LoginViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          alignment: Alignment.center,
          child: Form(
            key: _formKey, // TODO: Substituir formkey
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                  child: StyledInputField( // TODO: Adicionar esse styled input para os widgets globais e mudar o controller
                    controller: emailController,
                    icon: Icons.email,
                    labelText: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                  child: StyledInputField( // TODO: Adicionar esse styled input para os widgets globais e mudar o controller
                    controller: passwordController,
                    icon: Icons.password,
                    labelText: "Password",
                    isPassword: true,
                  ),
                ),
                ElevatedButton(
                  child: const Text("Log in"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) { // TODO: Fazer validacao dento do viewmodel, nao dentro da view
                      if (emailController.text == "jvrezendemoura@gmail.com" &&
                          passwordController.text == "32322916a") {
                        // Redireciona para a tela principal e remove o botão "voltar"
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Credenciais inválidas")),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
