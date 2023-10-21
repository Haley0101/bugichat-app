import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController2 extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 6500), () {
      checkLogin();
    });
  }

  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      Get.offAllNamed("/sign_in");
    } else {
      Get.offAllNamed("/main");
    }
  }
}
