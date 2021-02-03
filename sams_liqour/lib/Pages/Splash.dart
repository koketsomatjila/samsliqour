import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'images/samssams.jpg',
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
        color: Colors.deepOrange.withOpacity(0.4),
        colorBlendMode: BlendMode.multiply,
      ),
      Center()
    ]);
  }
}
