import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BottomNavgationBarController extends GetxController {
  // 현재 선택된 탭 아이템 번호 저장
  RxInt selectedIndex = 0.obs;

  // Get.fine 대신 클래스명 사용 가능
  static BottomNavgationBarController get to => Get.find();

  // 탭 이벤트가 발생할 시 selectedIndex값을 변경해줄 함수
  void changeIndex(int index) {
    selectedIndex(index);
  }

  DateTime? currentBackPressTime;

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xff6E6E6E),
          fontSize: 12.sp,
          toastLength: Toast.LENGTH_SHORT);
      return false;
    }
    return true;
  }
}
