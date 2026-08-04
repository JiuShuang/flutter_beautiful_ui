import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/model/app_mock.dart';
import 'package:ai_chat/views/chat/widgets/msg_item.dart';
import 'package:ai_chat/widgets/cus_background.dart';
import 'package:ai_chat/widgets/cus_chat_input_area.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return CusBackground(
        child: SafeArea(
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                titleSpacing: 0,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Center(
                  child: CusGridentBorderContainer(
                    width: 40,
                    height: 40,
                    child: Center(child: Icon(Icons.keyboard_arrow_left)),
                  ),
                ),
                title: CusGridentBorderContainer(
                  height: 40,
                  width: 100,
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.paddingSmall),
                  child: Center(
                      child: Text(
                    "Model 2.2",
                    style: AppTextStyle.bodySmall,
                  )),
                ),
                actions: [
                  CusGridentBorderContainer(
                    width: 40,
                    height: 40,
                    child: Center(child: Icon(Icons.more_horiz_outlined)),
                  )
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(AppLayout.paddingMedium),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: AppMock.messages.length,
                            itemBuilder: (context, index) {
                              return MsgItem(message: AppMock.messages[index]);
                            })),
                    CusChatInputArea()
                  ],
                ),
              ),
            )));
  }
}
