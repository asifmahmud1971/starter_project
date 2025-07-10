import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_preference.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/chat/model/chat_model.dart';
import 'package:medPilot/features/patient_portal/chat/repository/chat_repository.dart';
import 'package:medPilot/features/patient_portal/home/model/blog_model.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/model/staff_permission_model.dart';
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart';

import '../../../../core/app/app_dependency.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepository) : super(const ChatState());

  final ChatRepository chatRepository;
  final _appPreferences = instance.get<AppPreferences>();

  Future<void> getChat(String? text) async {

    state.messages?.insert(0,Message(text: text??"", time: DateTime.now(), isSentByMe: true));
    emit(state.copyWith(appStatus: AppStatus.loading,messages: state.messages));

    try {
      final response = await chatRepository.getChat({
        "text":text
      });

      response.fold(
        (failure) {

          state.messages?.insert(0,Message(text: failure.message, time: DateTime.now(), isSentByMe: false));

          emit(state.copyWith(
              appStatus: AppStatus.success, messages: state.messages));

        },
        (data) async {

          state.messages?.insert(0,Message(text: data["output"], time: DateTime.now(), isSentByMe: false));

          emit(state.copyWith(
              appStatus: AppStatus.success, messages: state.messages));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }
}
