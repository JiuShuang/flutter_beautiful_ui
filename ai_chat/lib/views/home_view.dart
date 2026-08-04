import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/views/chat_view.dart';
import 'package:ai_chat/widgets/cus_background.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _tapToChat() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatView()));
  }

  @override
  Widget build(BuildContext context) {
    return CusBackground(
        child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.all(AppLayout.paddingMedium),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.images.robot),
                      SizedBox(width: AppLayout.paddingSmall),
                      Text(
                        "Futuristic AI",
                        style: AppTextStyle.h1,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: CusGridentBorderContainer(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppLayout.paddingSmall,
                                vertical: AppLayout.paddingSmall * 0.75),
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.images.vip),
                                SizedBox(width: AppLayout.paddingSmall / 2),
                                Text(
                                  "Pro Model",
                                  style: AppTextStyle.bodySmall,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: AppLayout.paddingSmall),
                    child: CusGridentBorderContainer(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("Model 2.2")),
                    ),
                  ),
                  Image.asset(
                    Assets.images.ai.path,
                    width: 200,
                    height: 200,
                    colorBlendMode: BlendMode.color,
                  ),
                  Text("Hello I'm Futuristic", style: AppTextStyle.h2),
                  Text(
                    "Your AI digital Partners",
                    style: AppTextStyle.captionMedium,
                  ),
                  SizedBox(height: AppLayout.paddingLarge),
                  CusGridentBorderContainer(
                    radius: 20,
                    child: Padding(
                      padding: EdgeInsets.all(AppLayout.paddingMedium),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Learn How to Build an Appliaction",
                                style: AppTextStyle.h3,
                              ),
                              Text(
                                "Your application has been submitted successfully to Mana Coding. We’ll review your request and get back to you soon.",
                                style: AppTextStyle.captionSmall,
                              )
                            ],
                          )),
                          SizedBox(width: AppLayout.paddingSmall),
                          CusGridentBorderContainer(
                            width: 36,
                            height: 36,
                            child: Center(
                                child: SvgPicture.asset(Assets.images.up)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppLayout.paddingMedium),
                  Row(
                    children: [
                      Expanded(
                        child: CusGridentBorderContainer(
                          radius: 20,
                          child: Padding(
                            padding: EdgeInsets.all(AppLayout.paddingMedium),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(Assets.images.image),
                                    Text(
                                      "Generate with AI\nPrompt Creator\nBuild AI Prompt",
                                      style: AppTextStyle.captionSmall,
                                    )
                                  ],
                                )),
                                SizedBox(width: AppLayout.paddingSmall),
                                CusGridentBorderContainer(
                                  width: 36,
                                  height: 36,
                                  child: Center(
                                      child:
                                          SvgPicture.asset(Assets.images.up)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppLayout.paddingMedium,
                      ),
                      Expanded(
                        child: CusGridentBorderContainer(
                          radius: 20,
                          child: Padding(
                            padding: EdgeInsets.all(AppLayout.paddingMedium),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(Assets.images.video),
                                    Text(
                                      "AI-Powered\nMotion Video\nCreator",
                                      style: AppTextStyle.captionSmall,
                                    )
                                  ],
                                )),
                                SizedBox(width: AppLayout.paddingSmall),
                                CusGridentBorderContainer(
                                  width: 36,
                                  height: 36,
                                  child: Center(
                                      child:
                                          SvgPicture.asset(Assets.images.up)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
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
                                onTap: _tapToChat,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  padding: EdgeInsets.all(
                                      AppLayout.paddingSmall / 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
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
            )));
  }
}
