import 'package:flutter/material.dart';
import 'package:shopping/models/mode_shopping.dart';

class CircularTens extends StatelessWidget {
  const CircularTens({
    Key? key,
    required this.model,
    required this.size,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final ModeShopping model;
  final double size;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: Padding(
        padding: padding,
        child: ClipOval(
          child: Image.asset(
            model.image,
            height: size,
            scale: 1,
          ),
        ),
      ),
    );
  }
}
