import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/customer/customer_page.dart';
import 'package:report_azvidi/app/modules/extend/extend_page.dart';
import 'package:report_azvidi/app/modules/home/home_page.dart';
import 'package:report_azvidi/app/modules/main/main_controller.dart';
import 'package:report_azvidi/app/modules/notify/notify_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final screens = [
  const HomePage(),
  const CustomerPage(),
  const NotifyPage(),
  const ExtendPage(),
];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        builder: (controller) => Obx(() => Scaffold(
              resizeToAvoidBottomInset: false,
              body: DoubleBackToCloseApp(
                  snackBar: const SnackBar(
                    content: Text('Nhấn thêm lần nữa để thoát'),
                  ),
                  child: SafeArea(
                      child: Stack(
                    children: [
                      IndexedStack(
                        index: controller.selectedIndex.value,
                        children: screens,
                      ),
                      Obx(() {
                        return Positioned(
                          bottom: 10,
                          right: 15,
                          child: AbsorbPointer(
                            absorbing: !controller.isShowSwitch.value,
                            child: AnimatedToggleSwitch<bool>.dual(
                              current: controller.positive.value,
                              first: false,
                              second: true,
                              indicatorSize: const Size(30, 30),
                              dif: 30.0,
                              borderColor: Colors.transparent,
                              borderWidth: 5.0,
                              height: 40,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 1.5),
                                ),
                              ],
                              onChanged: (b) async {
                                controller.positive.value = b;
                                controller.roleView.value =
                                    controller.positive.value == false
                                        ? 'NOIBO'
                                        : 'BAORA';
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString(
                                    'roleView', controller.roleView.value);
                                return Future.delayed(
                                    const Duration(seconds: 2));
                              },
                              colorBuilder: (b) =>
                                  b ? Colors.red : Colors.green,
                              textBuilder: (value) => value
                                  ? const Center(
                                      child: Text(
                                      'Báo ra',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          fontSize: 13,
                                          color: Colors.black),
                                    ))
                                  : const Center(
                                      child: Text('Nội bộ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                              fontSize: 13,
                                              color: Colors.black))),
                            ),
                          ),
                        );
                      }),
                    ],
                  ))),
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: const Color(0xFFF3F5F8),
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/home_inactive.png',
                        width: 60,
                        height: 20,
                      ),
                      label: 'Trang chủ',
                      activeIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 4,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF065166),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6)))),
                          const SizedBox(
                            height: 4,
                          ),
                          Image.asset(
                            'assets/images/home_active.png',
                            width: 60,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          'assets/images/customer_inactive.png',
                          width: 60,
                          height: 20,
                        ),
                        label: 'Khách hàng',
                        activeIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 4,
                                width: 50,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF065166),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6)))),
                            const SizedBox(
                              height: 4,
                            ),
                            Image.asset(
                              'assets/images/customer_active.png',
                              width: 60,
                              height: 20,
                            ),
                          ],
                        )),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          'assets/images/notify_inactive.png',
                          width: 60,
                          height: 20,
                        ),
                        label: 'Thông báo',
                        activeIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 4,
                                width: 50,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF065166),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6)))),
                            const SizedBox(
                              height: 4,
                            ),
                            Image.asset(
                              'assets/images/notify_active.png',
                              width: 60,
                              height: 20,
                            ),
                          ],
                        )),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          'assets/images/more_inactive.png',
                          width: 60,
                          height: 20,
                        ),
                        label: 'Mở rộng',
                        activeIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 4,
                                width: 50,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF065166),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6)))),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/more_active.png',
                              width: 60,
                              height: 20,
                            ),
                          ],
                        )),
                  ],
                  onTap: controller.onTapped,
                  showUnselectedLabels: true,
                  currentIndex: controller.selectedIndex.value,
                  selectedItemColor: const Color(0xff333333),
                  unselectedItemColor: const Color(0xff828282),
                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    height: 1.5,
                    color: Color(0xff333333),
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    color: Color(0xff828282),
                  ),
                ),
              ),
            )));
  }
}
