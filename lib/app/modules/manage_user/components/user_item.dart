import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';

Widget buildUserItem(dataItem) {
  return Column(
    children: [
      Container(
        padding:
            const EdgeInsets.only(top: 12, left: 16, right: 14, bottom: 10),
        decoration: BoxDecoration(
            color: const Color(0xFFFAFEFF),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                offset: Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfilePicture(
                  name: dataItem['fullName'],
                  radius: 31,
                  fontsize: 21,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .4,
                      child: Text(dataItem['fullName'],
                          style: const TextStyle(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    SizedBox(
                      width: Get.width * .45,
                      child: Text(dataItem['position'],
                          style: const TextStyle(
                              color: Color(0xFF333333), fontSize: 12)),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                        dataItem['roles'].isNotEmpty
                            ? dataItem['roles'][0]
                            : '',
                        style: const TextStyle(
                            color: Color(0xFF333333), fontSize: 14)),
                  ],
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  decoration: BoxDecoration(
                      color: const Color(0xFF6fcf97).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('ACTIVE',
                      style: TextStyle(
                          color: Color(0xFF219653),
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
