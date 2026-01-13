import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/invoice/invoice.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_table_title.dart';

class InvoiceTable extends StatefulWidget {
  const InvoiceTable({super.key});

  @override
  State<InvoiceTable> createState() => _InvoiceTableState();
}

class _InvoiceTableState extends State<InvoiceTable> {
  final int flexSelect = 3;
  final int flexId = 6;
  final int flexName = 10;
  final int flexEmail = 12;
  final int flexDate = 8;
  final int flexStatus = 8;
  final int flexMoreTools = 6;
  List<Invoice> _invoiceList = [];
  List<bool> _checkList = [];
  final List<GlobalKey> _keys = [];
  OverlayEntry? _moreTools;
  int _activeIndex = -1;

    @override
  void initState() {
    final List<InvoiceStatus> statusList = InvoiceStatus.values;
    _invoiceList = List.generate(10, (index) {
      _checkList.add(false);
      _keys.add(GlobalKey());
      final randomIndex = Random().nextInt(statusList.length);
      return Invoice(
        id: "#${index}76364",
        avatar: Assets.images.avatar.path,
        name: "Arrora gaur",
        email: "arroragaur@gmail.com",
        date: "12 Dec, 2020",
        status: statusList[randomIndex],
        isStar: index % 2 == 0 ? true : false,
      );
    });
    super.initState();
  }

  void _getMoreIconPosition(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    _openMoreTools(Offset(offset.dx -20, offset.dy + renderBox.size.height));
  }

  void _openMoreTools(Offset offset) {
    _moreTools?.remove();
    _moreTools = null;
    _moreTools = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => _removeMoreTools(),
                  child: ColoredBox(color: Colors.transparent),
                ),
              ),
              Positioned(
                top: offset.dy,
                left: offset.dx,
                child: Container(
                  padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstrain.borderRadius,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(31, 104, 104, 104),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                        decoration: BoxDecoration(
                          color: Color(0xffF7FAFF),
                          borderRadius: BorderRadius.circular(
                            AppConstrain.borderRadius,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit_rounded,
                              color: Color(0xff5B93FF),
                              size: 15,
                            ),
                            SizedBox(width: AppConstrain.paddingSmall),
                            Text(
                              "Edit",
                              style: TextStyle(
                                color: Color(0xff5B93FF),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppConstrain.paddingSmall / 2),
                      Container(
                        width: 80,
                        padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                        decoration: BoxDecoration(
                          color: Color(0xffFEF4F5),
                          borderRadius: BorderRadius.circular(
                            AppConstrain.borderRadius,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_rounded,
                              color: Color(0xffE71D36),
                              size: 15,
                            ),
                            SizedBox(width: AppConstrain.paddingSmall),
                            Text(
                              "Delete",
                              style: TextStyle(
                                color: Color(0xffE71D36),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    Overlay.of(context).insert(_moreTools!);
  }

  void _removeMoreTools() {
    setState(() {
      _activeIndex = -1;
    });
    _moreTools?.remove();
    _moreTools = null;
  }

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
                flex: flexSelect,
                child: CusTableTitle(text: '', showArrow: false),
              ),
              Expanded(
                flex: flexId,
                child: CusTableTitle(text: 'Invoice Id'),
              ),
              Expanded(
                flex: flexName,
                child: CusTableTitle(text: 'Name'),
              ),
              Expanded(
                flex: flexEmail,
                child: CusTableTitle(text: 'Email'),
              ),
              Expanded(
                flex: flexDate,
                child: CusTableTitle(text: 'Date'),
              ),
              Expanded(
                flex: flexStatus,
                child: CusTableTitle(text: 'Status', showArrow: false),
              ),
              Expanded(
                flex: flexMoreTools,
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
              itemCount: _invoiceList.length,
              itemBuilder: (context, index) {
                final Invoice invoice = _invoiceList[index];
                return AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  margin: EdgeInsets.symmetric(
                    horizontal: AppConstrain.paddingSmall,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: _activeIndex == index
                        ? AppConstrain.paddingSmall * 1.3
                        : AppConstrain.paddingSmall,
                    horizontal: AppConstrain.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstrain.borderRadius,
                    ),
                    boxShadow: [
                      if (_activeIndex == index)
                        BoxShadow(
                          color: const Color.fromARGB(31, 104, 104, 104),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: flexSelect,
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                _checkList[index]=!_checkList[index];
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: _checkList[index]
                                    ? AppColors.secondColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: _checkList[index]
                                      ? AppColors.secondColor
                                      : const Color(0xffD1D1D6),
                                  width: 1.5,
                                ),
                              ),
                              child: _checkList[index]
                                  ? const Icon(
                                      Icons.check,
                                      size: 10,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: flexId,
                        child: Text(
                          invoice.id,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: flexName,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                Assets.images.avatar.path,
                                width: 30,
                              ),
                            ),
                            SizedBox(width: AppConstrain.paddingSmall / 2),
                            Text(
                              invoice.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: flexEmail,
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_rounded,
                              color: Color(0xff3A974C),
                              size: 15,
                            ),
                            SizedBox(width: AppConstrain.paddingSmall / 2),
                            Text(
                              invoice.email,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: flexDate,
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xff4285F4),
                              size: 15,
                            ),
                            SizedBox(width: AppConstrain.paddingSmall / 2),
                            Text(
                              invoice.date,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: flexStatus,
                        child: Center(
                          child: Container(
                            width: 80,
                            padding: EdgeInsets.all(
                              AppConstrain.paddingSmall * 0.3,
                            ),
                            decoration: BoxDecoration(
                              color: invoice.status.backgroundColor,
                              borderRadius: BorderRadius.circular(
                                AppConstrain.borderRadius,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                invoice.status.label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: invoice.status.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: flexMoreTools,
                        child: Align(
                          alignment: AlignmentGeometry.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.star_rounded,
                                  size: 18,
                                  color: invoice.isStar
                                      ? Color(0xffFFD66B)
                                      : Color(0xffE8E8EC),
                                ),
                              ),
                              SizedBox(width: AppConstrain.paddingSmall),
                              GestureDetector(
                                key: _keys[index],
                                onTap: () {
                                  setState(() {
                                    _activeIndex = index;
                                  });
                                  _getMoreIconPosition(_keys[index]);
                                },
                                child: Icon(
                                  Icons.more_horiz_rounded,
                                  size: 18,
                                  color: _activeIndex == index
                                      ? AppColors.secondColor
                                      : Color(0xffE8E8EC),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
