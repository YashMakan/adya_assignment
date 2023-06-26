import 'package:adya_assignment/controllers/non_linear_video_controller/non_linear_video_controller.dart';
import 'package:adya_assignment/views/non_linear_video_screen/non_linear_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NonLinearVideoController>(
            create: (_) => NonLinearVideoController()),
      ],
      child: MaterialApp(
        title: 'Adya Care Assignment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NonLinearVideoScreen(),
      ),
    );
  }
}
