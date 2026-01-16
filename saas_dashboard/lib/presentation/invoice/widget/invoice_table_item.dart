import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/invoice/invoice.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_checkbox.dart';

class InvoiceTableItem extends StatefulWidget {
  final Invoice invoice;
  const InvoiceTableItem({super.key, required this.invoice});

  @override
  State<InvoiceTableItem> createState() => _InvoiceTableItemState();
}

class _InvoiceTableItemState extends State<InvoiceTableItem> {
  final int _flexSelect = 3;
  final int _flexId = 6;
  final int _flexName = 10;
  final int _flexEmail = 12;
  final int _flexDate = 8;
  final int _flexStatus = 8;
  final int _flexMoreTools = 6;
  final GlobalKey _key = GlobalKey();
  bool _isActive = false;
  OverlayEntry? _moreTools;

  void _getMoreIconPosition() {
    final RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    _openMoreTools(Offset(offset.dx - 20, offset.dy + renderBox.size.height));
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
      _isActive = false;
    });
    _moreTools?.remove();
    _moreTools = null;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.symmetric(horizontal: AppConstrain.paddingSmall),
      padding: EdgeInsets.symmetric(
        vertical: _isActive
            ? AppConstrain.paddingSmall * 1.3
            : AppConstrain.paddingSmall,
        horizontal: AppConstrain.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
        boxShadow: [
          if (_isActive)
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
            flex: _flexSelect,
            child: Center(
              child: CusCheckbox(value: false, onChanged: (value) {}),
            ),
          ),
          Expanded(
            flex: _flexId,
            child: Text(
              widget.invoice.id,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11),
            ),
          ),
          Expanded(
            flex: _flexName,
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(Assets.images.avatar.path, width: 30),
                ),
                SizedBox(width: AppConstrain.paddingSmall / 2),
                Text(
                  widget.invoice.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Expanded(
            flex: _flexEmail,
            child: Row(
              children: [
                Icon(Icons.email_rounded, color: Color(0xff3A974C), size: 15),
                SizedBox(width: AppConstrain.paddingSmall / 2),
                Text(
                  widget.invoice.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Expanded(
            flex: _flexDate,
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  color: Color(0xff4285F4),
                  size: 15,
                ),
                SizedBox(width: AppConstrain.paddingSmall / 2),
                Text(
                  widget.invoice.date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Expanded(
            flex: _flexStatus,
            child: Center(
              child: Container(
                width: 80,
                padding: EdgeInsets.all(AppConstrain.paddingSmall * 0.3),
                decoration: BoxDecoration(
                  color: widget.invoice.status.backgroundColor,
                  borderRadius: BorderRadius.circular(
                    AppConstrain.borderRadius,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.invoice.status.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: widget.invoice.status.textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _flexMoreTools,
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
                      color: widget.invoice.isStar
                          ? Color(0xffFFD66B)
                          : Color(0xffE8E8EC),
                    ),
                  ),
                  SizedBox(width: AppConstrain.paddingSmall),
                  GestureDetector(
                    key: _key,
                    onTap: () {
                      setState(() {
                        _isActive = true;
                      });
                      _getMoreIconPosition();
                    },
                    child: Icon(
                      Icons.more_horiz_rounded,
                      size: 18,
                      color: _isActive
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
  }
}
