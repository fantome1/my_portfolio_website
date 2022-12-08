import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_website/responsive.dart';

import '../constants.dart';

class SectionTitle extends StatelessWidget {
  final String title, subTitle;
  final Color color;
  const SectionTitle(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      constraints: const BoxConstraints(maxWidth: 1110),
      height: 100,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: kDefaultPadding),
            padding:
                EdgeInsets.only(bottom: Responsive.isMobile(context) ? 0 : 72),
            width: 8,
            height: Responsive.isMobile(context) ? 80 : 100,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                subTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w200, color: kTextColor),
              ),
              Text(
                title,
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w900,
                  height: 1.3,
                  fontSize: 35.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
