import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/invoice/invoice.dart';
import 'package:saas_dashboard/presentation/invoice/widget/invoice_table_item.dart';
import 'package:saas_dashboard/presentation/widgets/cus_table_title.dart';

class InvoiceTable extends StatelessWidget {
  const InvoiceTable({super.key});

  final int _flexSelect = 3;
  final int _flexId = 6;
  final int _flexName = 10;
  final int _flexEmail = 12;
  final int _flexDate = 8;
  final int _flexStatus = 8;
  final int _flexMoreTools = 6;

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
                flex: _flexSelect,
                child: CusTableTitle(text: '', showArrow: false),
              ),
              Expanded(
                flex: _flexId,
                child: CusTableTitle(text: 'Invoice Id'),
              ),
              Expanded(
                flex: _flexName,
                child: CusTableTitle(text: 'Name'),
              ),
              Expanded(
                flex: _flexEmail,
                child: CusTableTitle(text: 'Email'),
              ),
              Expanded(
                flex: _flexDate,
                child: CusTableTitle(text: 'Date'),
              ),
              Expanded(
                flex: _flexStatus,
                child: CusTableTitle(text: 'Status', showArrow: false),
              ),
              Expanded(
                flex: _flexMoreTools,
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
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstrain.paddingSmall),
              padding: EdgeInsets.only(top: AppConstrain.paddingSmall),
              itemCount: invoiceList.length,
              itemBuilder: (context, index) {
                final Invoice invoice = invoiceList[index];
                return InvoiceTableItem(invoice: invoice);
              },
            ),
          ),
        ),
      ],
    );
  }
}
