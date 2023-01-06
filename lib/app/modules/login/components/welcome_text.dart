import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

Padding buildWelcomeText() {
  return const Padding(
    padding: EdgeInsets.only(top: 60, bottom: 60),
    child: Text(
      "Chào mừng!",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 24),
    ),
  );
}
