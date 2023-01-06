import 'dart:convert';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:report_azvidi/app/apis/authentication.dart';
import 'package:report_azvidi/app/modules/login/login_binding.dart';
import 'package:report_azvidi/app/modules/login/login_page.dart';
import 'package:report_azvidi/app/modules/main/main_binding.dart';
import 'package:report_azvidi/app/modules/main/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

bool isLogin = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getString('userData') != null) {
    Map dataUser = jsonDecode(prefs.getString('userData')!);
    final dataRefresh =
        await AuthApi().refreshTokenRequest(dataUser['refreshToken']);
    isLogin = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF3F5F8),
            textTheme: GoogleFonts.openSansTextTheme(
                ThemeData(brightness: Brightness.light).textTheme)),
        initialBinding: isLogin ? MainBinding() : LoginBinding(),
        home: isLogin ? const MainPage() : const LoginPage(),
        getPages: AppPages.pages,
        enableLog: true,
        defaultTransition: Transition.cupertino,
        defaultGlobalState: true,
      ),
    );
  }
}
