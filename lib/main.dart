import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'core/binding/binding.dart';
import 'core/helper/shared_prefarenses_helper.dart';

Future<void> main() async {
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = "${dotenv.env["stripePublishableKey"]}";

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await SharedPreferencesHelper().init();
  AppBinding().dependencies();

  runApp(const MyApp());
}
