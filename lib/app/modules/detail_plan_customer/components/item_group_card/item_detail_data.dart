import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';

Widget buildColumnCategory(List<String> listData) {
  return GetBuilder<DetailPlanController>(
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chỉ số',
            style: TextStyle(color: Color(0xFF828282), fontSize: 13),
          ),
          for (var x in listData)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 11,
                ),
                Text(
                  x,
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xFF4F4F4F)),
                ),
              ],
            )
        ],
      );
    },
  );
}

Widget buildColumnData(List<String> listData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Text(
        'Thực chạy',
        style: TextStyle(color: Color(0xFF828282), fontSize: 13),
      ),
      for (var x in listData)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 11,
            ),
            Text(
              (listData.indexOf(x) == 2) || (listData.indexOf(x) == 6)
                  ? '$x%'
                  : x,
              style: const TextStyle(fontSize: 13, color: Color(0xFF4F4F4F)),
            ),
          ],
        )
    ],
  );
}

Widget buildColumnData_2(String name, List<String> listData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        name,
        style: const TextStyle(color: Color(0xFF828282), fontSize: 13),
      ),
      for (var x in listData)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 11,
            ),
            Text(
              (listData.indexOf(x) == 1) ? '$x%' : x,
              style: const TextStyle(fontSize: 13, color: Color(0xFF4F4F4F)),
            ),
          ],
        )
    ],
  );
}

Widget buildColumnDeviant(List<String> listData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Text(
        '+/-',
        style: TextStyle(color: Color(0xFF828282), fontSize: 13),
      ),
      for (var x in listData)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 11,
            ),
            Text(
              ((listData.indexOf(x) == 2) || (listData.indexOf(x) == 6)) &&
                      (x != '0' &&
                          x != '0.0' &&
                          x != '0.00' &&
                          !x.contains('-'))
                  ? '+$x%'
                  : (listData.indexOf(x) == 2) || (listData.indexOf(x) == 6)
                      ? '$x%'
                      : (x != '0' && x != '0.0' && !x.contains('-'))
                          ? '+$x'
                          : x,
              style: TextStyle(
                  fontSize: 13,
                  color:
                      x != '0' && x != '0.0' && x != '0.00' && !x.contains('-')
                          ? const Color(0xFF065166)
                          : x.contains('-')
                              ? const Color(0xFFF27B21)
                              : const Color(0xFF4F4F4F)),
            ),
          ],
        )
    ],
  );
}

Widget buildColumnPlanData(List<String> listData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Text(
        'Kế hoạch',
        style: TextStyle(color: Color(0xFF828282), fontSize: 13),
      ),
      for (var x in listData)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 11,
            ),
            Text(
              (listData.indexOf(x) == 2) || (listData.indexOf(x) == 6)
                  ? '$x%'
                  : x,
              style: const TextStyle(fontSize: 13, color: Color(0xFFBDBDBD)),
            ),
          ],
        )
    ],
  );
}

Widget buildColumnPlanData_2(List<String> listData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Text(
        'Báo ra',
        style: TextStyle(color: Color(0xFF828282), fontSize: 13),
      ),
      for (var x in listData)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 11,
            ),
            Text(
              (listData.indexOf(x) == 1) ? '$x%' : x,
              style: const TextStyle(fontSize: 13, color: Color(0xFFBDBDBD)),
            ),
          ],
        )
    ],
  );
}
