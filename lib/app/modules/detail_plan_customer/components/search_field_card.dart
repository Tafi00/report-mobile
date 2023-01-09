import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/components/add_plan_bottomsheet.dart';
import 'package:report_azvidi/app/modules/detail_plan_customer/detail_plan_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

Widget buildSearchField() {
  return GetBuilder<DetailPlanController>(
    assignId: true,
    builder: (controller) {
      return Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 6, left: 7, right: 9, bottom: 6),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
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
              width: Get.width * 0.5,
              height: 50,
              child: TextFormField(
                maxLines: 1,
                initialValue: controller.searchText.value,
                onChanged: (value) {},
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
            const Spacer(),
            if (controller.dataDetailPlanInfo['status'] != 1)
              ElevatedBtn(
                paddingAllValue: 10,
                circular: 4,
                onPressed: () {
                  showAddPlanBottomSheet();
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
