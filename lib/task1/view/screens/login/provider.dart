import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get eamil => _emailController;
  TextEditingController get password => _passwordController;
}
