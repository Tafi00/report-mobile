import 'package:flutter/material.dart';
import 'package:report_azvidi/app/modules/login/login_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';

TextFormField buildPhoneTextFormField(LoginController controller) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.next,
    cursorColor: kPrimaryColor,
    cursorHeight: 18,
    textAlignVertical: TextAlignVertical.center,
    style: const TextStyle(fontSize: 16),
    onChanged: (value) {
      controller.formAccountKey.currentState!.validate();
      controller.email.value = value;
      return;
    },
    validator: (value) {
      if (value!.isEmpty) {
        return 'Trường này không được bỏ trống';
      }
      return null;
    },
    decoration: const InputDecoration(
      counterText: "",
      errorStyle: TextStyle(height: 0),
      filled: true,
      fillColor: kSecondaryColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      hintText: "Email",
      prefixIcon: Padding(
        padding: EdgeInsets.all(20),
        child: Icon(Icons.person),
      ),
    ),
  );
}
