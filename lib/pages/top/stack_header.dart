import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio_website/provider/home_provider.dart';
import 'package:my_portfolio_website/provider/theme_provider.dart';
import 'package:my_portfolio_website/responsive.dart';
import 'package:my_portfolio_website/routes/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

import '../../models/header_item.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.initial);
              },
              child: RichText(
                  text: const TextSpan(
                children: [
                  TextSpan(
                    text: '< ',
                    style: TextStyle(
                        fontFamily: "Agustina",
                        fontSize: 26,
                        color: Colors.red),
                  ),
                  TextSpan(
                    text: 'Issoufou Sawadogo',
                    style: TextStyle(
                      fontFamily: "Agustina",
                      fontSize: 26,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: ' />',
                    style: TextStyle(
                        fontFamily: "Agustina",
                        fontSize: 26,
                        color: Colors.red),
                  ),
                ],
              ))),
        ),
      );
    });
  }
}

class HeaderRow extends StatelessWidget {
  final Widget themeSwitch;
  const HeaderRow({Key? key, required this.themeSwitch}) : super(key: key);

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: "Qui suis-je",
          onTap: () {
            //print('object');
          },
          iconData: Icons.info,
        ),
        NameOnTap(
          title: "Compétences",
          onTap: () {},
          iconData: Icons.school,
        ),
        NameOnTap(
          title: "Services",
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: "Réalisations",
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: "Contact",
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
        NameOnTap(
          title: "Themes",
          onTap: () {
            //Utilty.openUrl(AppConstants.mediumUrl);
          },
          iconData: Icons.light_mode_outlined,
          isDarkTheme: true,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Consumer(builder: (context, ref, _) {
        return Row(children: [
          ...headerItems
              .map((e) => e.title == "Themes"
                  ? const Text("")
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                            onTap: () {
                              e.onTap();
                              HomeProvider _homeProvider =
                                  ref.read(homeProvider);
                              _homeProvider.scrollBasedOnHeader(e);
                            },
                            child: Text(
                              e.title,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            )),
                      ),
                    ))
              .toList(),
          themeSwitch
        ]);
      }),
    );
  }
}

class StackedHeader extends StatelessWidget {
  final Widget themeSwitch;
  const StackedHeader({Key? key, required this.themeSwitch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: buildMobileHeader(context),
      tablet: buildHeader(context, themeSwitch),
      desktop: buildHeader(context, themeSwitch),
    );
  }

  //Mobile
  Widget buildMobileHeader(context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldkey.currentState?.openEndDrawer();
              },
              child: const Icon(Icons.menu, size: 28.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  //Tablet and Desktop
  Widget buildHeader(context, Widget themeSwitch) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context) ? 24 : 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeaderLogo(),
                HeaderRow(themeSwitch: themeSwitch),
              ],
            )));
  }
}
