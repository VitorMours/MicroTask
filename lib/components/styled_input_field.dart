import 'package:flutter/material.dart';

class StyledInputField extends StatefulWidget {
  final String? labelText;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController controller;

  const StyledInputField({
    super.key,
    this.icon,
    this.labelText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State createState() => _StyledInputFieldState();
}

class _StyledInputFieldState extends State<StyledInputField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscure : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.white)),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),
        ),
        icon: widget.icon != null ? Icon(widget.icon) : null,
        iconColor: Colors.white70,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white70,
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
