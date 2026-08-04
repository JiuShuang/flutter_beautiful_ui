import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/model/message.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';

class MsgItem extends StatefulWidget {
  final Message message;
  const MsgItem({super.key, required this.message});

  @override
  State<MsgItem> createState() => _MsgItemState();
}

class _MsgItemState extends State<MsgItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppLayout.paddingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        textDirection:
            widget.message.isUser ? TextDirection.rtl : TextDirection.ltr,
        children: [
          CusGridentBorderContainer(
            child: Padding(
              padding: EdgeInsets.all(AppLayout.paddingSmall / 2),
              child: Center(
                child: Image.asset(
                  Assets.images.ai.path,
                  width: 35,
                  height: 35,
                ),
              ),
            ),
          ),
          SizedBox(width: AppLayout.paddingMedium),
          Expanded(
              child: Stack(
            alignment: widget.message.isUser
                ? AlignmentDirectional.centerEnd
                : AlignmentDirectional.centerStart,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  left: widget.message.isUser ? null : -AppLayout.paddingSmall,
                  right: widget.message.isUser ? -AppLayout.paddingSmall : null,
                  bottom: 0,
                  child: CusGridentBorderContainer(
                    width: 10,
                    height: 10,
                  )),
              CusGridentBorderContainer(
                radius: 20,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.paddingMedium,
                      vertical: AppLayout.paddingSmall),
                  child: Text(
                    widget.message.content,
                    style: AppTextStyle.captionMedium,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
