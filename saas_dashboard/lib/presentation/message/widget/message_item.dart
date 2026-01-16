import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/message/im_message.dart';

class MessageItem extends StatelessWidget {
  final ImMessage message;
  final bool isPreNotOther;
  final String avatar;
  const MessageItem({
    super.key,
    required this.message,
    required this.isPreNotOther,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe
          ? AlignmentGeometry.bottomRight
          : AlignmentGeometry.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppConstrain.paddingSmall),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!message.isMe)
              Padding(
                padding: EdgeInsets.only(right: AppConstrain.paddingSmall),
                child: isPreNotOther
                    ? ClipOval(child: Image.asset(avatar, width: 30))
                    : SizedBox(width: 30),
              ),
            Container(
              padding: EdgeInsets.all(AppConstrain.paddingSmall),
              decoration: BoxDecoration(
                color: message.isMe ? Color(0xffF7F7F8) : Color(0xff5B93FF),
                borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      fontSize: 12,
                      color: message.isMe ? Colors.black : Colors.white,
                    ),
                  ),
                  SizedBox(height: AppConstrain.paddingSmall * 0.2),
                  Text(
                    message.sendTime,
                    style: TextStyle(
                      fontSize: 8,
                      color: message.isMe ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
