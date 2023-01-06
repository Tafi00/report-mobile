import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/rate_cards/components/add_ratecard_bottomsheet.dart';
import 'package:report_azvidi/app/modules/rate_cards/components/item_data_rate_cards.dart';
import 'package:report_azvidi/app/modules/rate_cards/components/item_list_rate_cards.dart';
import 'package:report_azvidi/app/modules/rate_cards/rate_cards_controller.dart';

List<String> listNameCard = [
  'ALL',
  'Facebook',
  'Google',
  'Zalo',
  'Admicro',
  'Adbro',
  'EClick',
  'Vnexpress',
  'Tiktok',
  'CPD',
  'PR',
  'Adtima',
  'Production',
  'Khác'
];

class RateCardsPage extends StatelessWidget {
  const RateCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RateCardsController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF4F4F4F),
                  size: 30,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Danh mục/Rate Cards',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333)),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Bạn muốn xem\nhạng mục/rate cards của...',
                        style: TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Color(0xFF4F4F4F),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 110,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: listNameCard.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                    child: buildItemListRateCard(
                                        index, listNameCard[index])),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showAddRateCardBottomSheet();
                            },
                            child: const CircleAvatar(
                                backgroundColor: Color(0xFFE0E0E0),
                                radius: 22,
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF828282),
                                  size: 30,
                                )),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 43,
                              child: TextFormField(
                                maxLines: 1,
                                initialValue: controller.searchText.value,
                                onChanged: (value) {
                                  controller.listCurrentName.value = ['ALL'];
                                  controller.searchText.value = value;
                                  controller.onTextChanged();
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 8),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Tìm kiếm",
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Color(0XFF828282)),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFD0D0D0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFD0D0D0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFD0D0D0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.getLengthListCard(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                                child: buildItemDataCards(
                                    controller.getDataListCard(index),
                                    controller.getNameDataCard(index))),
                          ));
                    },
                  ),
                )
              ],
            ));
      },
    );
  }
}
