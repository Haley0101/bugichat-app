import 'dart:convert';

import 'package:bugichat/common/config/config.dart';
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/common/util/auth_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  AuthController authController = AuthController();
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController password = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  // loginButtonClick() async {
  //   String? errorResult = await authController.signIn(email.text, password.text);
  //   if (errorResult != null) {
  //     Get.snackbar("로그인 실패", errorResult);
  //   } else {
  //     final prefs = await SharedPreferences.getInstance();D/InputMethodManager(26201): prepareNavigationBarInfo() DecorView@d643ac8[MainActivity]
  //     prefs.setString('email', email.text);
  //     prefs.setString('password', password.text);
  //     Get.offAllNamed("/main");
  //     Get.snackbar("로그인 성공", "");
  //   }
  // }

  loginButtonClick() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${Config().globalIp}/api/sign-in'));
    request.body = json.encode({
      "userId": email.text,
      "userPw": password.text
    });
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      // debugPrint(result['accessToken'].toString());
      // debugPrint(result['refreshToken'].toString());

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', result['userId']);
      // prefs.setString('userLang', result['userSetLang']);
      Get.offAllNamed("/main");
      Get.snackbar("로그인 성공", "");
    } else {
      final result = response.body;
      Get.snackbar("로그인 실패", "로그인에 실패했습니다.");
    }
  }
}

void showDefaultDialog(BuildContext context) {
  Get.bottomSheet(Container(
    height: 190.h,
    color: Colors.white,
    child: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  context.setLocale(Locale('ko', 'KR'));
                  Phoenix.rebirth(context);
                  // print(context.locale.toString());
                },
                child: Text('한국어', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorTheme.black))
            ),
            TextButton(
              onPressed: () {
                context.setLocale(Locale('en', 'US'));
                Phoenix.rebirth(context);
              },
              child: Text('English', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorTheme.black))
            ),
            TextButton(
                onPressed: () {
                  context.setLocale(Locale('ja', 'JP'));
                  Phoenix.rebirth(context);
                },
                child: Text('日語', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorTheme.black))
            ),
            TextButton(
                onPressed: () {
                  context.setLocale(Locale('zh', 'CN'));
                  Phoenix.rebirth(context);
                },
                child: Text('中國語', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorTheme.black))
            ),
          ],
        )
      ),
    ),
  ));
  // Get.dialog(Dialog(
  //   child: Container(
  //     height: 100,
  //     child: Center(child: Text('Dialog')),
  //   ),
  // );
  // Get.defaultDialog(
  //   title: '언어 변경',
  //   content : Cloum,
  //   textConfirm: '변경하기',
  //   confirmTextColor: Colors.white,
  //   onConfirm: Get.back,
  //   textCancel: '취소',
  //   onCancel: Get.back,
  // );
}