import 'package:medPilot/features/patient_portal/chat/view/chat_screen.dart';

class Message {
  final String text;
  final DateTime time;
  final bool isSentByMe;
  final MessageStatus status;

  Message({
    required this.text,
    required this.time,
    required this.isSentByMe,
    this.status = MessageStatus.sent,
  });
}