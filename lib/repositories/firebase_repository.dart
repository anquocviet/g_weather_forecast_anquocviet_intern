import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  final acs = ActionCodeSettings(
      url: 'https://g-weather-forecast-fb647.web.app',
      dynamicLinkDomain: 'anquocviet.page.link',
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'asia.goldenowl.g_weather_forecast_anquocviet_intern',
      androidInstallApp: true,
      androidMinimumVersion: '12');

  Future<void> sendEmailVerification(String email) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: email)
        .then((value) {
      value.user?.sendEmailVerification(acs).catchError((error) {
        log('Error sending email verification: $error');
        throw error;
      });
    }).catchError((error) {
      log('Error sending email verification: $error');
      throw error;
    });
  }

  Future<bool> verifyEmail() async {
    final emailVerified = FirebaseAuth.instance.currentUser?.emailVerified;
    return emailVerified ?? false;
  }

  Future<void> unSubscribeEmail() async {
    FirebaseAuth.instance.currentUser?.reload();
    FirebaseAuth.instance.currentUser?.delete().catchError((error) {
      log('Error unsubscribing email: $error');
    });
  }
}
