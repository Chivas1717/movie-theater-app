import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_theater_app/models/session_model.dart';

class SeatWidget extends StatefulWidget {
  final Seat seat;
  final color;

  const SeatWidget({
    super.key,
    required this.seat,
    required this.color,
  });

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bounceAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInQuad,
      ),
    );
    return Column(
      children: [
        Listener(
          onPointerUp: (PointerUpEvent event) {
            _controller.reverse();
          },
          onPointerDown: (event) {
            _controller.forward();
          },
          child: AnimatedBuilder(
            animation: bounceAnimation,
            builder: (ctx, child) => Transform.scale(
              scale: bounceAnimation.value,
              child: child,
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
