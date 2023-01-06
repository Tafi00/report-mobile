import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../detail_customer_controller.dart';

Widget buildSecondCard() {
  return GetBuilder<DetailCustomerController>(
    assignId: true,
    builder: (controller) {
      return Container(
        width: double.infinity,
        height: 75,
        decoration: const BoxDecoration(
            color: Color(0xFFFAFEFF),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000),
                offset: Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/project_icon.svg', width: 25),
                const SizedBox(
                  width: 4,
                ),
                RichText(
                  text: TextSpan(
                      text:
                          '${controller.dataSummaryCount['totalProject'] ?? 0}\n',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFF27B21),
                          height: 1.3),
                      children: const [
                        TextSpan(
                            text: 'Dự án',
                            style: TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 13,
                                height: 1.3))
                      ]),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/menu_icon.svg', width: 25),
                const SizedBox(
                  width: 4,
                ),
                RichText(
                  text: TextSpan(
                      text:
                          '${controller.dataSummaryCount['totalPlan'] ?? 0}\n',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFF27B21),
                          height: 1.3),
                      children: const [
                        TextSpan(
                            text: 'Phụ lục',
                            style: TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 13,
                                height: 1.3))
                      ]),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
