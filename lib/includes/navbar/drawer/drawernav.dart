import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../navigationbar.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 300,
        child: Column(
          children: <Widget>[
            DrawerItem('Accueil', FontAwesomeIcons.home, "HomeRoute"),
            DrawerItem('Nos Domaines', FontAwesomeIcons.tasks, "SkillsRoute"),
            DrawerItem(
                'Nos Produits', FontAwesomeIcons.productHunt, "EducationRoute"),
            DrawerItem(
                'Nos Réalisations', FontAwesomeIcons.trophy, "ProjectsRoute"),
            DrawerItem('Blogs', FontAwesomeIcons.bloggerB, "BlogRoute"),
            DrawerItem('Contact', FontAwesomeIcons.user, "ContactRoute"),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final String navigationPath;
  const DrawerItem(this.title, this.icon, this.navigationPath);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: MouseRegion(
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
        child: Row(
          children: <Widget>[
            Icon(widget.icon,
                color: onHover
                    ? Colors.blue
                    : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                        ? Colors.white
                        : Colors.grey),
            const SizedBox(
              width: 30,
            ),
            NavbarItem(widget.title, widget.navigationPath, 0),
          ],
        ),
      ),
    );
  }
}
