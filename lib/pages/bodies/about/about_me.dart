import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_website/includes/section_title.dart';
import 'package:my_portfolio_website/provider/theme_provider.dart';
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
                      myDescription,
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
                const SizedBox(width: 100),
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: Image.asset(
                    'assets/images/logo-light.jpg',
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
