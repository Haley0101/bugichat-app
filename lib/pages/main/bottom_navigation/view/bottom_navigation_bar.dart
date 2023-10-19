import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/pages/main/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavgationWidget extends StatelessWidget {
  const BottomNavgationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BottomNavgationBarController controller = Get.find<BottomNavgationBarController>();
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: ColorTheme.grayBorder, width: 1)),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Obx(() => BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changeIndex,
              selectedItemColor: ColorTheme.blue,
              unselectedItemColor: ColorTheme.black,
              elevation: 0,
              unselectedLabelStyle: TextStyle(fontSize: 13.sp),
              selectedLabelStyle: TextStyle(fontSize: 13.sp),
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorTheme.white,
              items: <BottomNavigationBarItem>[
                // BottomNavigationBarItem(
                //     icon: Padding(
                //       padding: EdgeInsets.only(bottom: 5.h),
                //       child: ColorFiltered(
                //           colorFilter: ColorFilter.mode(controller.selectedIndex.value == 0 ? ColorTheme.blue : ColorTheme.black, BlendMode.srcATop),
                //           child: SvgPicture.asset('assets/icon/bottom_nav_home.svg')),
                //     ),
                //     label: "홈"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(controller.selectedIndex.value == 0 ? ColorTheme.blue : ColorTheme.black, BlendMode.srcATop),
                          child: SvgPicture.asset('assets/icon/bottom_nav_accept.svg')),
                    ),
                    label: "챗봇"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(controller.selectedIndex.value == 1 ? ColorTheme.blue : ColorTheme.black, BlendMode.srcATop),
                          child: SvgPicture.asset('assets/icon/location.svg')),
                    ),
                    label: "관광지 추천"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(controller.selectedIndex.value == 2 ? ColorTheme.blue : ColorTheme.black, BlendMode.srcATop),
                          child: SvgPicture.asset('assets/icon/camera.svg')),
                    ),
                    label: "사진으로 찾기"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(controller.selectedIndex.value == 3 ? ColorTheme.blue : ColorTheme.black, BlendMode.srcATop),
                          child: SvgPicture.asset('assets/icon/bottom_nav_my.svg')),
                    ),
                    label: "마이페이지"),
              ],
            )),
      ),
    );
  }
}
