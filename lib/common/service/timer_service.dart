//SMS 인증용 5분을 카운트다운하는 타이머 클래스, 시간은 00:00 형식으로 표시됨 RxString time = '00:00'.obs;
import 'dart:async';

import 'package:get/get.dart';

class TimerService extends GetxController {
  late Timer phoneNumberTimer;
  int second = 0;
  int minute = 0;
  int setTime = 300;
  RxString time = '05:00'.obs;
  RxBool isSendBottonClicked = false.obs;
  //타이머 리셋
  void resetTimer() {
    setTime = 300;
    minute = 0;
    second = 0;
    phoneNumberTimer.cancel();
  }

  //타이머 시작
  void startTimer() {
    isSendBottonClicked.value ? resetTimer() : null;
    isSendBottonClicked.value = true;
    phoneNumberTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setTime = setTime - 1;
        minute = ((setTime) ~/ 60);
        second = setTime - minute * 60;
        time.value = '${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
        if (setTime == 1) {
          resetTimer();
          time.value = '05:00';
        }
      },
    );
  }

  @override
  void onClose() {
    resetTimer();
    super.onClose();
  }
}
