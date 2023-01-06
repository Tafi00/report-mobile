import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/apis/kpi.dart';
import 'package:report_azvidi/app/modules/rate_cards/components/channel_drop_down.dart';
import 'package:report_azvidi/app/modules/rate_cards/components/unit_drop_down.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_controller.dart';
import 'package:report_azvidi/app/utils/elevated_btn.dart';

void showEditRateCardBottomSheet(dataItem) async {
  RateCardsController controller = Get.put(RateCardsController());
  controller.fetchListUnit().then((value) => controller.listUnit = value);
  controller.fetchListChannel().then((value) => controller.listChannel = value);
  controller.currentChannelName.value = dataItem['channel']['name'];
  controller.currentUnitName.value = dataItem['unit']['name'];
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController =
      TextEditingController(text: dataItem['name'] ?? '');
  TextEditingController formatController =
      TextEditingController(text: dataItem['format'] ?? "");
  TextEditingController objectiveController =
      TextEditingController(text: dataItem['objective'] ?? "");
  TextEditingController demo1NameController = TextEditingController();
  TextEditingController demo2NameController = TextEditingController();
  TextEditingController sizeController =
      TextEditingController(text: dataItem['size'] ?? "");
  TextEditingController formulaController =
      TextEditingController(text: dataItem['formula'] ?? "");
  TextEditingController ctrController = TextEditingController(
      text: dataItem['ctr'] < 0
          ? (dataItem['ctr'] ?? 0).toString()
          : (dataItem['ctr'] ?? 0).toStringAsFixed(0));
  TextEditingController costController = TextEditingController(
      text: (dataItem['costPrice'] ?? 0).toStringAsFixed(0));
  TextEditingController discountController = TextEditingController(
      text: dataItem['internalDiscount'] < 0
          ? (dataItem['internalDiscount'] ?? 0).toString()
          : (dataItem['internalDiscount'] ?? 0).toStringAsFixed(0));
  TextEditingController descriptionController =
      TextEditingController(text: dataItem['description'] ?? "");
  Get.bottomSheet(
      Wrap(
        children: [
          Form(
            key: formKey,
            child: Container(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * .39,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kênh',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            buildChannelDropDown()
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: Get.width * .49,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hạng mục',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              constraints: const BoxConstraints(minHeight: 35),
                              color: Colors.white,
                              width: double.infinity,
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (nameController.text == '') {
                                    return 'Hạng mục không được để trống';
                                  }
                                  return null;
                                },
                                style: const TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    isDense: true,
                                    errorStyle: const TextStyle(fontSize: 9),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFD0D0D0)))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * .39,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Vị trí/Format',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              constraints: const BoxConstraints(minHeight: 35),
                              color: Colors.white,
                              width: double.infinity,
                              child: TextFormField(
                                controller: formatController,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFD0D0D0)))),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: Get.width * .49,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mục tiêu',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              constraints: const BoxConstraints(minHeight: 35),
                              color: Colors.white,
                              width: double.infinity,
                              child: TextFormField(
                                controller: objectiveController,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFD0D0D0)))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nền tảng',
                            style: TextStyle(
                                color: Color(0xFF828282), fontSize: 13),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: controller.isPcCheck.value,
                                  onChanged: (bool? value) {
                                    controller.isPcCheck.value = value!;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'PC',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              const Spacer(),
                              const Text(
                                'Demo',
                                style: TextStyle(
                                    color: Color(0xFF828282), fontSize: 13),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              SizedBox(
                                width: Get.width * .52,
                                child: TextFormField(
                                  controller: demo1NameController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'https://demo.azvidi.vn/banner',
                                    hintStyle: TextStyle(
                                        color: const Color(0xFF333333)
                                            .withOpacity(0.4),
                                        fontSize: 12),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: controller.isMbCheck.value,
                                  onChanged: (bool? value) {
                                    controller.isMbCheck.value = value!;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Mobile',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              const Spacer(),
                              const Text(
                                'Demo',
                                style: TextStyle(
                                    color: Color(0xFF828282), fontSize: 13),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              SizedBox(
                                width: Get.width * .52,
                                child: TextFormField(
                                  controller: demo2NameController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'https://demo.azvidi.vn/banner',
                                    hintStyle: TextStyle(
                                        color: const Color(0xFF333333)
                                            .withOpacity(0.4),
                                        fontSize: 12),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Kích thước',
                    style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 35),
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      controller: sizeController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  const BorderSide(color: Color(0xFFD0D0D0)))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * .39,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ĐVT',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            buildUnitDropDown()
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cách tính',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              constraints: const BoxConstraints(minHeight: 35),
                              color: Colors.white,
                              width: double.infinity,
                              child: TextFormField(
                                controller: formulaController,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFD0D0D0)))),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CTR',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              constraints: const BoxConstraints(minHeight: 35),
                              color: Colors.white,
                              width: double.infinity,
                              child: TextFormField(
                                controller: ctrController,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFD0D0D0)))),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * .39,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Giá vốn',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              constraints: const BoxConstraints(minHeight: 35),
                              color: Colors.white,
                              width: double.infinity,
                              child: TextFormField(
                                controller: costController,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFD0D0D0)))),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: Get.width * .49,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Chiết khấu',
                              style: TextStyle(
                                  color: Color(0xFF828282), fontSize: 13),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              constraints: const BoxConstraints(minHeight: 35),
                              color: Colors.white,
                              width: double.infinity,
                              child: TextFormField(
                                controller: discountController,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFD0D0D0)))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Ghi chú',
                    style: TextStyle(color: Color(0xFF828282), fontSize: 13),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 35),
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  const BorderSide(color: Color(0xFFD0D0D0)))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: const Color(0xFF3949ab)),
                          child: const Text(
                            'Xóa',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: const Color(0xFF3949ab)),
                          child: const Text(
                            'Hủy bỏ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                      ElevatedButton(
                          onPressed: () async {
                            FocusManager.instance.primaryFocus?.unfocus();

                            if (formKey.currentState!.validate()) {
                              final dataRequest = await KpiApi()
                                  .updateCategoryKpiRequest(dataItem['id'], {
                                'calculationUnitId': controller.getIdUnit(
                                    controller.currentUnitName.value),
                                'channelId': controller.getIdChannel(
                                    controller.currentChannelName.value),
                                'costPrice': double.parse(costController.text),
                                'ctr': double.parse(ctrController.text),
                                'description': descriptionController.text,
                                'format': formatController.text,
                                'formula': formulaController.text,
                                'identifier': dataItem['identifier'],
                                'internalDiscount':
                                    double.parse(discountController.text),
                                'name': nameController.text,
                                'objective': objectiveController.text,
                                'platform': [
                                  {
                                    'platform': 'PC',
                                    'previewUrl': demo1NameController.text,
                                    'status': controller.isPcCheck.value ? 1 : 0
                                  },
                                  {
                                    'platform': 'Mobile',
                                    'previewUrl': demo2NameController.text,
                                    'status': controller.isMbCheck.value ? 1 : 0
                                  }
                                ],
                                'size': sizeController.text
                              });
                              if (dataRequest['content']) {
                                Get.back();
                                Get.back();
                                Get.snackbar(
                                    'Thành công', 'Hạng mục đã được chỉnh sửa');
                              } else {
                                Get.snackbar('Ôi không', 'Đã có lỗi xảy ra');
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: const Color(0xFF3949ab)),
                          child: const Text(
                            'Hoàn tất',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      isScrollControlled: true);
}
