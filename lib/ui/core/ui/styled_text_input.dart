import 'package:flutter/material.dart';

class StyledTextInput extends StatefulWidget {
  final String? labelText;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController controller;

  const StyledTextInput({
    super.key,
    this.icon,
    this.labelText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State createState() => _StyledInputFieldState();
}

class _StyledInputFieldState extends State<StyledTextInput> {
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscure : false,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(

        icon: widget.icon != null ? Icon(widget.icon) : null,
        iconColor: Colors.black,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.black),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        )
            : null,
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'O valor não pode ser nulo, por favor preencha corretamente!';
        }
        return null;
      },
    );
  }
}
