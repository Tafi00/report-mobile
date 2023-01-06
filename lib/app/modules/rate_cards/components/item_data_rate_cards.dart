import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/rate_cards/components/data_ratecards_bottomsheet.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_controller.dart';
import 'package:report_azvidi/app/utils/constants.dart';

Widget buildItemDataCards(dataItem, String channelName) {
  return GestureDetector(
    onTap: () {
      showDataBottomSheet(dataItem);
    },
    child: Container(
      color: const Color(0xFFFAFEFF),
      padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        dataItem['name'],
                        style: const TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      channelName,
                      style: const TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  dataItem['unit']['name'],
                  style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        addComma(dataItem['costPrice'].toStringAsFixed(0)),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${dataItem['internalDiscount']}%',
                      style: const TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            dataItem['description'] != null
                ? Text(dataItem['description'],
                    style: const TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 13,
                    ))
                : Container(),
            const SizedBox(
              height: 6,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: const Color(0x33828282),
            )
          ],
        ),
      ),
    ),
  );
}
