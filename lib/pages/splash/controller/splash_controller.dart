import 'package:bugichat/common/util/auth_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 7), () {
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
