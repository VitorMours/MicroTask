import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/user.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return FractionallySizedBox(
              widthFactor: 0.8,
              alignment: Alignment.center,
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 2,
                      ),
                      child: TextFormField(
                        controller: viewModel.emailController,
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 2,
                      ),
                      child: TextFormField(
                        controller: viewModel.passwordController,
                        decoration: InputDecoration(hintText: "Password"),
                        obscureText: true,
                      ),
                    ),
                    ElevatedButton(
                      onPressed:  () async {
                        final success = await viewModel.authenticate();
                        if (success) {
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Credenciais inválidas")),
                          );
                        }
                      },
                      child: const Text("Log in"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
