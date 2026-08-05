import 'package:flutter/material.dart';
import 'package:music_app/config/app_style.dart';
import 'package:music_app/gen/assets.gen.dart';
import 'package:music_app/views/splash/sections/login_type.dart';
import 'package:music_app/views/splash/sections/start_section.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ValueNotifier<bool> _tapStarted = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              child:
                  Image.asset(Assets.images.splashBg.path, fit: BoxFit.cover)),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(AppLayout.paddingMedium),
                  child: ListenableBuilder(
                      listenable: _tapStarted,
                      builder: (context, child) {
                        return _tapStarted.value
                            ? LoginType()
                            : StartSection(onTapStarted: () {
                                _tapStarted.value = true;
                              });
                      }),
                ),
              ))
        ],
      ),
    );
  }
}
