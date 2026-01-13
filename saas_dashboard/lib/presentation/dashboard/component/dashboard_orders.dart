import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/dashboard/recent_order.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_table_title.dart';

class DashboardOrders extends StatefulWidget {
  final double width;
  const DashboardOrders({super.key, required this.width});

  @override
  State<DashboardOrders> createState() => _DashboardOrdersState();
}

class _DashboardOrdersState extends State<DashboardOrders> {
  final List<RecentOrder> _ordersList = [
    RecentOrder(
      no: "#876364",
      image: Assets.images.product,
      name: "Camera Lens",
      price: 178,
      totalOrder: 325,
      totalAmount: "1,46,660",
    ),
    RecentOrder(
      no: "#876365",
      image: Assets.images.product,
      name: "Black Sleep Dress",
      price: 14,
      totalOrder: 53,
      totalAmount: "2,416,660",
    ),
    RecentOrder(
      no: "#876366",
      image: Assets.images.product,
      name: "Argan Oil",
      price: 21,
      totalOrder: 78,
      totalAmount: "1,461,60",
    ),
    RecentOrder(
      no: "#876367",
      image: Assets.images.product,
      name: "EAU DE Parfum",
      price: 32,
      totalOrder: 98,
      totalAmount: "1,46,60",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.6,
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent Orders", style: TextTheme.of(context).bodyMedium),
              Icon(
                Icons.more_horiz_outlined,
                size: 15,
                color: Color(0xffB3B3BF),
              ),
            ],
          ),
          SizedBox(height: AppConstrain.paddingSmall),
          Expanded(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FlexColumnWidth(1.75),
                1: FlexColumnWidth(2.5),
                2: FlexColumnWidth(1.25),
                3: FlexColumnWidth(1.75),
                4: FlexColumnWidth(2),
              },
              children: <TableRow>[
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xffF2F2F4)),
                    ),
                  ),
                  children: <Widget>[
                    CusTableTitle(text: 'Tracking no'),
                    CusTableTitle(text: 'Product Name'),
                    CusTableTitle(text: 'Price'),
                    CusTableTitle(text: 'Total Order'),
                    CusTableTitle(text: 'Total Amount', showArrow: false),
                  ],
                ),
                ..._ordersList.map((order) {
                  return TableRow(
                    children: <Widget>[
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            AppConstrain.paddingSmall / 2,
                          ),
                          child: Text(
                            order.no,
                            style: TextStyle(
                              color: Color(0xff030229),
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Row(
                          children: [
                            Image.asset(Assets.images.order.path, width: 40),
                            Expanded(
                              child: Text(
                                order.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            AppConstrain.paddingSmall / 2,
                          ),
                          child: Text(
                            "\$${order.price}",
                            style: TextStyle(
                              color: Color(0xff030229),
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Container(
                            width: 50,
                            padding: EdgeInsets.all(
                              AppConstrain.paddingSmall / 8,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffE7F7FA),
                              borderRadius: BorderRadius.circular(
                                AppConstrain.borderRadius / 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                order.totalOrder.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xff26C0E2),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            AppConstrain.paddingSmall / 2,
                          ),
                          child: Text(
                            "\$${order.totalAmount}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xff030229),
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
