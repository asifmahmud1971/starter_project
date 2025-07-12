import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/chat/model/chat_model.dart';
import 'package:medPilot/features/patient_portal/chat/view/chat_screen.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final bool isMe = message.isSentByMe ?? false;
    final Color bubbleColor = isMe
        ? AppColors.kPrimaryColor
        : const Color(0xFFFCF4ED);
    final Color textColor = isMe
        ? Colors.white
        : const Color(0xFF5D4037);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Message bubble container
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: _getBorderRadius(isMe),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: isMe
                ? Text(
              message.text ?? "",
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                height: 1.4,
              ),
            )
                : Html(
              data: message.text ?? "",
              style: {
                "body": Style(
                  margin: Margins.zero,
                  padding: HtmlPaddings.zero,
                ),
                "p": Style(
                  fontSize: FontSize(16.0),
                  lineHeight: LineHeight(1.5),
                ),
              },
            ),
          ),

          // Timestamp and status row
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                // Timestamp
                Text(
                  DateFormat('h:mm a').format(message.time ?? DateTime.now()),
                  style: TextStyle(
                    color: AppColors.kPrimaryColor.withOpacity(0.7),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Read status indicator (only for user's messages)
                if (isMe) ...[
                  const SizedBox(width: 6),
                  Icon(
                    message.status == MessageStatus.read
                        ? Icons.done_all
                        : Icons.done,
                    size: 14,
                    color: message.status == MessageStatus.read
                        ? Colors.white
                        : Colors.white.withOpacity(0.7),
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function for bubble border radius
  BorderRadius _getBorderRadius(bool isMe) {
    return BorderRadius.only(
      topLeft: const Radius.circular(20),
      topRight: const Radius.circular(20),
      bottomLeft: Radius.circular(isMe ? 20 : 0),
      bottomRight: Radius.circular(isMe ? 0 : 20),
    );
  }
}