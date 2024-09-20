// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class KSecurePrefs {
  static const KUserAuthData = "user_auth_data";
  static const KPermissionStatus = "permission_status";
  static const KConsentStatus = "consent_status";
  static const KOnboardingStatus = "onboarding_status";
}

class KError {
  static const UrlLaunchError = "could not launch url";
  static const STORERROR = "internal memory error occured";
}

class KUrls {
  static const KPrivacyPolicy = "https://eazr.app/#/privacyandpolicy";
  static const KTermsOfService = "https://eazr.app/#/termsandcondition";
  static const KHelpAndSupport = "https://eazr.app/#/help";
}

class KDuration {
  static const Duration DelayOnCustomActionButton = Duration(milliseconds: 500);
  static const Duration DelayOnApiCall = Duration(seconds: 5);
  static const Duration ApiHitTimeOut = Duration(seconds: 60);
  static const Duration NavigationDelay = Duration(milliseconds: 100);
  static const Duration AutoFocusDelay = Duration(milliseconds: 1000);
  static const Duration SplashDelay = Duration(milliseconds: 2000);
  static const Duration NavigationDelayOnActionButton =
      Duration(milliseconds: 500);
  static const Duration LoadingDuration = Duration(milliseconds: 2500);

  // static const Duration WelcomeDuration = Duration(milliseconds: 100);
  static const Duration WelcomeDuration = Duration(milliseconds: 0000);
  static const Duration WelcomeDurationNext = Duration(milliseconds: 5000);
  // static const Duration Load = Duration(milliseconds: 21);
}
