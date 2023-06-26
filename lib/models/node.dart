import 'package:adya_assignment/constants/enums.dart';
import 'package:adya_assignment/controllers/non_linear_video_controller/non_linear_video_controller.dart';
import 'package:adya_assignment/models/button.dart';
import 'package:provider/provider.dart';
import 'conversation_flow_layout.dart';

class VideoNode {
  final VideoNode? nextNode;
  final List<VideoNode>? buttonNodes;
  final String link;
  final ConversationFlowLayout? conversationFlowLayout;

  VideoNode(this.link,
      {this.nextNode, this.buttonNodes, this.conversationFlowLayout});

  factory VideoNode.fromJson(Map<String, dynamic> data) {
    List<dynamic> buttons = data["layout"]?["buttons"] ?? [];
    List<dynamic> buttonNodes = data["continuousNodes"] ?? [];
    List<VideoNode> buttonVideoNodes =
        buttonNodes.map((e) => VideoNode.fromJson(e)).toList();
    return VideoNode(data["videoSegment"],
        buttonNodes: buttonVideoNodes,
        nextNode: data["nextNode"] != null
            ? VideoNode.fromJson(data["nextNode"])
            : null,
        conversationFlowLayout: data["layout"] != null
            ? ConversationFlowLayout(
                label: data["layout"]["textField"],
                conversationFlowLayoutOption:
                    data["layout"]["isButtonGrid"] == 1
                        ? ConversationFlowLayoutOptions.buttonGrid
                        : ConversationFlowLayoutOptions.textField,
                onFlowCompleted: (value, context) {
                  print(
                      "Use API:${data["layout"]?["apiPath"]}, to upload using $value");
                  final controller = Provider.of<NonLinearVideoController>(
                      context,
                      listen: false);
                  if (value.runtimeType == int) {
                    controller.load(buttonVideoNodes.elementAt(value));
                  } else {
                    if (controller.currentVideoNode.nextNode != null) {
                      controller.load(controller.currentVideoNode.nextNode!);
                    } else {
                      print("All Nodes are done!");
                    }
                  }
                },
                buttons: buttons.map((e) => Button.fromJson(e)).toList())
            : null);
  }

  static VideoNode decode(Map<String, dynamic> value) {
    return VideoNode.fromJson(value["flow"]);
  }
}
