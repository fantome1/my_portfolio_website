import 'package:flutter/material.dart';

const kTextColor = Color(0xFF707070);
const kTextLightColor = Color(0xFF555555);

const kDefaultPadding = 20.0;

final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 50),
  blurRadius: 50,
  color: const Color(0xFF0700B1).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
const kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);

const Color kPrimaryColor = Color(0xFFFFD800);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

class Constants {}

const String myDescription =
    "J'ai obtenu mon diplôme en informatique à l'Université Aube Nouvelle de Ouagadougou en 2021. Je suis dans le développement des applications mobiles et WEB depuis plus de deux(2) ans maintenant. J'ai travaillé des plusieurs structures en équipe et tant qu'individu. J'ai crée des sites web pour plusieurs entreprises et j'ai également travaillé et je travaille sur des projets personnels(majoritairement des applications mobiles) dont j'ai lancé quelques-uns sur PlayStore comme dans AppStore. J'aime toujours apprendre de nouvelles technologies et réussir dans unenvironnement de croissance et d'excellence et gagner un travail qui me procure une satisfaction professionnelle et un développement personnel et m'aide à atteindre des objectifs personnels et organisationnels.";
