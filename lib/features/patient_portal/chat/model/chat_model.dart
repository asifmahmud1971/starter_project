import 'package:medPilot/features/patient_portal/chat/view/chat_screen.dart';

class Message {
  final String? text;
  final DateTime? time;
  final bool? isSentByMe;
  final MessageStatus? status;
  final String? userImageUrl;
  final String? userName;

  Message( {
     this.text,
     this.time,
     this.isSentByMe,
    this.status = MessageStatus.sent,
    this.userImageUrl,
    this.userName,
  });
}