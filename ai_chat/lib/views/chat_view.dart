import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/widgets/cus_background.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.paddingSmall),
                    child: Center(
                        child: Text(
                      "Model 2.2",
                      style: AppTextStyle.bodySmall,
                    )),
                  ),
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
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppLayout.paddingSmall),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CusGridentBorderContainer(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            AppLayout.paddingSmall / 2),
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
                                      clipBehavior: Clip.none,
                                      children: [
                                        CusGridentBorderContainer(
                                          radius: 20,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    AppLayout.paddingMedium,
                                                vertical:
                                                    AppLayout.paddingSmall),
                                            child: (index % 2) == 0
                                                ? Text(
                                                    "Hi! I’m your smart AI assistant 🤖")
                                                : Text(
                                                    "Absolutely ✅\nHere’s your plan:\n1️⃣ Morning workout\n2️⃣ Team meeting at 10 AM\n3️⃣ Lunch break at 1 PM\n4️⃣ Finish design project by 5 PM",
                                                    style: AppTextStyle
                                                        .captionMedium,
                                                  ),
                                          ),
                                        ),
                                        Positioned(
                                            left: -AppLayout.paddingSmall,
                                            bottom: 0,
                                            child: CusGridentBorderContainer(
                                              width: 10,
                                              height: 10,
                                            ))
                                      ],
                                    ))
                                  ],
                                ),
                              );
                            })),
                    CusGridentBorderContainer(
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
                                          SvgPicture.asset(
                                              Assets.images.search),
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
                                    child:
                                        SvgPicture.asset(Assets.images.misco),
                                  ),
                                ),
                                SizedBox(width: AppLayout.paddingSmall),
                                GestureDetector(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: EdgeInsets.all(
                                        AppLayout.paddingSmall / 2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        gradient: LinearGradient(
                                            colors: [
                                              Color(0xff3659F4),
                                              Color(0xff3C82F2)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)),
                                    child: Center(
                                        child: SvgPicture.asset(
                                            Assets.images.voice)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
