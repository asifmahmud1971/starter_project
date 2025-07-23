import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/chat/cubit/chat_cubit.dart';
import 'package:medPilot/features/patient_portal/chat/model/chat_model.dart';
import 'package:medPilot/features/patient_portal/chat/widget/app_bar.dart';
import 'package:medPilot/features/patient_portal/chat/widget/message_bubble.dart';

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
          appBar: MedPilotAppBar(),
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
                      child: MessageBubble(message: Message(
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
                  return MessageBubble(
                     message:  state.messages?[index] ?? Message());
                },
              )
            : SizedBox();
      },
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
