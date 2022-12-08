import 'package:flutter/material.dart';
import 'package:my_portfolio_website/pages/top/components/top_card_blur.dart';
import 'package:my_portfolio_website/responsive.dart';

import 'components/menu.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxHeight: 500, minHeight: 300),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.jpg"),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 18),
        width: 1200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!Responsive.isMobile(context)) BlueCard(size: size),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: Responsive.isMobile(context) ? 400 : 400,
                    maxHeight: Responsive.isMobile(context) ? 300 : 600),
                child: Image.asset("assets/images/me.png"),
              ),
            ),
            /*const Positioned(
              bottom: 0,
              child: Menu(),
            ),*/
          ],
        ),
      ),
    );
  }
}
