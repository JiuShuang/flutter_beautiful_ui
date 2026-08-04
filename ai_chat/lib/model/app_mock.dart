import 'package:ai_chat/model/message.dart';

class AppMock {
  static final List<Message> messages = [
    Message(
      isUser: true,
      content: "Hello, nice to meet you.",
      sendTime: DateTime.now().subtract(const Duration(minutes: 50)),
    ),
    Message(
      isUser: false,
      content: "Hi! I'm an AI assistant. How can I help you today?",
      sendTime: DateTime.now().subtract(const Duration(minutes: 48)),
    ),
    Message(
      isUser: true,
      content: "I want to learn about state management in Flutter.",
      sendTime: DateTime.now().subtract(const Duration(minutes: 45)),
    ),
    Message(
      isUser: false,
      content:
          "Common state‑management solutions include Provider, Riverpod and Bloc. Choose based on your project size.",
      sendTime: DateTime.now().subtract(const Duration(minutes: 43)),
    ),
    Message(
      isUser: true,
      content: "What advantages does Riverpod have over Provider?",
      sendTime: DateTime.now().subtract(const Duration(minutes: 40)),
    ),
    Message(
      isUser: false,
      content:
          "Riverpod removes BuildContext dependency, offers compile‑time safety and built‑in caching support.",
      sendTime: DateTime.now().subtract(const Duration(minutes: 38)),
    ),
    Message(
      isUser: true,
      content: "Which one should I use for a simple project?",
      sendTime: DateTime.now().subtract(const Duration(minutes: 35)),
    ),
    Message(
      isUser: false,
      content:
          "Provider is great for small projects. Riverpod works better for medium‑to‑large applications.",
      sendTime: DateTime.now().subtract(const Duration(minutes: 33)),
    ),
    Message(
      isUser: true,
      content: "Got it, thanks for your explanation.",
      sendTime: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    Message(
      isUser: false,
      content:
          "You're welcome. Feel free to ask me if you have more questions 😊",
      sendTime: DateTime.now().subtract(const Duration(minutes: 28)),
    ),
  ];
}
