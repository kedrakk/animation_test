import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieTestPage extends StatefulWidget {
  const LottieTestPage({ Key? key }) : super(key: key);

  @override
  _LottieTestPageState createState() => _LottieTestPageState();
}

class _LottieTestPageState extends State<LottieTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Lottie.asset("assets/test_animation.json"),
      ),
    );
  }
}