import 'package:saas_dashboard/entity/message/im_message.dart';

class ImSession {
  final int id;
  final String name;
  final String avatar;
  final bool isActive;
  final ImMessage latestMessage;
  ImSession(
    this.latestMessage, {
    required this.name,
    required this.avatar,
    required this.isActive,
    required this.id,
  });
}
