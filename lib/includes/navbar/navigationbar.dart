import 'dart:js' as js;
import 'dart:html' as html;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_website/configure/routing.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../configure/centeredview.dart';
import '../../configure/navigation_service.dart';
import 'logo/navbarlogo.dart';

class NavbarItem extends StatefulWidget {
  final String title;
  final String navigationPath;
  final int index;
  const NavbarItem(this.title, this.navigationPath, this.index);

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  bool onHover = false;
  List<bool> clickList = [true, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (p) {
        setState(() {
          onHover = true;
        });
      },
      onExit: (p) {
        setState(() {
          onHover = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          locator<NavigationService>().navigateTo(widget.navigationPath);
          setColorByClicked(widget.index);
        },
        child: Text(
          widget.title,
          style: TextStyle(
              color: onHover
                  ? Colors.blue
                  : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                      ? Colors.white
                      : Colors.grey,
              fontSize: 18),
        ),
      ),
    );
  }

  void setColorByClicked(int index) {
    for (int i = 0; i < clickList.length; i++) {
      setState(() {
        if (i == index) {
          clickList[index] = true;
        } else {
          clickList[i] = false;
        }
      });
    }
    print('response : $clickList');
  }
}

class NavigationBarCustum extends StatelessWidget {
  const NavigationBarCustum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const CenteredViewMob(child: NavbarMob()),
      tablet: const CenteredViewTab(child: NavbarMob()),
      desktop: const CenteredViewDesk(child: NavbarTbDt()),
    );
  }
}

class NavbarTbDt extends StatefulWidget {
  const NavbarTbDt({Key? key}) : super(key: key);

  @override
  State<NavbarTbDt> createState() => _NavbarTbDtState();
}

class _NavbarTbDtState extends State<NavbarTbDt> {
  AdaptiveThemeMode? mode;
  @override
  void initState() {
    _getDefaultTheme();
    super.initState();
  }

  _getDefaultTheme() async {
    setState(() {});
    mode = await AdaptiveTheme.getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () {
                  html.window.location.reload();
                },
                child: NavbarLogo(theme: mode)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const NavbarItem('Accueil', homeRoute, 0),
                const SizedBox(
                  width: 30,
                ),
                const NavbarItem('Nos Domaines', domaineRoute, 1),
                const SizedBox(
                  width: 30,
                ),
                const NavbarItem('Nos Produits', productRoute, 2),
                const SizedBox(
                  width: 30,
                ),
                const NavbarItem('Nos Réalisations', achievementsRoute, 3),
                const SizedBox(
                  width: 30,
                ),
                const NavbarItem('Blogs', blogRoute, 4),
                const SizedBox(
                  width: 30,
                ),
                const NavbarItem('Contact', contactRoute, 5),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () async {
                    if (mode == AdaptiveThemeMode.dark) {
                      AdaptiveTheme.of(context).setLight();
                    } else {
                      AdaptiveTheme.of(context).setDark();
                    }
                    setState(() {});
                    mode = await AdaptiveTheme.getThemeMode();
                  },
                  icon: Icon(
                      mode == AdaptiveThemeMode.dark
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: mode == AdaptiveThemeMode.dark
                          ? Colors.orange
                          : Colors.black,
                      size: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavbarMob extends StatefulWidget {
  const NavbarMob({Key? key}) : super(key: key);

  @override
  State<NavbarMob> createState() => _NavbarMobState();
}

class _NavbarMobState extends State<NavbarMob> {
  AdaptiveThemeMode? mode;
  @override
  void initState() {
    _getDefaultTheme();
    super.initState();
  }

  _getDefaultTheme() async {
    setState(() {});
    mode = await AdaptiveTheme.getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                html.window.location.reload();
              },
              child: NavbarLogo(
                theme: mode,
              )),
          Expanded(
              child: Container(
            width: 100,
          )),
          IconButton(
            alignment: Alignment.topRight,
            onPressed: () async {
              if (mode == AdaptiveThemeMode.dark) {
                AdaptiveTheme.of(context).setLight();
              } else {
                AdaptiveTheme.of(context).setDark();
              }
              setState(() {});
              mode = await AdaptiveTheme.getThemeMode();
            },
            icon: Icon(
                mode == AdaptiveThemeMode.dark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                color: mode == AdaptiveThemeMode.dark
                    ? Colors.orange
                    : Colors.black,
                size: 25),
          ),
          IconButton(
            alignment: Alignment.topRight,
            icon: const Icon(
              FontAwesomeIcons.bars,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}
