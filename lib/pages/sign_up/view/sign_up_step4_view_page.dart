import 'package:bugichat/common/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

class SignUpStep4ViewPage extends StatelessWidget {
  const SignUpStep4ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.black,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.w),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 48.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Material(
                    color: ColorTheme.white,
                    child: InkWell(
                      onTap: () {
                        Get.offAllNamed('/sign_in');
                      },
                      child: Center(
                        child: Text(
                          "로그인하러 가기",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: ColorTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Text(
              "부기챗에",
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold, color: ColorTheme.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Text(
              "가입하신 것을",
              style: TextStyle(fontSize: 28.sp, color: ColorTheme.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, bottom: 47.h),
            child: Text(
              "환영합니다!",
              style: TextStyle(fontSize: 28.sp, color: ColorTheme.white),
            ),
          ),
          Center(
            child: GifView.network(
              'https://i.imgur.com/dVwyvl1.gifv',
              height: 310.h,
              width: 310.w,
              // frameRate: 24, // default is 15 FPS
            ),
          ),
        ],
      ),
    );
  }
}