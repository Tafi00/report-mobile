import 'package:flutter/material.dart';
import 'package:report_azvidi/app/modules/home/components/multi_card_customer/customer_item.dart';

import '../../../../models/marketing_customer_model.dart';

class BuildCustomer extends StatelessWidget {
  final List<MarketingCustomerModel> listPaging;
  const BuildCustomer({Key? key, required this.listPaging}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listPaging.length > 4 ? 4 : listPaging.length,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          CustomerItem(customerCardModel: listPaging[index]),
    );
  }
}
