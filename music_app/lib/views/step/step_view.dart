import 'package:flutter/material.dart';
import 'package:music_app/config/app_style.dart';
import 'package:music_app/widgets/cus_background.dart';

class StepView extends StatefulWidget {
  const StepView({super.key});

  @override
  State<StepView> createState() => _StepViewState();
}

class _StepViewState extends State<StepView> {
  final List<String> _musicStyle = [
    "Hip-hop",
    "R&B",
    "Alternative",
    "Pop",
    "Rock",
    "Electronic",
    "Country",
    "Classical",
    "Jazz",
    "Blues",
    "House",
    "Experimental"
  ];

  ValueNotifier<Set<String>> _selectedStyle = ValueNotifier({});

  @override
  Widget build(BuildContext context) {
    return CusBackground(
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose your genre and \n artist you like",
                  style: AppTextStyle.h1,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: AppLayout.paddingLarge),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.paddingMedium),
                  decoration: BoxDecoration(
                    color: AppColors.btnColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextField(
                    style: AppTextStyle.bodyModium,
                    cursorColor: AppColors.textColor,
                    decoration: InputDecoration(
                        hintText: "Search Genre or Artist",
                        hintStyle: AppTextStyle.labelMedium,
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(height: AppLayout.paddingLarge),
                ListenableBuilder(
                    listenable: _selectedStyle,
                    builder: (context, child) {
                      return Wrap(
                        spacing: AppLayout.paddingMedium,
                        runSpacing: AppLayout.paddingSmall,
                        children: _musicStyle.map((e) {
                          return GestureDetector(
                            onTap: () {
                              final current =
                                  Set<String>.from(_selectedStyle.value);
                              if (current.contains(e)) {
                                current.remove(e);
                              } else {
                                current.add(e);
                              }
                              _selectedStyle.value = current;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppLayout.paddingMedium,
                                  vertical: AppLayout.paddingSmall * 0.75),
                              decoration: BoxDecoration(
                                  color: _selectedStyle.value.contains(e)
                                      ? AppColors.red.withOpacity(0.2)
                                      : AppColors.btnColor,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: _selectedStyle.value.contains(e)
                                          ? AppColors.red
                                          : Colors.transparent)),
                              child: Text(
                                e,
                                style: AppTextStyle.bodyModium,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppLayout.paddingMedium),
                  child: Text(
                    "Artists",
                    style: AppTextStyle.h3,
                  ),
                )
              ],
            ),
          )),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: AppColors.red,
                  minimumSize: Size(MediaQuery.sizeOf(context).width, 56)),
              child: Text(
                "Get started",
                style: AppTextStyle.h3,
              ))
        ],
      ),
    );
  }
}
