import 'dart:math';
import 'package:flutter/material.dart';

class AnimationHome extends StatefulWidget {
  const AnimationHome({super.key});

  @override
  State<AnimationHome> createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome>
    with TickerProviderStateMixin {
  Animation? _arrowAnimation, _heartAnimation;
  AnimationController? _arrowAnimationController, _heartAnimationController;

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();
  }

  @override
  void initState() {
    super.initState();
    //arrow rotation
    _arrowAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController!);

    //beating heart
    _heartAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        parent: _heartAnimationController!, curve: Curves.bounceOut));
  }

//arrow rotaion
  Widget firstChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnimatedBuilder(
            animation: _arrowAnimationController!,
            builder: (context, child) => Transform.rotate(
                  angle: _arrowAnimation!.value,
                  child: const Icon(
                    Icons.expand_more,
                    size: 50.0,
                    color: Colors.black,
                  ),
                )),
        OutlinedButton(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () {
            _arrowAnimationController!.isCompleted
                ? _arrowAnimationController!.reverse()
                : _arrowAnimationController!.forward();
          },
          child: const Text('Start rotating'),
        ),
      ],
    );
  }

//beating heart
  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController!,
            builder: (context, child) {
              return Center(
                child: Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: _heartAnimation!.value,
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                _heartAnimationController!.forward();
              },
              child: const Text(
                'Start Beating Heart Animation',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('See more animations!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          firstChild(),
          const SizedBox(height: 50.0),
          secondChild(),
        ],
      ),
    );
  }
}
