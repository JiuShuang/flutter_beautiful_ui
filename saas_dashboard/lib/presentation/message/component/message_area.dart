import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/message/im_message.dart';
import 'package:saas_dashboard/entity/message/im_session.dart';
import 'package:saas_dashboard/presentation/message/widget/message_item.dart';

class MessageArea extends StatefulWidget {
  final double width;
  final ImSession? imSession;
  const MessageArea({super.key, required this.width, required this.imSession});

  @override
  State<MessageArea> createState() => _MessageAreaState();
}

class _MessageAreaState extends State<MessageArea>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MessageArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imSession != widget.imSession) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.72,
      height: double.infinity,
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: widget.imSession == null
          ? SizedBox.shrink()
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentGeometry.bottomRight,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                widget.imSession!.avatar,
                                width: 35,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: widget.imSession!.isActive
                                      ? Color(0xff2CC84A)
                                      : Color(0xffF7F7F8),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: AppConstrain.paddingSmall / 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Carlio",
                              style: TextTheme.of(context).bodySmall,
                            ),
                            Text(
                              widget.imSession!.isActive ? "Online" : "Leave",
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xff999999),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            minimumSize: Size(30, 30),
                            maximumSize: Size(30, 30),
                            padding: EdgeInsets.all(5),
                            backgroundColor: Color(0xffF7F7F8),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone,
                            color: Color(0xff7C7C7C),
                            size: 15,
                          ),
                        ),
                        SizedBox(width: AppConstrain.paddingSmall),
                        IconButton(
                          style: IconButton.styleFrom(
                            minimumSize: Size(30, 30),
                            maximumSize: Size(30, 30),
                            padding: EdgeInsets.all(5),
                            backgroundColor: Color(0xffF7F7F8),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.video_call_rounded,
                            color: Color(0xff7C7C7C),
                            size: 15,
                          ),
                        ),
                        SizedBox(width: AppConstrain.paddingSmall),
                        IconButton(
                          style: IconButton.styleFrom(
                            minimumSize: Size(30, 30),
                            maximumSize: Size(30, 30),
                            padding: EdgeInsets.all(5),
                            backgroundColor: Color(0xffF7F7F8),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert_rounded,
                            color: Color(0xff7C7C7C),
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      final ImMessage message = messageList[index];
                      bool isPreNotOther = true;
                      if (index != 0) {
                        isPreNotOther = messageList[index - 1].isMe;
                      }
                      final Animation animation = CurvedAnimation(
                        parent: _controller,
                        curve: Interval(
                          1 / messageList.length * index,
                          1 / messageList.length * (1 + index),
                        ),
                      );
                      return AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, 20.0 * (1 - animation.value)),
                            child: Opacity(
                              opacity: animation.value,
                              child: child,
                            ),
                          );
                        },
                        child: MessageItem(
                          message: message,
                          isPreNotOther: isPreNotOther,
                          avatar: widget.imSession!.avatar,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppConstrain.paddingSmall),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstrain.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFB),
                    borderRadius: BorderRadius.circular(
                      AppConstrain.borderRadius,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.link, size: 15),
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 11),
                          decoration: InputDecoration(
                            hintText: "Type a message...",
                            hoverColor: Colors.transparent,
                            hintStyle: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          minimumSize: Size(30, 30),
                          maximumSize: Size(30, 30),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.emoji_emotions, size: 15),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          minimumSize: Size(30, 30),
                          maximumSize: Size(30, 30),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          size: 15,
                          color: AppColors.secondColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
