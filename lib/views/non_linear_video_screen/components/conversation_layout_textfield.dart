import 'package:adya_assignment/controllers/non_linear_video_controller/non_linear_video_controller.dart';
import 'package:adya_assignment/models/conversation_flow_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationLayoutTextField extends StatelessWidget {
  const ConversationLayoutTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NonLinearVideoController>(context);
    ConversationFlowLayout layout =
        controller.currentVideoNode.conversationFlowLayout!;
    return Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            onSubmitted: (value) {
              layout.onFlowCompleted!(value, context);
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: layout.label,
            ),
            // controller: controller,
          ),
        ));
  }
}
