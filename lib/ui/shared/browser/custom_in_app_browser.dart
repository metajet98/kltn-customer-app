import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class CustomInAppBrowser {
  static void openUrl({String url}) {
    FlutterWebBrowser.openWebPage(
      url: url,
      customTabsOptions: const CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        toolbarColor: Colors.blueAccent,
        secondaryToolbarColor: Colors.blueAccent,
        navigationBarColor: Colors.blueAccent,
        addDefaultShareMenuItem: true,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: const SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: Colors.white,
        preferredControlTintColor: Colors.lightBlue,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
        modalPresentationCapturesStatusBarAppearance: true,
        entersReaderIfAvailable: true
      ),
    );
  }
}