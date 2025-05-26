import 'package:flutter/material.dart';
import '../components/styled_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                  child: StyledInputField(
                    controller: emailController,
                    icon: Icons.email,
                    labelText: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                  child: StyledInputField(
                    controller: passwordController,
                    icon: Icons.password,
                    labelText: "Password",
                    isPassword: true,
                  ),
                ),
                ElevatedButton(
                  child: const Text("Log in"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
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
