import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

Widget itemCard(
    {required String content, required String planId, required int status}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GestureDetector(
          onTap: () {},
          child: Opacity(
            opacity: status == 1 ? 1 : 0.8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Html(
                  data: content,
                  onLinkTap: (String? url, RenderContext context,
                      Map<String, String> attributes, element) {
                    Get.toNamed(AppRoutes.detailPlan, arguments: planId);
                  }),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      )
    ],
  );
}
