import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../configure/navigation_service.dart';
import '../configure/routing.dart';
import '../includes/navbar/drawer/drawernav.dart';
import '../includes/navbar/navigationbar.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: ((context, sizingInformation) {
      return Scaffold(
        endDrawer: const NavigationDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: Column(
          children: [
            const NavigationBarCustum(),
            Expanded(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: "/",
              ),
            )
          ],
        ),
      );
    }));
  }
}
