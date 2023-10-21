import 'dart:convert';

import 'package:bugichat/common/config/config.dart';
import 'package:bugichat/common/model/user_model.dart';
import 'package:bugichat/common/util/auth_controller.dart';
import 'package:bugichat/common/util/user_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyPageController extends GetxController {
  AuthController authController = AuthController();
  UserController userController = UserController();
  Rx<UserModel?> userModel = UserModel().obs;
  RxMap<dynamic, dynamic> userInfo = {}.obs;
  RxBool isLoading = false.obs;
  // late final screenLang;

  // getScreenLang() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userLang = prefs.getString('userLang');
  //   if (userLang == "ko") {
  //     screenLang = langKO();
  //
  //   } else if (userLang == "en") {
  //     screenLang = langEN();
  //
  //   } else if (userLang == "jp") {
  //     screenLang = langJP();
  //
  //   } else if (userLang == "cn") {
  //     screenLang = langCN();
  //   }
  // }

  logOut() async {
    // authController.logOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed('/sign_in');
  }

  deleteAccount() {
    authController.deleteAccount(
      uid: userModel.value!.uid!,
    );
  }

  @override
  void onInit() async {
    // screenLang = langKO();
    // await getScreenLang();
    await getUserInfo();
    super.onInit();
  }

  // getUserInfo() async {
  //   userModel.value = await userController.getUserInfo();
  // }

  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('${Config().globalIp}/api/user-info'));
    request.body = json.encode({
      "userId": userId
    });
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      userInfo = result.obs;
      isLoading.value = true;
      return result;
    } else {}
  }
}
