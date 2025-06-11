import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_riverpod/ui/core/ui/styled_text_input.dart';

import '../../../../data/models/user.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      child: StyledTextInput(
                        controller: viewModel.emailController,
                        icon: Icons.email,
                        labelText: "Email",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 2,
                      ),
                      child: StyledTextInput(
                        controller: viewModel.passwordController,
                        icon: Icons.password,
                        labelText: "Password",
                        isPassword: true,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (await viewModel.authenticate()) {
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Credenciais inválidas"),
                            ),
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
