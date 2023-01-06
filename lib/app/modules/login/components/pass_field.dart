import 'package:flutter/material.dart';
import 'package:report_azvidi/app/modules/login/login_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';

Padding buildPassTextFormField(LoginController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: controller.obscureText.value,
      cursorColor: kPrimaryColor,
      maxLength: 40,
      onChanged: (value) {
        controller.pass.value = value;
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Trường này không được để trống';
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0),
        counterText: "",
        filled: true,
        fillColor: kSecondaryColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        hintText: "Mật khẩu",
        prefixIcon: const Padding(
          padding: EdgeInsets.all(20),
          child: Icon(Icons.lock),
        ),
        suffixIcon: GestureDetector(
          onTap: controller.toggle,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              controller.obscureText.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
        ),
      ),
    ),
  );
}
