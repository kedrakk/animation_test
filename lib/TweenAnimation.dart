import 'package:flutter/material.dart';

class TweenAnimationWithLogo extends StatefulWidget {
  const TweenAnimationWithLogo({ Key? key }) : super(key: key);

  @override
  _TweenAnimationWithLogoState createState() => _TweenAnimationWithLogoState();
}

class _TweenAnimationWithLogoState extends State<TweenAnimationWithLogo> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  addAnimation(){
    controller =  AnimationController(vsync: this, duration: Duration(seconds: 5),animationBehavior: AnimationBehavior.preserve);
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut,reverseCurve: Curves.bounceIn));
    sizeAnimation = Tween<double>(begin: 70, end: 70).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat();
  }

  @override
  void initState() {
    addAnimation();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeAnimation.value,
      width: sizeAnimation.value,
      decoration: BoxDecoration(shape: BoxShape.circle,color: colorAnimation.value,),
      padding: EdgeInsets.all(10,),
      child: Center(child: Icon(Icons.card_giftcard,color: Colors.white,),),
    );
  }
}