import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/presentation/analytics/widget/customer_table_item.dart';
import 'package:saas_dashboard/presentation/widgets/cus_table_title.dart';

class CustomerTable extends StatelessWidget {
  CustomerTable({super.key});

  final List<int> _flexList = [10, 10, 8, 3, 5];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstrain.paddingMedium,
          ),
          child: Row(
            children: [
              Expanded(
                flex: _flexList[0],
                child: CusTableTitle(text: 'Name'),
              ),
              Expanded(
                flex: _flexList[1],
                child: CusTableTitle(text: 'Email'),
              ),
              Expanded(
                flex: _flexList[2],
                child: CusTableTitle(text: 'Phone Number'),
              ),
              Expanded(
                flex: _flexList[3],
                child: CusTableTitle(text: 'Gender'),
              ),
              Expanded(
                flex: _flexList[4],
                child: CusTableTitle(text: '', showArrow: false),
              ),
            ],
          ),
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: ListView.separated(
              itemCount: customerList.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstrain.paddingSmall),
              padding: EdgeInsets.only(top: AppConstrain.paddingSmall),
              itemBuilder: (context, index) {
                final customer = customerList[index];
                return CustomerTableItem(
                  customer: customer,
                  flexList: _flexList,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
