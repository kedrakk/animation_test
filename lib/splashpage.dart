import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final Duration duration=Duration(seconds: 2);
  double width=10.0;
  double height=10.0;
  late Timer timer;
  int timerVal=0;

  @override
  void initState() {
    updateContainer();
    super.initState();
  }

  updateContainer(){
    timer=Timer.periodic(Duration(seconds: 1), (tt) {
      timerVal++;
      if(timerVal==1){
        setState(() {
          width=MediaQuery.of(context).size.width;
          height=MediaQuery.of(context).size.height;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: duration,
          width: width,
          height: height,
          color: Colors.blue,
          curve: Curves.easeInCirc,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage("https://i.pinimg.com/736x/49/70/8b/49708b3ed324ba2b61600de93aa36c38.jpg"))
              ),
            ),
          ),
        ),
      ),
    );
  }
}