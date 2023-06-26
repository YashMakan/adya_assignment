import 'dart:async';

import 'package:adya_assignment/models/node.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NonLinearVideoController extends ChangeNotifier {
  ChewieController? value;
  late VideoNode currentVideoNode;
  bool showConversationLayout = false;

  void load(VideoNode node) async {
    currentVideoNode = node;
    showConversationLayout = false;
    notifyListeners();
    final videoPlayerController = VideoPlayerController.network(node.link);
    await videoPlayerController.initialize();
    value?.dispose();
    value = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        // optionsBuilder: (context, defaultOptions) async {
        //   defaultOptions = [...defaultOptions, OptionItem(onTap: (){
        //     // show a bottom sheet and display all timelines
        //     // load();
        //   }, iconData: Icons.list, title: "Timeline")];
        //   await showModalBottomSheet<void>(
        //     context: context,
        //     builder: (ctx) {
        //       return Container(
        //         color: Colors.white,
        //         child: ListView.builder(
        //           shrinkWrap: true,
        //           itemCount: defaultOptions.length,
        //           itemBuilder: (_, i) => ListTile(
        //             title: Text(defaultOptions[i].title),
        //             leading: Icon(defaultOptions[i].iconData),
        //             onTap: () => defaultOptions[i].onTap!(),
        //           ),
        //         ),
        //       );
        //     },
        //   );
        // },
        aspectRatio: 9 / 16);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (value!.videoPlayerController.value.position >=
          value!.videoPlayerController.value.duration) {
        if (node.conversationFlowLayout != null) {
          showConversationLayout = true;
          notifyListeners();
          timer.cancel();
        } else {
          if (node.nextNode != null) {
            load(node.nextNode!);
            timer.cancel();
          }
        }
      } else {
        if (showConversationLayout) {
          showConversationLayout = false;
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }
}
