import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/splash/splash_screen_model.dart';
import 'package:flutter/material.dart';

class SplashScreen extends BaseView<SplashScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Material(
          child: Hero(
            tag: "ic_logo",
            child: Assets.resources.images.icLogo.image(width: 200, height: 200),
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
