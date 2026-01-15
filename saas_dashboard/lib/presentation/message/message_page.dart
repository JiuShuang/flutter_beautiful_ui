import 'package:flutter/material.dart';
import 'package:saas_dashboard/entity/message/im_session.dart';
import 'package:saas_dashboard/presentation/message/component/message_area.dart';
import 'package:saas_dashboard/presentation/message/component/session_list.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation _sessionAnimation;
  late Animation _messageAnimation;
  ImSession? _openSession;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _sessionAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0, 0.5),
    );
    _messageAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1),
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
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedBuilder(
              animation: _sessionAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-20.0 * (1 - _sessionAnimation.value), 0),
                  child: Opacity(
                    opacity: _sessionAnimation.value,
                    child: child,
                  ),
                );
              },
              child: SessionList(
                width: width,
                tapSession: (ImSession value) {
                  setState(() {
                    _openSession = value;
                  });
                },
              ),
            ),
            AnimatedBuilder(
              animation: _messageAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(20.0 * (1 - _sessionAnimation.value), 0),
                  child: Opacity(
                    opacity: _sessionAnimation.value,
                    child: child,
                  ),
                );
              },
              child: MessageArea(width: width, imSession: _openSession),
            ),
          ],
        );
      },
    );
  }
}
