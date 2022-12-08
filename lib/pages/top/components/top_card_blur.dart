import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio_website/responsive.dart';

class BlueCard extends StatelessWidget {
  final Size size;
  const BlueCard({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: buildMobile(),
        tablet: buildBlur(context),
        desktop: buildBlur(context));
  }

  Widget buildBlur(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          constraints: BoxConstraints(
              maxWidth: Responsive.isDesktop(context) ? 1110 : 800,
              maxHeight: Responsive.isDesktop(context)
                  ? size.height * 0.7
                  : size.height * 0.4),
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

  Widget buildMobile() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          constraints:
              BoxConstraints(maxWidth: 300, maxHeight: size.height * 0.3),
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
                          fontSize: 20,
                          fontFamily: "Agustina")),
                  Text(
                    "Issoufou",
                    style: TextStyle(
                      fontSize: 20,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                      fontFamily: "Agustina",
                    ),
                  ),
                  Text('/>',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
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
