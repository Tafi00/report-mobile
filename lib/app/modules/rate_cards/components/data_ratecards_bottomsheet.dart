import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/rate_cards/components/edit_ratecard_bottomsheet.dart';
import 'package:report_azvidi/app/utils/constants.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

String getPlatformStr(List platform) {
  String platformString = '';
  for (var x in platform) {
    platformString = '${platformString + x['platform']} &';
  }
  if (platformString.isNotEmpty) {
    platformString = platformString.substring(0, platformString.length - 1);
  }
  return platformString;
}

void showDataBottomSheet(Map dataItem) {
  Get.bottomSheet(
      Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFEFF),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedBtn(
                      paddingAllValue: 5,
                      circular: 50,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .5 - 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kênh',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          Text(
                            dataItem['channel']['name'],
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .5 - 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hạng mục',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          Text(
                            dataItem['name'],
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .5 - 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Vị trí/Format',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          Text(
                            dataItem['format'] ?? '0',
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .5 - 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mục tiêu',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          Text(
                            dataItem['objective'],
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .5 - 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nền tảng',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          Text(
                            getPlatformStr(dataItem['platform']),
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .5 - 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kích thước',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          Text(
                            dataItem['size'] ?? '',
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .5 - 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ĐVT',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          Text(
                            dataItem['unit']['name'],
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .5 - 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Cách tính',
                                style: TextStyle(
                                    color: Color(0xFF828282), fontSize: 13),
                              ),
                              Text(
                                dataItem['formula'] ?? '',
                                style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'CTR',
                                style: TextStyle(
                                    color: Color(0xFF828282), fontSize: 13),
                              ),
                              Text(
                                '${(dataItem['ctr'] ?? 0)}%',
                                style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .5 - 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF065166),
                                size: 15,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Giá báo ra',
                                style: TextStyle(
                                    color: Color(0xFF828282), fontSize: 13),
                              ),
                            ],
                          ),
                          Text(
                            addComma((dataItem['costPrice'] ?? 0).toString()),
                            style: const TextStyle(
                                color: Color(0xFF065166),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .5 - 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Color(0xFFF27B21),
                                size: 15,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'C.Khấu',
                                style: TextStyle(
                                    color: Color(0xFF828282), fontSize: 13),
                              ),
                            ],
                          ),
                          Text(
                            '${dataItem['internalDiscount']}%',
                            style: const TextStyle(
                                color: Color(0xFFF27B21),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ghi chú',
                      style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                    ),
                    Text(
                      dataItem['description'],
                      style: const TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          showEditRateCardBottomSheet(dataItem);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3949AB),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10)),
                        child: const Text(
                          'Chỉnh sửa',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      isScrollControlled: true);
}
