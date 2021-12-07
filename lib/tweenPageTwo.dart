import 'package:animation_test/main.dart';
import 'package:flutter/material.dart';

class TweenPageTwo extends StatefulWidget {
  const TweenPageTwo({ Key? key }) : super(key: key);

  @override
  _TweenPageTwoState createState() => _TweenPageTwoState();
}

class _TweenPageTwoState extends State<TweenPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hello"),),
    );
  }
}