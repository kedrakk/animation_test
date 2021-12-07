import 'dart:async';

import 'package:flutter/material.dart';

class SplashTwoPage extends StatefulWidget {
  const SplashTwoPage({ Key? key }) : super(key: key);

  @override
  _SplashTwoPageState createState() => _SplashTwoPageState();
}

class _SplashTwoPageState extends State<SplashTwoPage> {

  final Duration duration=Duration(seconds: 5);
  double width=100;
  double height=100.0;
  late Timer timer;
  int timerVal=0;
  BoxShape shape=BoxShape.circle;
  bool showChilds=false;

  updateContainer(){
    timer=Timer.periodic(Duration(seconds: 1), (tt) {
      timerVal++;
      if(timerVal==1){
        setState(() {
          shape=BoxShape.rectangle;
          width=MediaQuery.of(context).size.width;
          height=MediaQuery.of(context).size.height;
        });
        Future.delayed(Duration(seconds: 3)).then((value){
          setState(() {
            showChilds=true;
          });
        });
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateContainer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: AnimatedContainer(
              duration: duration,
              width: width,
              height: height,
              curve: Curves.easeInOutBack,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(color: Colors.yellow,shape: shape),
              child: !showChilds?iconWidget():Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                iconWidget(),
                Text("Hello"),
                CircularProgressIndicator()
              ],),
            ),
          ),
        ),
      ),
    );
  }

  Widget iconWidget(){
    return Icon(Icons.timer,color: Colors.white,);
  }

  Widget animatedIcon(){
    return AnimatedContainer(
      duration: duration,
      width: 50,
      height: 50,
      curve: Curves.bounceIn,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: showChilds?Colors.red:Colors.yellow,shape: BoxShape.circle),
      child: Icon(Icons.timer,color: Colors.white,),
    );
  }
}