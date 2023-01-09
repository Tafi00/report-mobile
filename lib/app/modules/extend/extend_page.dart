import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/extend/components/header.dart';
import 'package:report_azvidi/app/modules/extend/components/itemExtendCard.dart';
import 'package:report_azvidi/app/modules/extend/extend_controller.dart';

import 'components/btnLogout.dart';

List listDataExtendCard = [
  ['assets/icons/list_icon.svg', 'Danh mục/Rate Cards'],
  ['assets/icons/vector_icon.svg', 'Trung tâm kết nối'],
  ['assets/icons/setting_icon.svg', 'Cài đặt'],
  ['assets/icons/user_icon.svg', 'Quản lý User']
];

class ExtendPage extends StatelessWidget {
  const ExtendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExtendController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
            body: SafeArea(
                child: Column(
          children: [
            buildHeader(),
            const SizedBox(
              height: 20,
            ),
            for (var x in listDataExtendCard)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    buildItemExtendCard(x[0], x[1]),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buildBtnLogout()],
            ),
            const SizedBox(
              height: 4,
            ),
            Text('v1.0.20')
          ],
        )));
      },
    );
  }
}
