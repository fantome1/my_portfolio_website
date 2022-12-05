import 'dart:ui';

import 'package:flutter/material.dart';

class BlueCard extends StatelessWidget {
  final Size size;
  const BlueCard({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints:
              BoxConstraints(maxWidth: 1110, maxHeight: size.height * 0.7),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Issoufou \nSawadogo",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              Text(
                "Développeur Freelance",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
