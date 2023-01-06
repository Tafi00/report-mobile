import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:report_azvidi/app/modules/manage_user/components/add_customer_bottomshet.dart';
import 'package:report_azvidi/app/modules/manage_user/components/user_item.dart';
import 'package:report_azvidi/app/modules/manage_user/manage_user_controller.dart';

class ManageUserPage extends StatelessWidget {
  const ManageUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageUserController>(
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
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            side: const BorderSide(color: Color(0XFF3949AB))),
                        onPressed: () {
                          controller.dobController.value = '';
                          showAddUserBottomSheet();
                        },
                        child: const Icon(
                          Icons.add,
                          size: 20,
                          color: Color(0XFF3949AB),
                        )),
                  ),
                )
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Quản lý nhân viên',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333)),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: controller.listUserData.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child:
                                buildUserItem(controller.listUserData[index]),
                          )));
                },
              ),
            ));
      },
    );
  }
}
