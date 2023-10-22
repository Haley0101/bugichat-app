
import 'package:bugichat/common/global_widget/global_widget.dart';
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/pages/sign_in/controller/sign_in_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInViewPage extends StatelessWidget {
  const SignInViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInController controller = Get.put(SignInController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 26.h, bottom: 20.h),
                  child: Image.asset('assets/icon/homeLogo.png', height: 150.h,),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 14.w, top: 24.h),
                  child: InkWell(
                    onTap: () {
                      showDefaultDialog(context);
                    },
                    child: Image.asset('assets/icon/earthIcon.png', height: 24.h, width: 24.h,)
                  ),
                )
              ],
            ),
            GlobalWidget().text(text: tr('idText')),
            GlobalWidget().textField(
              controller: controller.email,
              focusNode: controller.emailFocusNode,
              sumittedFocusNode: controller.passwordFocusNode,
              hintText: tr('idHintText')
            ),
            GlobalWidget().text(text: tr('pwText')),
            GlobalWidget().textField(controller: controller.password, focusNode: controller.passwordFocusNode, hintText: tr('pwHintText'), isPassword: true),
            loginButton(
              onTap: () {
                controller.loginButtonClick();
              },
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: ColorTheme.grayBorder,
                    thickness: 1,
                  ),
                ),
                // Text('OR', style: TextStyle(color: Colors.black, fontSize: 12.sp)),
                Expanded(
                  child: Divider(
                    color: ColorTheme.grayBorder,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Center(
                child: InkWell(
                    onTap: () {
                      Get.toNamed("/main");
                    },
                    child: Text(tr('unLoginText'), style: TextStyle(color: Colors.black, fontSize: 18.sp, decoration: TextDecoration.underline))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 38.h),
              child: Center(
                child: InkWell(
                    onTap: () {
                      Get.toNamed("/sign_up_step1");
                    },
                    child: Text(tr('signUp'), style: TextStyle(color: Colors.black, fontSize: 16.sp, decoration: TextDecoration.underline))),
              ),
            ),
            const Spacer(),
            Center(
                child: Text(tr('text1'),
                    style: TextStyle(
                        color: ColorTheme.grayText, fontSize: 12.sp))),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed('/policy', arguments: {"title": "이용약관"});
                    },
                    child: Text(tr('policyText1'),
                        style: TextStyle(
                            color: ColorTheme.grayText, fontSize: 12.sp))),
                Text(' | ',
                    style: TextStyle(
                        color: ColorTheme.grayText, fontSize: 12.sp)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/policy', arguments: {'title': '개인정보 수집 및 이용 동의'});
                  },
                  child: Text(tr('policyText2'),
                      style:
                      TextStyle(color: ColorTheme.grayText, fontSize: 12.sp)),
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget loginButton({required void Function()? onTap}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 34.h, bottom: 40.h),
        child: InkWell(
          borderRadius: BorderRadius.circular(4.r),
          onTap: onTap,
          child: Ink(
            width: 1.sw - 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: ColorTheme.black,
            ),
            child: Center(
              child: Text(
                tr('loginText'),
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
