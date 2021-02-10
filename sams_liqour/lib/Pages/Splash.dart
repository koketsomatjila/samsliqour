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
        color: Colors.black.withOpacity(0.7),
        colorBlendMode: BlendMode.luminosity,
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Image.asset(
            'images/sams logo.jpg',
          ),
        ),
      )
    ]);
  }
}
