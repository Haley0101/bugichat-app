import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/pages/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

class SplashViewPage extends StatelessWidget {
  const SplashViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GifView.asset(
                'assets/icon/bugi_loading.gif',
                height: 310.h,
                width: 310.w,
                frameRate: 24, // default is 15 FPS
              ),
              Center(child: Text("please wait for a moment", style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: ColorTheme.white),))
            ],
          ),
          // child: GifView.network(
          //   'https://i.imgur.com/dVwyvl1.gifv',
          //   height: 310.h,
          //   width: 310.w,
          //   // frameRate: 24, // default is 15 FPS
          // ),
        )
    );
  }
}
