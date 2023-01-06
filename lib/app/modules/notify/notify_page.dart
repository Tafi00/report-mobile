import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/notify/components/category.dart';
import 'package:report_azvidi/app/modules/notify/item_card.dart';
import 'package:report_azvidi/app/modules/notify/notify_controller.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotifyController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 46,
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildCategory(index),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: PageView.builder(
                controller: controller.pageController.value,
                itemCount: 2,
                onPageChanged: (index) {
                  controller.currentPage.value = index;
                  controller.update();
                },
                itemBuilder: (context, index) {
                  return index == 0
                      ? ListView.builder(
                          itemCount: controller.listNotify.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) => itemCard(
                              status: controller.listNotify[index]['status'],
                              content: controller.listNotify[index]['content']
                                  .toString()
                                  .replaceAll('\n', '<br/>'),
                              planId: controller.listNotify[index]['planId']),
                        )
                      : Container();
                }),
          ),
        ],
      )));
    });
  }
}
