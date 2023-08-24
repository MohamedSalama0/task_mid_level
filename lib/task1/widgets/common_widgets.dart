import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String?)? onSaved,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  String? initialValue,
  bool isPassword = false,
  String hintText = '',
  bool isPasswordVisible = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  int? lines = 1,
}) =>
    TextFormField(
      initialValue: initialValue,
      controller: controller,
      keyboardType: type,

      obscureText: isPassword
          ? !isPasswordVisible
          : false, // isPassword ? isPassword : !isPasswordVisible,
      enabled: isClickable,
      // onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onSaved: (v) => onSaved == null ? null : onSaved(v),
      onTap: onTap, 
      maxLines: lines,
      validator: validate,
      style: const TextStyle(color: Colors.blueGrey, fontSize: 18),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: isPassword // controller.text.isNotEmpty
            ? IconButton(
                icon: isPasswordVisible
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.blueGrey,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.blueGrey,
                      ),
                onPressed: suffixPressed)
            : const SizedBox(),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );