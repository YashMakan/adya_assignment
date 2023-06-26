import 'package:adya_assignment/constants/enums.dart';
import 'package:adya_assignment/models/button.dart';
import 'package:flutter/material.dart';

class ConversationFlowLayout {
  final ConversationFlowLayoutOptions conversationFlowLayoutOption;
  final Function(dynamic, BuildContext)? onFlowCompleted;
  final List<Button> buttons;
  final String? label;

  ConversationFlowLayout(
      {required this.conversationFlowLayoutOption,
      this.onFlowCompleted,
      this.label,
      required this.buttons});
}
