
import 'package:bugichat/common/global_widget/global_widget.dart';
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/pages/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpStep1ViewPage extends StatelessWidget {
  const SignUpStep1ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: GlobalWidget().bottomSheet(
          context: context,
          isActive: controller.isCheck[0],
          button2OnTap: () {
            Get.toNamed('/sign_up_step2');
          },
        ),
        appBar: GlobalWidget().appbar(title: "이용약관에 동의해주세요 🙌", centerTitle: false, hasLeading: false),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              checklist(
                  text: '모두 동의하기',
                  isCheck: controller.isCheck[0],
                  subtext: '',
                  onTap: () {
                    controller.checkAllClick();
                  },
                  hasRightArrow: false),
              checklist(
                text: '이용약관 동의 ',
                isCheck: controller.isCheck[1],
                subtext: '[필수]',
                onTap: () {
                  controller.checkClick(1);
                },
                rightArrowOnTap: () {
                  Get.toNamed('/policy', arguments: {'title': '이용약관'});
                },
              ),
              checklist(
                text: '개인정보 수집 및 이용 동의 ',
                isCheck: controller.isCheck[2],
                subtext: '[필수]',
                onTap: () {
                  controller.checkClick(2);
                },
                rightArrowOnTap: () {
                  Get.toNamed('/policy', arguments: {'title': '개인정보 수집 및 이용 동의'});
                },
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ));
  }

  ///이용약관 확인하기
  Widget checklist(
      {required String text,
      required RxBool isCheck,
      bool hasRightArrow = true,
      fontWeight = FontWeight.w400,
      subtext = '[필수]',
      subTextColor = Colors.black,
      void Function()? rightArrowOnTap,
      void Function()? onTap}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 14.h, bottom: 14.h),
          child: Row(
            children: [
              Obx(
                () => Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(16.r),
                        onTap: onTap,
                        child: isCheck.value ? SvgPicture.asset('assets/icon/check_active.svg', color: ColorTheme.skyBlue) : SvgPicture.asset('assets/icon/check_disable.svg'))),
              ),
              Text(text,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 16.sp,
                    fontWeight: fontWeight,
                    color: Colors.black,
                  )),
              Text(subtext, style: TextStyle(fontFamily: 'Pretendard', fontSize: 16.sp, fontWeight: fontWeight, color: subTextColor)),
              const Spacer(),
              hasRightArrow
                  ? InkWell(
                      onTap: rightArrowOnTap,
                      child: SvgPicture.asset('assets/icon/arrow_right.svg'),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Divider(
            height: 1.h,
            thickness: 1.h,
            color: ColorTheme.grayBorder,
          ),
        ),
      ],
    );
  }
}
