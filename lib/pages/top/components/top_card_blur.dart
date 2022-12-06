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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          constraints:
              BoxConstraints(maxWidth: 1110, maxHeight: size.height * 0.7),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text('<',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 80,
                          fontFamily: "Agustina")),
                  Text(
                    "Issoufou",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                      fontFamily: "Agustina",
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    "Sawadogo",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                      fontFamily: "Agustina",
                    ),
                  ),
                  Text('/>',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 80,
                          fontFamily: "Agustina")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
