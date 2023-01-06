import 'package:flutter/material.dart';

import 'constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Chưa có tài khoản ? " : "Đã có tài khoản ? ",
          style: const TextStyle(color: Color(0x993f3849)),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Đăng ký" : "Đăng nhập",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
