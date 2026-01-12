import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

class RecentOrder {
  final String no;
  final String image;
  final String name;
  final int price;
  final int totalOrder;
  final String totalAmount;

  RecentOrder({
    required this.no,
    required this.image,
    required this.name,
    required this.price,
    required this.totalOrder,
    required this.totalAmount,
  });
}

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
                const TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xffF2F2F4)),
                    ),
                  ),
                  children: <Widget>[
                    TableTitle(text: 'Tracking no'),
                    TableTitle(text: 'Product Name'),
                    TableTitle(text: 'Price'),
                    TableTitle(text: 'Total Order'),
                    TableTitle(text: 'Total Amount', showArrow: false),
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

class TableTitle extends StatelessWidget {
  final String text;
  final bool showArrow;
  final VoidCallback? tapArrow;
  const TableTitle({
    super.key,
    required this.text,
    this.showArrow = true,
    this.tapArrow,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppConstrain.paddingSmall / 2),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(
                right: AppConstrain.paddingSmall,
              ),
              child: Text(
                text,
                style: TextStyle(color: Color(0xff030229), fontSize: 11),
              ),
            ),
            if (showArrow)
              GestureDetector(
                child: SvgPicture.asset(
                  Assets.images.arrow,
                  colorFilter: ColorFilter.mode(
                    Color(0xffCDCCD4),
                    BlendMode.srcIn,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
