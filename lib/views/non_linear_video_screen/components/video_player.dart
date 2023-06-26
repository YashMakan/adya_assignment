import 'package:adya_assignment/constants/enums.dart';
import 'package:adya_assignment/constants/mock_response.dart';
import 'package:adya_assignment/controllers/non_linear_video_controller/non_linear_video_controller.dart';
import 'package:adya_assignment/models/node.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'conversation_layout_button_grid.dart';
import 'conversation_layout_textfield.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  NonLinearVideoController get controller =>
      Provider.of<NonLinearVideoController>(context, listen: false);

  bool get isTheCurrentLayoutButtonGrid =>
      controller.currentVideoNode.conversationFlowLayout
          ?.conversationFlowLayoutOption ==
      ConversationFlowLayoutOptions.buttonGrid;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.load(VideoNode.decode(MockResponse.value));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NonLinearVideoController>(builder: (context, _, child) {
      return controller.value != null
          ? Stack(
              children: [
                IgnorePointer(
                  ignoring: controller.showConversationLayout,
                  child: Chewie(
                    controller: controller.value!,
                  ),
                ),
                if (controller.showConversationLayout) ...[
                  if (isTheCurrentLayoutButtonGrid)
                    const ConversationLayoutButtonGrid()
                  else
                    const ConversationLayoutTextField()
                ]
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
