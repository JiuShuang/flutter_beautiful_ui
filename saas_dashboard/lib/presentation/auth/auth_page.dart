import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/auth/component/log_in_form.dart';
import 'package:saas_dashboard/presentation/auth/component/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  bool _isLogIn = true;
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeForm() {
    setState(() {
      _isLogIn = !_isLogIn;
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextTheme.of(context).bodySmall ?? TextStyle(),
      child: ColoredBox(
        color: AppColors.backgroundColor,
        child: Row(
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.symmetric(
                horizontal: AppConstrain.paddingMedium,
              ),
              decoration: BoxDecoration(color: Colors.white),
              child: AnimatedBuilder(
                animation: _animation,
                child: _isLogIn
                    ? LogInForm(toSignUp: () => _changeForm())
                    : SignUpForm(toLogIn: () => _changeForm()),
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(-30.0 * (1 - _animation.value), 0),
                    child: Opacity(opacity: _animation.value, child: child),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(100),
                child: AnimatedBuilder(
                  animation: _animation,
                  child: SvgPicture.asset(
                    _isLogIn
                        ? Assets.images.logInImage
                        : Assets.images.signUpImage,
                  ),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(-30.0 * (1 * _animation.value), 0),
                      child: Opacity(opacity: _animation.value, child: child),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
