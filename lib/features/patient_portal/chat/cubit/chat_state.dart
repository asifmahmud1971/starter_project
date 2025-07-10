part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final AppStatus appStatus;
  final List<Message>? messages;

  const ChatState(  {
    this.appStatus = AppStatus.initial,
    this.messages,
  });

  ChatState copyWith({
    final AppStatus? appStatus,
    final DashboardPermission? dashboardPermission,
    final StaffPermissionModel? staffPermissionModel,
    final BlogModel? blogModel,
    final PrescriptionModel? prescriptionModel,
    final List<Message>? messages
  }) {
    return ChatState(
      appStatus: appStatus ?? this.appStatus,
      messages: messages??this.messages
    );
  }

  @override
  List<Object> get props =>
      [appStatus,messages??[]];
}
