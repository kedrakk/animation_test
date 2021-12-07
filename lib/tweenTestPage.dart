import 'package:animation_test/tweenPageTwo.dart';
import 'package:flutter/material.dart';

class TweenTestPage extends StatefulWidget {
  const TweenTestPage({ Key? key }) : super(key: key);

  @override
  _TweenTestPageState createState() => _TweenTestPageState();
}

class _TweenTestPageState extends State<TweenTestPage> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    addAnimation();
  }

  addAnimation(){
    controller =  AnimationController(vsync: this, duration: Duration(seconds: 5),animationBehavior: AnimationBehavior.preserve);
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut,reverseCurve: Curves.bounceIn));
    sizeAnimation = Tween<double>(begin: 100.0, end: 1000).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          decoration: BoxDecoration(shape: BoxShape.circle,color: colorAnimation.value,),
          child: Center(child: ElevatedButton(child: Text("Go"),onPressed: ()=>_gotoBewPage(),),),
        ),
      ),
    );
  }

  _gotoBewPage(){
    addAnimation();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TweenPageTwo()));
  }
}