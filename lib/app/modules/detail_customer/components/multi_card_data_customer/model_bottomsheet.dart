import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showModelBottomSheet() {
  Get.bottomSheet(Container(
    constraints: const BoxConstraints(minHeight: 90),
    padding: const EdgeInsets.only(bottom: 10),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white),
    child: SizedBox(
      height: 180,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 4,
            width: 28,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(width: 14),
              Icon(
                Icons.edit,
                color: Colors.black,
              ),
              SizedBox(width: 14),
              Text(
                "Sửa",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            color: const Color(0xFFC9D6DF),
            height: 1,
            width: double.infinity,
          ),
          const SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: 14),
                Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 14),
                Text(
                  "Xóa",
                  style: TextStyle(color: Colors.redAccent, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}
