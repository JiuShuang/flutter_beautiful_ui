import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CusChatInputArea extends StatefulWidget {
  const CusChatInputArea({super.key});

  @override
  State<CusChatInputArea> createState() => _CusChatInputAreaState();
}

class _CusChatInputAreaState extends State<CusChatInputArea> {
  @override
  Widget build(BuildContext context) {
    return CusGridentBorderContainer(
      width: MediaQuery.sizeOf(context).width,
      radius: 30,
      child: Padding(
        padding: EdgeInsets.all(AppLayout.paddingMedium),
        child: Column(
          children: [
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Message Chatbot Ai......",
                  hintStyle: AppTextStyle.captionMedium),
            ),
            Row(
              children: [
                CusGridentBorderContainer(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: SvgPicture.asset(Assets.images.add),
                  ),
                ),
                SizedBox(width: AppLayout.paddingSmall),
                Expanded(
                    child: CusGridentBorderContainer(
                  height: 40,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.paddingMedium),
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.images.search),
                          SizedBox(
                            width: AppLayout.paddingSmall / 2,
                          ),
                          Text(
                            "Type your question",
                            style: AppTextStyle.captionMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
                SizedBox(width: AppLayout.paddingSmall),
                CusGridentBorderContainer(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: SvgPicture.asset(Assets.images.misco),
                  ),
                ),
                SizedBox(width: AppLayout.paddingSmall),
                GestureDetector(
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(AppLayout.paddingSmall / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                            colors: [Color(0xff3659F4), Color(0xff3C82F2)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Center(child: SvgPicture.asset(Assets.images.voice)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
