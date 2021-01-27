import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/register/register_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends BaseView<RegisterScreenModel> {
  final _phoneInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  final _fullNameInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueAccent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Container(
            height: Get.height * 5 / 6,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 48),
                  child: Material(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Đăng kí tài khoản",
                            style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 32),
                          TextField(
                            controller: _fullNameInputController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Họ và tên",
                              border: new OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                              ),
                              hintText: "Nhập họ và tên",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _phoneInputController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                labelText: "Số điện thoại",
                                border: new OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                ),
                                hintText: "Nhập số điện thoại",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _passwordInputController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              hintText: "Nhập mật khẩu",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                              border: new OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () =>
                              viewModel.onRegister(_fullNameInputController.text, _phoneInputController.text, _passwordInputController.text),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                              child: Text(
                                "Đăng kí",
                                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                              )),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Material(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Colors.white,
                    child: ClipRRect(
                      child: Container(
                        width: 96,
                        height: 96,
                        child: Hero(
                          tag: "ic_logo",
                          child: Assets.resources.images.icLogo.image(fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
