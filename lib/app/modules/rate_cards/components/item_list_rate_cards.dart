import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_controller.dart';

Widget buildItemListRateCard(int index, String nameCard) {
  RateCardsController controller = Get.put(RateCardsController());
  return Row(
    children: [
      AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: controller.listCurrentName.contains(nameCard) ? 1 : 0.6,
        child: ElevatedButton(
            onPressed: () {
              controller.searchText.value = '';
              controller.currentIndex.value = index;
              controller.searchText.value = '';
              (nameCard == 'ALL') ||
                      (controller.listCurrentName.contains(nameCard) &&
                          controller.listCurrentName.length == 1)
                  ? {
                      controller.listCurrentName.clear(),
                      controller.listCurrentName.add('ALL')
                    }
                  : (controller.listCurrentName.contains(nameCard))
                      ? {
                          controller.listCurrentName.remove(nameCard),
                          controller.listCurrentName.remove('ALL')
                        }
                      : {
                          controller.listCurrentName.add(nameCard),
                          controller.listCurrentName.remove('ALL')
                        };
              controller.update();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              elevation: 0,
              padding: const EdgeInsets.all(15),
              backgroundColor: controller.getColorFromIndex(index),
            ),
            child: Row(
              children: [
                Text(
                  nameCard,
                  style:
                      const TextStyle(color: Color(0xFFF3F5F8), fontSize: 13),
                ),
                controller.listCurrentName.contains(nameCard) &&
                        !controller.listCurrentName.contains('ALL')
                    ? Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.close,
                            color: Color(0xFFF3F5F8),
                            size: 15,
                          ),
                        ],
                      )
                    : Container(),
              ],
            )),
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
