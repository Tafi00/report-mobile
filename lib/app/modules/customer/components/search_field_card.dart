import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/customer/components/add_customer_bottomshet.dart';
import 'package:report_azvidi/app/modules/customer/components/drop_down_filter.dart';
import 'package:report_azvidi/app/modules/customer/customer_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

Widget buildSearchField() {
  return GetBuilder<CustomerController>(
    assignId: true,
    builder: (controller) {
      return Container(
        height: 70,
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 17, left: 12, right: 13, bottom: 16),
        decoration: const BoxDecoration(color: Color(0xFFFAFEFF), boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          )
        ]),
        child: Row(
          children: [
            SizedBox(
              width: Get.width * 0.35,
              height: 50,
              child: TextFormField(
                maxLines: 1,
                initialValue: controller.searchText.value,
                onChanged: (value) {
                  controller.searchText.value = value;
                  controller.onTextChanged();
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 8),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Tìm kiếm",
                  hintStyle: TextStyle(fontSize: 14, color: Color(0XFF828282)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            buildDropDownFilter(),
            const Spacer(),
            ElevatedBtn(
              paddingAllValue: 10,
              circular: 4,
              onPressed: () {
                controller.base64Image.value = '';

                showAddCustomerBottomSheet();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/plus.svg',
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Thêm',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0XFF3949AB)),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
