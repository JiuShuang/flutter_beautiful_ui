class Message{
  final bool isUser;
  final String content;
  final DateTime sendTime;

  Message({
    required this.isUser,
    required this.content,
    required this.sendTime
  });
  
}