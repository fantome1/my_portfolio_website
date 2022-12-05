import 'package:flutter/material.dart';

const String base = "https://lfcpts-api-v1.laafi-concepts.com/api_v1.0/";
const String base2 = "https://lfcpts-api-v1.laafi-concepts.com/api/";

//Routes
const String rootRouteName = "root";
const String loginRouteName = "login";
const String forgortPasswordRouteName = "forgot-password";
const String homeRouteName = "home";
const String searchRouteName = "search";

const String infrastructureRouteName = "infrastructures";
const String infDetailsRouteName = "infrastructure-details";
const String infAddRouteName = "create-infrastructure";
const String infEditRouteName = "edit";
const String infEnrollmentRouteName = "enroll";
const String createInfRouteName = "create";
const String detailsInfoRouteName = "details-infrastructure";

const String usersRouteName = "users";
const String userDetailsRouteName = "details-user";
const String userAddRouteName = "add-user";
const String userEditRouteName = "edit-user";
const String userEnrollmentRouteName = "enroll-users";
const String userGuestRouteName = "guest-users";

const String devicesRouteName = "devices";
const String deviceDetailsRouteName = "device-details";
const String deviceAddRouteName = "device-add";
const String deviceGroupRouteName = "device-group";

const String activitiesRouteName = "activities";
const String activityDetailsRouteName = "activity-details";
const String activityAddRouteName = "activity-add";
const String activityEditRouteName = "activity-edit";

const String notificationsRouteName = "notifications";
const String discussionRouteName = "discussions";
const String settingsRouteName = "settings";
const String helpRouteName = "help";

//Preferences key
const String loggedInKey = "LoggedIn";
const String organizationKey = "Organization";
const String userKey = "User";

//userLogged key
const String firstnameKey = "firstname";
const String lastnameKey = "lastname";
const String emailKey = "email";
const String passwordKey = "password";
const String roleKey = "role";
const String orgaIdKey = "organization-id";
const String orgaNameKey = "organization-name";
const String orgaUrlKey = "organization-url";
const String infrastIdKey = "infrastructure-id";
const String tokenKey = "token";
const String expiredTokenKey = "expired-token";

const kTextColor = Color(0xFF707070);
const kTextLightColor = Color(0xFF555555);

const kDefaultPadding = 20.0;

final kDefaultShadow = BoxShadow(
  offset: Offset(0, 50),
  blurRadius: 50,
  color: Color(0xFF0700B1).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
final kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

final kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);
