import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:habit_app/app/pages/introduction/introduction_controller.dart';
import 'package:habit_app/app/pages/introduction/introduction_page.dart';
import 'package:habit_app/app/pages/login/login_controller.dart';
import 'package:provider/provider.dart';

import 'app/pages/reset_password/reset_password_controller.dart';
import 'app/pages/sign_up/sign_up_controller.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<IntroductionController>(create: (context) {
          return IntroductionController();
        }),
        ChangeNotifierProvider<LoginController>(create: (context) {
          return LoginController();
        }),
        ChangeNotifierProvider<SignUpController>(create: (context) {
          return SignUpController();
        }),
        ChangeNotifierProvider<ResetPasswordController>(create: (context) {
          return ResetPasswordController();
        })
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}
