import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio_website/pages/bodies/about/about_me.dart';
import 'package:my_portfolio_website/pages/top/stack_header.dart';
import 'package:my_portfolio_website/pages/top/top_section.dart';
import 'package:my_portfolio_website/provider/home_provider.dart';
import 'package:my_portfolio_website/responsive.dart';

import '../custom_switch.dart';
import '../provider/theme_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeProvider _homeProvider;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _homeProvider = ref.read(homeProvider);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        key: Globals.scaffoldkey,
        endDrawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (notif) {
                  print('response : ${notif.scrollDelta}');
                  return true;
                },
                child: ListView.separated(
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          if (Globals.scaffoldkey.currentState != null) {
                            if (Globals
                                .scaffoldkey.currentState!.isEndDrawerOpen) {
                              Navigator.pop(context);
                              _homeProvider.scrollBasedOnHeader(
                                  HeaderRow.headerItems[index]);
                            }
                          }
                        },
                        leading: Icon(HeaderRow.headerItems[index].iconData),
                        title: Text(HeaderRow.headerItems[index].title,
                            style: const TextStyle()),
                        trailing: HeaderRow.headerItems[index].isDarkTheme !=
                                null
                            ? HeaderRow.headerItems[index].isDarkTheme!
                                ? SizedBox(
                                    width: 50,
                                    child: CustomSwitch(
                                        value:
                                            ref.read(themeProvider).isDarkMode,
                                        onChanged: (val) {
                                          ref
                                              .read(themeProvider)
                                              .changeTheme(val);
                                          ThemeSwitcher.of(context).changeTheme(
                                              theme: ref
                                                  .read(themeProvider)
                                                  .getCurrentTheme,
                                              isReversed: false);
                                        }),
                                  )
                                : null
                            : null,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10.0);
                    },
                    itemCount: 5),
              ),
            ),
          ),
        ),
        body: _buildPage(),
      ),
    );
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Responsive.isDesktop(context) ? 80 : 20),
                  const TopSection(),
                  AboutMe(key: _homeProvider.aboutKey),
                  Container(
                      key: _homeProvider.skillKey,
                      color: Colors.yellow,
                      height: 300),
                  Container(
                      key: _homeProvider.serviceKey,
                      color: Colors.green,
                      height: 500),
                ],
              ),
            )),
        StackedHeader(
          themeSwitch: ThemeSwitcher(
              clipper: const ThemeSwitcherBoxClipper(),
              builder: (context) {
                return CustomSwitch(
                    value: ref.watch(themeProvider).isDarkMode,
                    onChanged: (onChanged) {
                      ref.read(themeProvider).changeTheme(onChanged);
                      ThemeSwitcher.of(context).changeTheme(
                          theme: ref.read(themeProvider).getCurrentTheme,
                          isReversed: false // default: false
                          );
                    });
              }),
        ),
      ],
    );
  }
}


/*
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: const [
          TopSection(),
        ],
      )),
    );
  }
}
*/