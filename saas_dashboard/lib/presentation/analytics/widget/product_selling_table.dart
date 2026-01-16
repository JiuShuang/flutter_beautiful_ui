import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/analytics/analytics_selling_product.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_table_title.dart';

class ProductSellingTable extends StatelessWidget {
  final double width;
  const ProductSellingTable({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.65,
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
              Text(
                "Top Selling Products",
                style: TextTheme.of(context).bodyMedium,
              ),
              Text(
                "See More",
                style: TextStyle(color: AppColors.secondColor, fontSize: 10),
              ),
            ],
          ),
          SizedBox(height: AppConstrain.paddingSmall),
          Expanded(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1.25),
                3: FlexColumnWidth(1.75),
                4: FlexColumnWidth(1.5),
              },
              children: [
                TableRow(
                  children: <Widget>[
                    CusTableTitle(text: 'SN'),
                    CusTableTitle(text: 'Name'),
                    CusTableTitle(text: 'Price'),
                    CusTableTitle(text: 'Total Order'),
                    CusTableTitle(text: 'Total Sales', showArrow: false),
                  ],
                ),
                ...List.generate(productList.length, (index) {
                  final AnalyticsSellingProduct product = productList[index];
                  return TableRow(
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Color(0xffFAFAFB) : null,
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstrain.paddingSmall,
                        ),
                        child: Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: product.sn == 0
                              ? SvgPicture.asset(Assets.images.top)
                              : Text(
                                  product.sn.toString(),
                                  style: TextStyle(fontSize: 11),
                                ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.all(
                              AppConstrain.paddingSmall / 2,
                            ),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color(0xffA4A2FF),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(product.image),
                          ),
                          Expanded(
                            child: Text(
                              product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff0068DD),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$${product.price}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "${product.totalOrder} Piece",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "\$${product.totalSales}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff2B9943),
                          fontSize: 11,
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
