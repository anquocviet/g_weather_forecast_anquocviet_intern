import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/daily_weather_view_model.dart';

class DailyWeather extends StatefulWidget {
  const DailyWeather({super.key});

  @override
  State<DailyWeather> createState() => _DailyWeatherState();
}

class _DailyWeatherState extends State<DailyWeather> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _registerEmail(DailyWeatherViewModel dailyWeatherVM) {
    if (_formKey.currentState!.validate()) {
      dailyWeatherVM.sendEmailVerification(_emailController.text, context);
    }
  }

  void _unsubscribeEmail(DailyWeatherViewModel dailyWeatherVM) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Unsubscribed received daily weather')),
    );
    dailyWeatherVM.unSubscribeEmail();
  }

  String? _validateEmail(String? email) {
    if (email == null) return null;
    if (email.isEmpty) return 'Email is required';
    if (RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return null;
    }
    return 'Invalid email';
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dailyWeatherVM = Provider.of<DailyWeatherViewModel>(context);
    final width = MediaQuery.sizeOf(context).width;
    final isTablet = width > 600 && width < 1200;

    return FutureBuilder(
      future: dailyWeatherVM.getEmailRegister(),
      builder: (context, snapshot) {
        _emailController.text = dailyWeatherVM.emailRegister;
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Your email to register daily weather',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                validator: (email) => _validateEmail(email),
                readOnly: dailyWeatherVM.emailRegister.isNotEmpty,
              ),
            ),
            const SizedBox(height: 8),
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              direction: isTablet ? Axis.vertical : Axis.horizontal,
              children: [
                SizedBox(
                  width: isTablet ? double.infinity : 150,
                  child: ElevatedButton(
                    onPressed: dailyWeatherVM.emailRegister.isEmpty
                        ? () => _registerEmail(dailyWeatherVM)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: isTablet ? double.infinity : 150,
                  child: ElevatedButton(
                    onPressed: dailyWeatherVM.emailRegister.isEmpty
                        ? null
                        : () => _unsubscribeEmail(dailyWeatherVM),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Text(
                      'Unsubscribe',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
