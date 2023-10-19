import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/pages/gps_content/controller/gps_content_controller.dart';
import 'package:bugichat/pages/gps_content/view/gps_content_widget.dart';
import 'package:bugichat/pages/sign_in/controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bugichat/common/global_widget/global_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class GpsContentViewPage extends StatelessWidget {
  const GpsContentViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GpsContentController controller = Get.put(GpsContentController());
    String cityName = controller.getRandomCity();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalWidget().appbar(
        title: "GPS 관광지 추천",
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0), child: SizedBox()),
        hasLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 14.w, top: 8.h),
            child: InkWell(
                onTap: () {
                  showDefaultDialog(context);
                },
                child: Image.asset('assets/icon/earthIcon.png', height: 24.h, width: 24.h,)
            ),
          )
        ]
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: 14.w, left: 14.w),
                child: Container(
                  height: 30.h,
                  width: 434.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: ColorTheme.black, width: 2.w)
                  ),
                  child: Center(
                    child: Text("현재 위치 : $cityName",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      )
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.only(left: 18.w, top: 22.h, bottom: 8.h),
              child: Text("주변 가볼 만한 곳", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
            ),
            if (cityName == "수영구 광안동")
              suyeong_gu()
            else if (cityName == "금정구 청룡동")
              geumjeong_gu()
            else if (cityName == "사하구 감천동")
              saha_gu()
          ],
        ),
      ),
    );
  }
}