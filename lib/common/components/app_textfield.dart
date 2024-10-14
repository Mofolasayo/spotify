import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.isPassword,
  });
  final String hintText;
  final bool isPassword;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.isPassword && obscureText,
        decoration: InputDecoration(
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      )
                    : null,
                hintText: widget.hintText,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20))
            .applyDefaults(Theme.of(context).inputDecorationTheme));
  }
}
