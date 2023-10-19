
import 'package:bugichat/common/global_widget/global_widget.dart';
import 'package:bugichat/pages/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpStep2ViewPage extends StatelessWidget {
  const SignUpStep2ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find<SignUpController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: GlobalWidget().bottomSheet(
            context: context,
            isActive: controller.isCheckStep2,
            button2OnTap: () {
              controller.checkStep2();
            },
          ),
          appBar: GlobalWidget().appbar(title: "계정을 설정해주세요 📝", centerTitle: false, hasLeading: false),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  title('이메일'),
                  GlobalWidget().textField(
                      onChanged: (value) {
                        controller.checkLengthStep2();
                      },
                      controller: controller.email,
                      focusNode: controller.emailFocus,
                      sumittedFocusNode: controller.userIdFocus,
                      hintText: "이메일을 입력해주세요.",
                      keyboardType: TextInputType.emailAddress),
                  title('아이디'),
                  GlobalWidget().textField(
                      onChanged: (value) {
                        controller.checkLengthStep2();
                      },
                      controller: controller.userId,
                      focusNode: controller.userIdFocus,
                      sumittedFocusNode: controller.passwordFocus,
                      hintText: "아이디를 입력해주세요."
                  ),
                  title('비밀번호'),
                  GlobalWidget().textField(
                      onChanged: (value) {
                        controller.checkLengthStep2();
                      },
                      focusNode: controller.passwordFocus,
                      sumittedFocusNode: controller.passwordCheckFocus,
                      controller: controller.password,
                      hintText: "비밀번호를 입력해주세요.",
                      isPassword: true),
                  title('비밀번호 확인'),
                  GlobalWidget().textField(
                      onChanged: (value) {
                        controller.checkLengthStep2();
                      },
                      focusNode: controller.passwordCheckFocus,
                      controller: controller.passwordCheck,
                      hintText: "비밀번호를 한 번 더 입력해주세요.",
                      isPassword: true),
                  // title("언어설정"),
                  // Row(
                  //   children: [
                  //
                  //   ],
                  // )
                ],
              ),
            ),
          )),
    );
  }

  Widget title(text) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 24.w),
      child: Text(text, style: TextStyle(fontSize: 12.sp)),
    );
  }
}
