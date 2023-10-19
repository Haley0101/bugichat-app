
import 'package:bugichat/common/global_widget/global_widget.dart';
import 'package:bugichat/common/helper/phone_format_helper.dart';
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/pages/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpStep3ViewPage extends StatelessWidget {
  const SignUpStep3ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: GlobalWidget().bottomSheet(
            context: context,
            isActive: controller.isCheckStep4,
            button2OnTap: () {
              controller.step4Check();
            },
          ),
          appBar: GlobalWidget().appbar(title: "본인에 대해 알려주세요 😀", centerTitle: false, hasLeading: false),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  title('이름'),
                  GlobalWidget().textField(
                    onChanged: (value) {
                      controller.checkLengthStep4();
                    },
                    controller: controller.name,
                    focusNode: controller.nameFocus,
                    sumittedFocusNode: controller.phoneNumberFocus,
                    hintText: "이름을 입력해 주세요.",
                  ),
                  title('연락처'),
                  GlobalWidget().textField(
                      onChanged: (value) {
                        controller.checkLengthStep4();
                      },
                      controller: controller.phoneNumber,
                      focusNode: controller.phoneNumberFocus,
                      sumittedFocusNode: controller.verificationCodeFocus,
                      hintText: "-없이 숫자만 입력",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                        PhoneFormatHelper(),
                      ],
                  ),
                  // title('인증번호'),
                  // GlobalWidget().textField(
                  //     onChanged: (value) {
                  //       controller.checkLengthStep4();
                  //     },
                  //     controller: controller.verificationCode,
                  //     focusNode: controller.verificationCodeFocus,
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.digitsOnly,
                  //       LengthLimitingTextInputFormatter(6),
                  //     ],
                  //     hintText: "인증번호를 입력해 주세요.",
                  //     suffixWidget: Obx(
                  //       () => controller.isSendBottonClicked.value
                  //           ? Text(controller.timerService.time.value, style: TextStyle(color: ColorTheme.black, fontSize: 14.sp))
                  //           : const SizedBox(),
                  //     )),
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

  Widget button({required RxString text, void Function()? onTap}) {
    return Ink(
      width: 72.w,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: ColorTheme.black,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Obx(
            () => Text(
              text.value,
              style: TextStyle(
                color: ColorTheme.white,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
