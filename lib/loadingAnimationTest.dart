import 'package:animation_test/TweenAnimation.dart';
import 'package:flutter/material.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loading Animation"),),
      body: Center(
        child: TweenAnimationWithLogo(),
      ),
    );
  }
}