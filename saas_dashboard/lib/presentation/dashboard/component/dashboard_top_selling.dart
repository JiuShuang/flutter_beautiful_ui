import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

class TopSellingProduct {
  final String image;
  final String name;
  final int star;
  final int price;

  TopSellingProduct({
    required this.image,
    required this.name,
    required this.star,
    required this.price,
  });
}

class DashboardTopSelling extends StatefulWidget {
  final double width;
  final double height;
  const DashboardTopSelling({super.key, required this.width, required this.height});

  @override
  State<DashboardTopSelling> createState() => _DashboardTopSellingState();
}

class _DashboardTopSellingState extends State<DashboardTopSelling> {
  final List<TopSellingProduct> _topSellingProducts = [
    TopSellingProduct(
      image: Assets.images.iPhone12.path,
      name: "iPhone12",
      star: 4,
      price: 987,
    ),
    TopSellingProduct(
      image: Assets.images.iPhone12.path,
      name: "iPhone12",
      star: 4,
      price: 987,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.38,
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
              Icon(
                Icons.more_horiz_outlined,
                size: 15,
                color: Color(0xffB3B3BF),
              ),
            ],
          ),
          SizedBox(height: AppConstrain.paddingLarge),
          ...List.generate(_topSellingProducts.length, (index) {
            TopSellingProduct sellingProduct = _topSellingProducts[index];
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: widget.height * 0.11,
                      height: widget.height * 0.11,
                      margin: EdgeInsets.only(right: AppConstrain.paddingSmall),
                      padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                      decoration: BoxDecoration(
                        color: Color(0xff297FB2),
                        borderRadius: BorderRadius.circular(
                          AppConstrain.borderRadius,
                        ),
                      ),
                      child: Image.asset(sellingProduct.image),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sellingProduct.name,
                          style: TextTheme.of(context).bodySmall,
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            if (index < sellingProduct.star) {
                              return Icon(
                                Icons.star_rounded,
                                color: Color(0xffFFD66B),
                                size: 15,
                              );
                            }
                            return Icon(
                              Icons.star_rounded,
                              color: Color(0xffFFEEC4),
                              size: 15,
                            );
                          }),
                        ),
                        Text(
                          "\$${sellingProduct.price}",
                          style: TextTheme.of(context).labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                if (index < _topSellingProducts.length - 1)
                  Divider(color: Color(0xffF2F2F4)),
              ],
            );
          }),
        ],
      ),
    );
  }
}
