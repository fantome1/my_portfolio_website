import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/header_item.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());

class HomeProvider extends ChangeNotifier {
  final contactKey = GlobalKey();
  final achievedKey = GlobalKey();
  final serviceKey = GlobalKey();
  final skillKey = GlobalKey();
  final aboutKey = GlobalKey();
  final homeKey = GlobalKey();

  Future<void> scrollToContact() async {
    final context = contactKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToAchievement() async {
    final context = achievedKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToService() async {
    final context = serviceKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToSkill() async {
    final context = skillKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToAbout() async {
    final context = aboutKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToHome() async {
    final context = homeKey.currentContext;
    await _scroll(context);
  }

  Future _scroll(context) async {
    if (context != null) {
      await Scrollable.ensureVisible(context,
          duration: const Duration(seconds: 1), curve: Curves.linear);
    }
  }

  scrollBasedOnHeader(NameOnTap nameOnTap) {
    switch (nameOnTap.title) {
      case 'Contact':
        return scrollToContact();
      case 'Qui suis-je':
        return scrollToAbout();
      case 'Compétences':
        return scrollToSkill();
      case 'Services':
        return scrollToService();
      case 'Réalisations':
        return scrollToAchievement();
      default:
        return scrollToHome();
    }
  }
}
