import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavbarLogo extends StatelessWidget {
  final AdaptiveThemeMode mode;
  const NavbarLogo({Key? key, AdaptiveThemeMode? theme})
      : mode = theme ?? AdaptiveThemeMode.dark,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavbarLogoMob(mode: mode),
      tablet: NavbarLogoMob(mode: mode),
      desktop: NavbarLogoDesk(mode: mode),
    );
  }
}

class NavbarLogoMob extends StatelessWidget {
  final AdaptiveThemeMode mode;
  const NavbarLogoMob({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: 250,
        child: Row(
          children: [
            Image.asset(mode == AdaptiveThemeMode.dark
                ? 'assets/images/logo-black.jpg'
                : 'assets/images/logo-light.jpg'),
            const SizedBox(width: 10),
            const Text(
              'Phoenix Technologie',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontFamily: 'Agustina'),
            ),
          ],
        )
        //Image.asset('assets/images/logo.png'),
        );
  }
}

class NavbarLogoDesk extends StatelessWidget {
  final AdaptiveThemeMode mode;
  const NavbarLogoDesk({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: 500,
        child: Row(
          children: [
            Image.asset(mode == AdaptiveThemeMode.dark
                ? 'assets/images/logo-black.jpg'
                : 'assets/images/logo-light.jpg'),
            const SizedBox(width: 10),
            const Text(
              'Phoenix Technologie',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontFamily: 'Agustina'),
            ),
          ],
        )
        //Image.asset('assets/images/logo.png'),
        );
  }
}
