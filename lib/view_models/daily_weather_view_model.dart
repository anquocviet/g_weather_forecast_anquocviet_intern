import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_weather_forecast_anquocviet_intern/repositories/firebase_repository.dart';

class DailyWeatherViewModel extends ChangeNotifier {
  final FirebaseRepository _firebaseRepository = FirebaseRepository();

  String _emailRegister = '';

  String get emailRegister => _emailRegister;

  bool get isEmailVerified =>
      FirebaseAuth.instance.currentUser?.emailVerified ?? false;

  Future<void> getEmailRegister() async {
    final instance = FirebaseAuth.instance;
    if (instance.currentUser != null) {
      _emailRegister = instance.currentUser!.email ?? '';
      _emailRegister += instance.currentUser!.emailVerified
          ? ' (verified)'
          : ' (not verified)';
    }
  }

  Future<void> sendEmailVerification(String email, BuildContext context) async {
    try {
      await _firebaseRepository.sendEmailVerification(email);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Check your email to verify')),
        );
      }
    } on Exception {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error sending email verification')),
        );
      }
    }
  }

  Future<void> unSubscribeEmail() async {
    await _firebaseRepository.unSubscribeEmail();
    _emailRegister = '';
    notifyListeners();
  }
}
