import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'centeredview.dart';

const String domaineRoute = 'skills';
const String productRoute = 'projects';
const String achievementsRoute = 'achievements';
const String contactRoute = 'contact';
const String blogRoute = 'blogs';
const String homeRoute = 'Home';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(Container(color: Colors.red), settings.name!);
    case domaineRoute:
      return _getPageRoute(
          ScreenTypeLayout(
            desktop: CenteredViewDesk(child: Container(color: Colors.blue)),
            tablet: CenteredViewTab(child: Container(color: Colors.blue)),
            mobile: CenteredViewMob(child: Container(color: Colors.blue)),
          ),
          settings.name!);
    case productRoute:
      return _getPageRoute(
          ScreenTypeLayout(
            desktop: CenteredViewDesk(child: Container(color: Colors.red)),
            tablet: CenteredViewTab(child: Container(color: Colors.red)),
            mobile: CenteredViewMob(child: Container(color: Colors.red)),
          ),
          settings.name!);
    case achievementsRoute:
      return _getPageRoute(
          ScreenTypeLayout(
            desktop: CenteredViewDesk(child: Container(color: Colors.grey)),
            tablet: CenteredViewTab(child: Container(color: Colors.grey)),
            mobile: CenteredViewMob(child: Container(color: Colors.grey)),
          ),
          settings.name!);
    case contactRoute:
      return _getPageRoute(
          ScreenTypeLayout(
            desktop: CenteredViewDesk(child: Container(color: Colors.white)),
            tablet: CenteredViewTab(child: Container(color: Colors.white)),
            mobile: CenteredViewMob(child: Container(color: Colors.white)),
          ),
          settings.name!);
    case blogRoute:
      return _getPageRoute(
          ScreenTypeLayout(
            desktop: CenteredViewDesk(child: Container(color: Colors.yellow)),
            tablet: CenteredViewTab(child: Container(color: Colors.yellow)),
            mobile: CenteredViewMob(child: Container(color: Colors.yellow)),
          ),
          settings.name!);
    default:
      return _getPageRoute(Container(color: Colors.red), settings.name!);
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            settings: RouteSettings(name: routeName),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}
