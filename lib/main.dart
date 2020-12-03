import 'package:customer_app/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

const String vi = "vi";

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupEasyLoading();
  await initSharedPreferences();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale(vi)],
      path: 'resources/langs',
      fallbackLocale: const Locale(vi),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Bảo dưỡng xe',
      theme: uiTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen(),
      builder: (BuildContext context, Widget child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}

void setupEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = UIColor.white
    ..indicatorColor = UIColor.orange
    ..progressColor = UIColor.orange
    ..userInteractions = false
    ..textColor = UIColor.black_33;
}
