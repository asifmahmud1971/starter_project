import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/chat/cubit/chat_cubit.dart';
import 'package:medPilot/features/patient_portal/chat/model/chat_model.dart';

class PalliativeChatScreen extends StatefulWidget {
  const PalliativeChatScreen({super.key});

  @override
  State<PalliativeChatScreen> createState() => _PalliativeChatScreenState();
}

enum MessageStatus { sent, delivered, read }

class _PalliativeChatScreenState extends State<PalliativeChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    context.read<ChatCubit>().getChat(_messageController.text);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF8F9FD),
                  Color(0xFFFCF4ED), // Light peach to complement orange
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildMessageList()),
                Visibility(
                    visible: state.appStatus == AppStatus.loading,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: _buildMessageBubble(Message(
                          text: "Processing..",
                          time: DateTime.now(),
                          isSentByMe: false)),
                    )),
                _buildMessageInput(),
              ],
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor.withOpacity(0.15),
      elevation: 0,
      /*leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: AppColors.kPrimaryColor),
        onPressed: () {},
      ),*/
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kPrimaryColor.withOpacity(0.2),
            child: Icon(Icons.medication, color: AppColors.kPrimaryColor),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Emily Chen",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Palliative Care Specialist",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Compassionate Care • Dignity • Comfort",
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return (state.messages ?? []).isNotEmpty
            ? ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                reverse: true,
                itemCount: state.messages?.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(
                      state.messages?[index] ?? Message());
                },
              )
            : SizedBox();
      },
    );
  }

  Widget _buildMessageBubble(Message message) {
    final isMe = message.isSentByMe;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment:
            isMe ?? false ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isMe ?? false
                    ? AppColors.kPrimaryColor
                    : const Color(0xFFFCF4ED),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(isMe ?? false ? 20 : 0),
                  bottomRight: Radius.circular(isMe ?? false ? 0 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: message.isSentByMe ?? false
                  ? Text(
                      message.text ?? "",
                      style: TextStyle(
                        color: isMe ?? false
                            ? Colors.white
                            : const Color(0xFF5D4037),
                        fontSize: 15,
                        height: 1.4,
                      ),
                    )
                  : Html(
                      data: message.text ?? "",
                      style: {
                        // Global styles can be applied here
                        "body": Style(
                          margin: Margins.zero,
                          padding: HtmlPaddings.zero,
                        ),
                        "p": Style(
                          fontSize: FontSize(16.0),
                          lineHeight: LineHeight(1.5),
                        ),
                      },
                    )),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: isMe ?? false
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat('h:mm a').format(message.time ?? DateTime.now()),
                  style: TextStyle(
                    color: AppColors.kPrimaryColor.withOpacity(0.7),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (isMe ?? false) ...[
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

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            /* IconButton(
              icon: Icon(Icons.photo, color: AppColors.kPrimaryColor, size: 28),
              onPressed: () {},
            ),*/
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: AppColors.kPrimaryColor.withOpacity(0.5)),
                        ),
                        minLines: 1,
                        maxLines: 3,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.emoji_emotions_outlined,
                          color: AppColors.kPrimaryColor),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kPrimaryColor.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: _sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
