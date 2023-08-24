import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showMySnakebar(BuildContext context, String message,
      ) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
        width: MediaQuery.of(context).size.width * .7,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
        ),
        duration: const Duration(seconds: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
