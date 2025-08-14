import 'package:flutter/material.dart';
import 'dart:math' show Random;


class AnimatedScreen extends StatefulWidget {
  static const name='animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  
  double width=50;
  double height=50;
  Color color=Colors.indigo;
  double borderRadius=10.0;

  void changeShape(){
    final random=Random();

    setState(() {
      width=random.nextInt(300)+50;
      height=random.nextInt(200)+60;
      borderRadius=random.nextInt(105)+5;
      color=Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), random.nextDouble());
    },
    
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desde animated'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeOutCubic,
          width: width <= 0 ? 10 : width,
          height: height <= 0 ? 10 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 10 : borderRadius)
          ),
        ),
      ),
      
    );
  }
}