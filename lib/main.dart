import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? text;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(4),
                color: Colors.lightGreen,
                child: NumberWidget(text: text))),
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  final bool hasHighlight;
  final Color color;
  final String? text;
  const NumberWidget(
      {Key? key,
      this.hasHighlight = false,
      this.color = Colors.lightGreen,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 5)),
      builder: (c, s) => s.connectionState == ConnectionState.done
          ? Image.asset(
              "assets/images/no_data_found.jpg",
              scale: 4,
            )
          : LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 50,
            ),
    );
  }
}
