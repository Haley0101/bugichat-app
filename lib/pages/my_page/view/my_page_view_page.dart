import 'package:bugichat/common/global_widget/global_widget.dart';
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/pages/my_page/controller/my_page_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyPageViewPage extends StatelessWidget {
  const MyPageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPageController controller = Get.put(MyPageController());
    return Scaffold(
      backgroundColor: ColorTheme.grayBackground,
      appBar: GlobalWidget().appbar(
        title: tr('TitleText'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: SizedBox()
        ),
        hasLeading: false
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            routeCard(
              onTap: () { },
              arrow: false,
              bottomPadding: 8.h,
              widget: Expanded(
                child: Obx(() => controller.isLoading.value ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.userInfo["userName"] ?? "None", style: TextStyle(color: ColorTheme.black, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      Text(controller.userInfo["userPhoneNumber"] ?? "010-0000-0000", style: TextStyle(color: ColorTheme.black, fontSize: 14.sp)),
                    ],
                  ) : Text("비회원", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
                ),
              ),
            ),
            routeCard(
              height: 54.h,
              onTap: () {
                Get.toNamed('/policy', arguments: {"title": "이용약관"});
              },
              widget: Expanded(
                child: Text(tr('policyText1'), style: TextStyle(color: ColorTheme.black, fontSize: 16.sp)),
              ),
              hasBorder: false
            ),
            routeCard(
              height: 54.h,
              bottomPadding: 8.h,
              onTap: () {
                Get.toNamed('/policy', arguments: {"title": "개인정보처리방침"});
              },
              widget: Expanded(
                child: Text(tr('policyText2'), style: TextStyle(color: ColorTheme.black, fontSize: 16.sp)),
              ),
            ),
            routeCard(
              height: 54.h,
              arrow: false,
              onTap: () {
                controller.logOut();
              },
              widget: Expanded(
                child: Text(tr('logoutText'), style: TextStyle(color: ColorTheme.black, fontSize: 16.sp)),
              ),
            ),
            signOut(
              onTap: () {
                controller.deleteAccount();
              },
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 24.h, left: 24.w),
              child: Text("${tr('companyName')}\n${tr('companyName2')}",
                style: TextStyle(color: Colors.black54 , fontSize: 12.sp)),
            )
          ],
        ),
      ),
    );
  }

  Widget routeCard({
    required void Function()? onTap,
    required Widget? widget,
    bool hasBorder = true,
    bool arrow = true,
    double? bottomPadding,
    double? height,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 0),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: 1.sw,
          height: height ?? 76.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: hasBorder ? ColorTheme.grayBorder : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                widget ?? const SizedBox(),
                arrow ? SvgPicture.asset(
                  'assets/icon/arrow_right.svg',
                  width: 24.w,
                  height: 24.h,
                ): Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signOut({void Function()? onTap}) {
    MyPageController controller = Get.put(MyPageController());
    return Padding(
      padding: EdgeInsets.only(top: 16.h, right: 24.w),
      child: Align(
          alignment: Alignment.centerRight,
          child:
          InkWell(onTap: onTap, child: Text(tr('deleteAccount'), style: TextStyle(color: ColorTheme.grayText, fontSize: 14.sp, decoration: TextDecoration.underline)))),
    );
  }
}