import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/cubit/rehab_pall_cubit.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/model/rehab_pall_video_response.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final RehabilitativePallVideo?  rehabPallVideo;
  const VideoPlayer({super.key,this.rehabPallVideo});
  @override
  State createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  final rehabCubit = GetContext.context.read<RehabPallCubit>();

  @override
  void initState() {
    super.initState();
    String videoId = "${extractYouTubeVideoId(widget.rehabPallVideo!.videoLink.toString())}"; // Example video ID
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
      ),
    );
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }
  String? extractYouTubeVideoId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;
    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
    }
    if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'];
    }
    return null;
  }
  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.rehabPallVideo?.videoTitle??"",maxLines: 1,overflow: TextOverflow.ellipsis)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              onReady: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}