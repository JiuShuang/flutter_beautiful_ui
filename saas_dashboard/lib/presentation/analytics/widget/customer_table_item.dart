import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/analytics/customer.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

class CustomerTableItem extends StatefulWidget {
  final List<int> flexList;
  final Customer customer;
  const CustomerTableItem({
    super.key,
    required this.customer,
    required this.flexList,
  });

  @override
  State<CustomerTableItem> createState() => _CustomerTableItemState();
}

class _CustomerTableItemState extends State<CustomerTableItem> {
  bool _isActive = false;
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _moreTools;

  void _getMoreIconPosition() {
    final RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    _openMoreTools(Offset(offset.dx - 10, offset.dy + renderBox.size.height));
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
            flex: widget.flexList[0],
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(Assets.images.avatar.path, width: 30),
                ),
                SizedBox(width: AppConstrain.paddingSmall),
                Expanded(
                  child: Text(
                    widget.customer.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: widget.flexList[1],
            child: Text(
              widget.customer.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11),
            ),
          ),
          Expanded(
            flex: widget.flexList[2],
            child: Text(
              widget.customer.phone,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11),
            ),
          ),
          Expanded(
            flex: widget.flexList[3],
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: widget.customer.gender == "Male"
                      ? const Color(0xffEFF4FF)
                      : const Color(0xffFCF1ED),
                  borderRadius: BorderRadius.circular(
                    AppConstrain.borderRadius,
                  ),
                ),
                child: Text(
                  widget.customer.gender,
                  style: TextStyle(
                    color: widget.customer.gender == "Male"
                        ? const Color(0xff5B93FF)
                        : const Color(0xffFD8E6B),
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: widget.flexList[4],
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() => _isActive = true);
                  _getMoreIconPosition();
                },
                child: Icon(
                  key: _key,
                  Icons.more_horiz_outlined,
                  color: _isActive
                      ? AppColors.secondColor
                      : const Color(0xffB3B3BF),
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
