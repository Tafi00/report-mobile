import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/detail_customer/components/edit_customer_bottomshet.dart';
import 'package:report_azvidi/app/modules/detail_customer/detail_customer_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

Widget buildFirstCard() {
  return GetBuilder<DetailCustomerController>(
    builder: (controller) {
      return Obx(() => Container(
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
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Thông tin khách hàng',
                          style: TextStyle(
                              color: Color(0xFF595A5C),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        GestureDetector(
                            onTap: () {
                              showEditCustomerBottomSheet(
                                  controller.idCustomer.value);
                            },
                            child:
                                SvgPicture.asset('assets/icons/edit_icon.svg'))
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Khách hàng',
                          style:
                              TextStyle(fontSize: 13, color: Color(0XFF828282)),
                        ),
                        Text(
                          controller.dataDetailCustomer['name'] ?? '',
                          style: const TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tên công ty',
                          style:
                              TextStyle(fontSize: 13, color: Color(0XFF828282)),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: Get.width * 0.5,
                            child: Text(
                              controller.dataDetailCustomer['company'] ?? '',
                              overflow: TextOverflow.clip,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    controller.isShowMore.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 11,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Địa chỉ',
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0XFF828282)),
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      width: Get.width * 0.5,
                                      child: Text(
                                        controller.dataDetailCustomer[
                                                'address'] ??
                                            '',
                                        overflow: TextOverflow.clip,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Liên hệ',
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0XFF828282)),
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      width: Get.width * 0.5,
                                      child: Text(
                                        controller.dataDetailCustomer[
                                                'contactName'] ??
                                            '',
                                        overflow: TextOverflow.clip,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0XFF828282)),
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      width: Get.width * 0.5,
                                      child: Text(
                                        controller
                                                .dataDetailCustomer['email'] ??
                                            '',
                                        overflow: TextOverflow.clip,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedBtn(
                          circular: 50,
                          paddingAllValue: 0,
                          onPressed: () {
                            controller.toggleShowMore();
                          },
                          child: controller.isShowMore.value
                              ? const Icon(
                                  Icons.arrow_drop_up,
                                  size: 30,
                                  color: Color(0xFF828282),
                                )
                              : const Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                  color: Color(0xFF828282),
                                ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ));
    },
  );
}
