import 'package:flutter/material.dart';
import 'package:shopping/models/mode_shopping.dart';

class TitleWidget extends StatelessWidget {
  final ModeShopping shopping;
  const TitleWidget({Key? key, required this.shopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        shopping.name,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
