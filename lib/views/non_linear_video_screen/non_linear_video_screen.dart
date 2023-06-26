import 'package:flutter/material.dart';
import 'components/video_player.dart';

class NonLinearVideoScreen extends StatefulWidget {
  const NonLinearVideoScreen({Key? key}) : super(key: key);

  @override
  State<NonLinearVideoScreen> createState() => _NonLinearVideoScreenState();
}

class _NonLinearVideoScreenState extends State<NonLinearVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Material(color: Colors.black, child: VideoPlayer());
  }
}
