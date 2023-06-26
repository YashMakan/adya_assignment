import 'package:adya_assignment/controllers/non_linear_video_controller/non_linear_video_controller.dart';
import 'package:adya_assignment/models/conversation_flow_layout.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';

class ConversationLayoutButtonGrid extends StatelessWidget {
  const ConversationLayoutButtonGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NonLinearVideoController>(context);
    ConversationFlowLayout layout =
        controller.currentVideoNode.conversationFlowLayout!;
    return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Pick An Option!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 8,),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: layout.buttons
                    .map((e) => InkWell(
                          onTap: () {
                            layout.onFlowCompleted!(e.index, context);
                          },
                          child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Text(e.text))
                              .asGlass(
                            clipBorderRadius: BorderRadius.circular(6),
                          ),
                        ))
                    .toList(),
              ),
            ).asGlass(),
          ],
        ));
  }
}
