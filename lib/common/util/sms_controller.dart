import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SmsController extends GetxController {
  String vid = '';
  sendCode({
    required String phoneNumber,
  }) async {
    String phoneNumberNonHyphen = phoneNumber.replaceAll('-', '');
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        timeout: 100.seconds,
        codeAutoRetrievalTimeout: (String timeout) {},
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        phoneNumber: '+82 $phoneNumberNonHyphen',
        codeSent: (String verificationId, int? forceResendingToken) async {
          Get.snackbar('인증번호가 전송되었습니다.', "");
          vid = verificationId;
        },
        verificationFailed: (FirebaseAuthException error) {
          Get.snackbar('authentication error', error.code.toString());
        },
      );
    } catch (e) {
      print(e);
    }
  }

  ///휴대폰 인증번호 확인
  Future<bool> verifyCode({
    required String verificationCode,
  }) async {
    PhoneAuthCredential coderesult = PhoneAuthProvider.credential(verificationId: vid, smsCode: verificationCode);
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithCredential(coderesult);
      if (result.user != null) {
        // Get.snackbar('인증이 완료되었습니다.', "");
        return true;
      } else {
        Get.snackbar('인증번호가 일치하지 않습니다.', "");
        return false;
      }
    } catch (e) {
      print(e);
      Get.snackbar('인증번호가 일치하지 않습니다.', "");
      return false;
    }
  }
}
