import 'dart:convert';

import 'package:bugichat/common/config/config.dart';
import 'package:bugichat/common/helper/email_format_helper.dart';
import 'package:bugichat/common/util/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  AuthController authController = AuthController();
  // SmsController smsController = Get.put(SmsController());
  // TimerService timerService = Get.put(TimerService());

  List<RxBool> isCheck = [false.obs, false.obs, false.obs];


  TextEditingController name = TextEditingController();
  FocusNode nameFocus = FocusNode();
  TextEditingController phoneNumber = TextEditingController();
  FocusNode phoneNumberFocus = FocusNode();
  TextEditingController email = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController userId = TextEditingController();
  FocusNode userIdFocus = FocusNode();
  TextEditingController password = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  TextEditingController passwordCheck = TextEditingController();
  FocusNode passwordCheckFocus = FocusNode();
  TextEditingController verificationCode = TextEditingController();
  FocusNode verificationCodeFocus = FocusNode();

  RxBool isCheckStep2 = false.obs;
  RxBool isCheckStep4 = false.obs;

  String verificationId = '';

  List<RxBool> isTypeCardOpen = [false.obs];
  RxList<RxString> selectTypeList = [''.obs].obs;

  RxBool isSendBottonClicked = false.obs;

  bool phoneNumberCheck() {
    if (phoneNumber.text.length == 13) {
      return true;
    } else {
      return false;
    }
  }

  checkClick(int index) {
    isCheck[index].value = !isCheck[index].value;
    if (isCheck[1].value && isCheck[2].value) {
      isCheck[0].value = true;
    } else {
      isCheck[0].value = false;
    }
  }

  checkAllClick() {
    if (isCheck[0].value) {
      isCheck[1].value = false;
      isCheck[2].value = false;
      isCheck[0].value = false;
    } else {
      isCheck[1].value = true;
      isCheck[2].value = true;
      isCheck[0].value = true;
    }
  }

  checkLengthStep2() {
    if (email.text.isNotEmpty && userId.text.isNotEmpty && password.text.isNotEmpty && passwordCheck.text.isNotEmpty) {
      isCheckStep2.value = true;
    } else {
      isCheckStep2.value = false;
    }
  }

  checkStep2() {
    if (password.text == passwordCheck.text) {
    } else {
      isCheckStep2.value = false;
      Get.snackbar("비밀번호 확인", "비밀번호가 일치하지 않습니다.");
    }
    if (EmailFormatHelper.isEmailValid(email.text)) {
    } else {
      isCheckStep2.value = false;
      Get.snackbar("이메일 확인", "이메일 형식이 올바르지 않습니다.");
    }
    if (password.text.length >= 6) {
    } else {
      isCheckStep2.value = false;
      Get.snackbar("비밀번호 확인", "비밀번호는 6자리 이상이어야 합니다.");
    }
    if (isCheckStep2.value) {
      Get.toNamed('/sign_up_step3');
    }
  }



  checkLengthStep4() {
    if (name.text.isNotEmpty && phoneNumber.text.isNotEmpty) {
      isCheckStep4.value = true;
    } else {
      isCheckStep4.value = false;
    }
  }

  //휴대폰 번호 중복 검증 로직
  // Future<bool> checkPhoneNumberDuplicate() async {
  //   QuerySnapshot has = await FirebaseFirestore.instance.collection("users").where("phone", isEqualTo: phoneNumber.text).snapshots().first;
  //   if (has.docs.isEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  sendButtonClick() async {
    if (phoneNumberCheck() == true) {
      // timerService.startTimer();
      isSendBottonClicked.value = true;
      // smsController.sendCode(phoneNumber: phoneNumber.text);
    }
  }

  step4Check() async {
    // bool result = await smsController.verifyCode(verificationCode: verificationCode.text);
    if (true) {
      signUp();
    }
  }

  signUp() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${Config().globalIp}/api/sign-up'));
    request.body = json.encode({
      "userId": email.text,
      "userPw": password.text,
      "userName": name.text,
      "userPhoneNumber": phoneNumber.text,
      "userEmail": email.text
      // "userSetLang": "ko"
    });
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      Get.offAllNamed('/sign_up_step4');
      Get.snackbar("회원가입 성공", "회원가입에 성공하였습니다.");
    } else {
      Get.snackbar("회원가입 실패", "회원가입에 실패하였습니다.");
    }
    // bool result = await authController.signUp(email: email.text, password: password.text, data: {
    //   "email": email.text,
    //   "name": name.text,
    //   "phoneNumber": phoneNumber.text,
    // });
    // if (result) {
    //   Get.offAllNamed('/sign_up_step4');
    //   Get.snackbar("회원가입 성공", "회원가입에 성공하였습니다.");
    // } else {
    //   Get.snackbar("회원가입 실패", "회원가입에 실패하였습니다.");
    // }
  }

  @override
  void onClose() {
    name.dispose();
    nameFocus.dispose();
    phoneNumber.dispose();
    phoneNumberFocus.dispose();
    email.dispose();
    emailFocus.dispose();
    password.dispose();
    passwordFocus.dispose();
    passwordCheck.dispose();

    passwordCheckFocus.dispose();
    verificationCode.dispose();
    verificationCodeFocus.dispose();

    // smsController.onClose();
    // timerService.onClose();

    super.onClose();
  }
}
