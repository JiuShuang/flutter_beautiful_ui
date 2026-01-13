import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/analytics/customer.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_table_title.dart';

class CustomerTable extends StatefulWidget {
  const CustomerTable({super.key});

  @override
  State<CustomerTable> createState() => _CustomerTableState();
}

class _CustomerTableState extends State<CustomerTable> {
  final int flex0 = 10;
  final int flex1 = 10;
  final int flex2 = 8;
  final int flex3 = 3;
  final int flex4 = 5;
  List<Customer> _customerList = [];
  final List<GlobalKey> _keys = [];
  OverlayEntry? _moreTools;
  int _activeIndex = -1;

  @override
  void initState() {
    _customerList = List.generate(10, (index) {
      _keys.add(GlobalKey());
      return Customer(
        avatar: Assets.images.avatar.path,
        name: "John Deo",
        email: "johndoe2211@gmail.com",
        phone: "+33757005467",
        gender: index % 2 == 0 ? "Male" : "Female",
      );
    });
    super.initState();
  }

  void _getMoreIconPosition(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
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
                flex: flex0,
                child: CusTableTitle(text: 'Name'),
              ),
              Expanded(
                flex: flex1,
                child: CusTableTitle(text: 'Email'),
              ),
              Expanded(
                flex: flex2,
                child: CusTableTitle(text: 'Phone Number'),
              ),
              Expanded(
                flex: flex3,
                child: CusTableTitle(text: 'Gender'),
              ),
              Expanded(
                flex: flex4,
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
              itemCount: _customerList.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstrain.paddingSmall),
              padding: EdgeInsets.only(top: AppConstrain.paddingSmall),
              itemBuilder: (context, index) {
                final customer = _customerList[index];
                return AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  margin: EdgeInsets.symmetric(
                    horizontal: AppConstrain.paddingSmall,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: _activeIndex == index
                        ? AppConstrain.paddingSmall * 0.3
                        : 0,
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
                        flex: flex0,
                        child: Padding(
                          padding: EdgeInsets.all(AppConstrain.paddingMedium),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  Assets.images.avatar.path,
                                  width: 30,
                                ),
                              ),
                              SizedBox(width: AppConstrain.paddingSmall),
                              Expanded(
                                child: Text(
                                  customer.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: flex1,
                        child: Text(
                          customer.email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: flex2,
                        child: Text(
                          customer.phone,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: flex3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: customer.gender == "Male"
                                  ? const Color(0xffEFF4FF)
                                  : const Color(0xffFCF1ED),
                              borderRadius: BorderRadius.circular(
                                AppConstrain.borderRadius,
                              ),
                            ),
                            child: Text(
                              customer.gender,
                              style: TextStyle(
                                color: customer.gender == "Male"
                                    ? const Color(0xff5B93FF)
                                    : const Color(0xffFD8E6B),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: flex4,
                        child: Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              setState(() => _activeIndex = index);
                              _getMoreIconPosition(_keys[index]);
                            },
                            child: Icon(
                              key: _keys[index],
                              Icons.more_horiz_outlined,
                              color: _activeIndex == index
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
              },
            ),
          ),
        ),
      ],
    );
  }
}
