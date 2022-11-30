import 'package:flutter/material.dart';
import 'package:shopping/models/mode_shopping.dart';

class PriceWidget extends StatelessWidget {
  final ModeShopping shopping;
  const PriceWidget({Key? key, required this.shopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${shopping.price.toString()}",
      style: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}
