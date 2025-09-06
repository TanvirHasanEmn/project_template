import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'core/binding/binding.dart';
import 'core/helper/shared_prefarenses_helper.dart';

Future<void> main() async {//* change it to async
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized(); //*firebase
  await Firebase.initializeApp();//*firbase

  // Stripe.publishableKey = "${dotenv.env["stripePublishableKey"]}";



    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await SharedPreferencesHelper().init();
  AppBinding().dependencies();

  runApp(const MyApp());
}
