import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var isEnabled = false;
  final animationDuration = const Duration(milliseconds: 500);

  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [
    "Qui suis-je",
    "Mes Compétences",
    "Mes Services",
    "Mes Réalisations",
    "Contacter Moi"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1000),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                menuItems.length,
                (index) => buildMenuItem(index),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                isEnabled = !isEnabled;
              });
              if (!isEnabled) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
            },
            child: AnimatedContainer(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: !isEnabled
                    ? const Color(0xff565671)
                    : const Color(0xff989fd5),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              duration: animationDuration,
              child: AnimatedAlign(
                alignment:
                    isEnabled ? Alignment.centerRight : Alignment.centerLeft,
                duration: animationDuration,
                child: Row(
                  mainAxisAlignment: isEnabled
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (isEnabled) Text('Light'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (!isEnabled) Text('Dark'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenuItem(int index) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
        child: Container(
          constraints: const BoxConstraints(minWidth: 122),
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                menuItems[index],
                style: const TextStyle(fontSize: 20, color: kTextColor),
              ),
              // Hover
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom:
                    selectedIndex != index && hoverIndex == index ? -16 : -40,
                child: Image.asset("assets/images/Hover.png",
                    color: Color.fromARGB(255, 41, 133, 176)),
              ),
              // Select
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: selectedIndex == index ? -16 : -40,
                child: Image.asset("assets/images/Hover.png",
                    color: Color.fromARGB(255, 41, 133, 176)),
              ),
            ],
          ),
        ),
      );
}
