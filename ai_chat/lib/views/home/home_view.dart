import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/views/chat/chat_view.dart';
import 'package:ai_chat/views/home/sections/home_header_section.dart';
import 'package:ai_chat/views/home/widgets/home_quick_use_item.dart';
import 'package:ai_chat/widgets/cus_background.dart';
import 'package:ai_chat/widgets/cus_chat_input_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _quickUseAndChatAnim;
  late AnimationController _aiLogoController;
  late Animation _aiLogoAnim;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _quickUseAndChatAnim = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
    _aiLogoController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _aiLogoAnim = Tween<double>(begin: 1.2, end: 0.8).animate(
        CurvedAnimation(parent: _aiLogoController, curve: Curves.easeInOut));
    _aiLogoController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _aiLogoController.dispose();
    super.dispose();
  }

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
                  HomeHeaderSection(),
                  AnimatedBuilder(
                    animation: _aiLogoAnim,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _aiLogoAnim.value,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      Assets.images.ai.path,
                      width: 200,
                      height: 200,
                      colorBlendMode: BlendMode.color,
                    ),
                  ),
                  Text("Hello I'm Futuristic", style: AppTextStyle.h2),
                  Text(
                    "Your AI digital Partners",
                    style: AppTextStyle.captionMedium,
                  ),
                  SizedBox(height: AppLayout.paddingLarge),
                  AnimatedBuilder(
                    animation: _quickUseAndChatAnim,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -20.0 * _quickUseAndChatAnim.value),
                        child: Opacity(
                            opacity: 1.0 - _quickUseAndChatAnim.value,
                            child: child),
                      );
                    },
                    child: HomeQuickUseItem(
                      onTap: _tapToChat,
                      title: Text(
                        "Learn How to Build an Appliaction",
                        style: AppTextStyle.h3,
                      ),
                      hintText:
                          "Your application has been submitted successfully to Mana Coding. We’ll review your request and get back to you soon.",
                    ),
                  ),
                  SizedBox(height: AppLayout.paddingLarge),
                  Row(
                    children: [
                      Expanded(
                          child: AnimatedBuilder(
                        animation: _quickUseAndChatAnim,
                        builder: (context, child) {
                          return Transform.translate(
                            offset:
                                Offset(-20.0 * _quickUseAndChatAnim.value, 0),
                            child: Opacity(
                              opacity: 1.0 - _quickUseAndChatAnim.value,
                              child: child,
                            ),
                          );
                        },
                        child: HomeQuickUseItem(
                            onTap: _tapToChat,
                            title: SvgPicture.asset(Assets.images.image),
                            hintText:
                                "Generate with AI\nPrompt Creator\nBuild AI Prompt"),
                      )),
                      SizedBox(
                        width: AppLayout.paddingMedium,
                      ),
                      Expanded(
                          child: AnimatedBuilder(
                        animation: _quickUseAndChatAnim,
                        builder: (context, child) {
                          return Transform.translate(
                            offset:
                                Offset(20.0 * _quickUseAndChatAnim.value, 0),
                            child: Opacity(
                              opacity: 1.0 - _quickUseAndChatAnim.value,
                              child: child,
                            ),
                          );
                        },
                        child: HomeQuickUseItem(
                            onTap: _tapToChat,
                            title: SvgPicture.asset(Assets.images.video),
                            hintText: "AI-Powered\nMotion Video\nCreato"),
                      )),
                    ],
                  ),
                  Spacer(),
                  AnimatedBuilder(
                    animation: _quickUseAndChatAnim,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 20.0 * _quickUseAndChatAnim.value),
                        child: Opacity(
                          opacity: 1.0 - _quickUseAndChatAnim.value,
                          child: child,
                        ),
                      );
                    },
                    child: CusChatInputArea(),
                  )
                ],
              ),
            )));
  }
}
