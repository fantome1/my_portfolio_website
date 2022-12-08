import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_website/includes/section_title.dart';
import 'package:my_portfolio_website/responsive.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../constants.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildUi(getMobileMaxWidth(context)),
        ),
        tablet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildUi(kTabletMaxWidth),
        ),
        desktop: _buildUi(kDesktopMaxWidth));
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Flex(
            direction:
                constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
            children: [
              Expanded(
                flex: constraints.maxWidth > 720 ? 1 : 0,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const SectionTitle(
                        title: "Qui suis-je", subTitle: "", color: Colors.red),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Je m'appelle Issoufou Sawadogo, Développeur Flutter et Formateur",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        fontSize: 24.0,
                      ),
                    ),
                    const Text(
                      "I have done my Computer Science graduation at Xavier's Institute of Engineering on 2021. I have been developing Mobile Apps for more than 1 years now. I have worked as a Team and as an Indivual in various organization and launched the apps in Playstore as well as in Appstore. In my free time I use to write Technical Blog in Medium. Always love to learn new technologies and to succeed in an environment of growth and excellence and earn a job which provides me job satisfaction and self-development and help me achieve personal as well as organisational goals.",
                      style: TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Technology I have worked with",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: Container(
                    color: Colors.red,
                    height: 400,
                    width: constraints.maxWidth > 720.0 ? null : 350.0,
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
