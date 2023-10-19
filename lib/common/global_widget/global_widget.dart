import 'package:bugichat/common/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GlobalWidget {
  Widget bottomSheet({required RxBool isActive, required void Function()? button2OnTap, required BuildContext context}) {
    return MediaQuery.of(context).viewInsets.bottom == 0
        ?  Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorTheme.white,
          border: Border(
            top: BorderSide(
              color: ColorTheme.grayBorder,
              width: 1.h,
            ),
          ),
        ),
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h, bottom: 38.h),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.w),
              width: 80.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: ColorTheme.skyBlue,
                  width: 1.h,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Material(
                  color: ColorTheme.white,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Center(
                      child: Text(
                        '이전',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorTheme.skyBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 48.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Obx(
                    () => Material(
                      color: isActive.value ? ColorTheme.skyBlue : ColorTheme.grayButton,
                      child: InkWell(
                        onTap: isActive.value ? button2OnTap : null,
                        child: Center(
                          child: Text(
                            '다음',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: isActive.value ? ColorTheme.white : ColorTheme.grayText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )): const SizedBox();
  }

  Widget bottom1Button({required void Function()? onTap, required String text, required RxBool isActive, required BuildContext context}) {
    return MediaQuery.of(context).viewInsets.bottom == 0
        ? Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorTheme.white,
              border: Border(
                top: BorderSide(
                  color: ColorTheme.grayBorder,
                  width: 1.h,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h, bottom: 38.h),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: Obx(
                        () => Material(
                          color: isActive.value ? ColorTheme.green : ColorTheme.grayButton,
                          child: InkWell(
                            onTap: isActive.value ? onTap : null,
                            child: Center(
                              child: Text(
                                text,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: isActive.value ? ColorTheme.white : ColorTheme.grayText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
        : const SizedBox();
  }

  Widget textField(
      {required TextEditingController controller,
      required String hintText,
      bool isPassword = false,
      double? borderRadise,
      TextInputType? keyboardType,
      double? height,
      double? width,
      void Function(String)? onChanged,
      double? horizontalPadding,
      Widget? suffixWidget,
      FocusNode? focusNode,
      FocusNode? sumittedFocusNode,
      int? maxLines = 1,
      List<TextInputFormatter>? inputFormatters}) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: horizontalPadding ?? 24.w, right: horizontalPadding ?? 24.w),
      child: SizedBox(
        height: height ?? 48.h,
        width: width,
        child: Stack(
          children: [
            TextField(
              maxLines: maxLines,
              onChanged: onChanged,
              controller: controller,
              keyboardType: keyboardType,
              obscureText: isPassword,
              inputFormatters: inputFormatters,
              focusNode: focusNode,
              onSubmitted: sumittedFocusNode != null ? (value) => FocusScope.of(Get.context!).requestFocus(sumittedFocusNode) : null,
              cursorColor: ColorTheme.black,
              decoration: InputDecoration(
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 24.h,
                  maxWidth: 24.w,
                ),
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 16.sp, color: ColorTheme.deepGrayText),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadise ?? 4.r),
                  borderSide: const BorderSide(color: ColorTheme.skyBlue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadise ?? 4.r),
                  borderSide: const BorderSide(color: ColorTheme.grayBorder),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadise ?? 4.r),
                  borderSide: const BorderSide(color: ColorTheme.red),
                ),
              ),
              style: TextStyle(fontSize: 16.sp),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: suffixWidget ?? const SizedBox(),
                )),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appbar(
      {required String title,
      List<Widget>? actions,
      void Function()? leadingOnTap,
      String? leadingPath,
      PreferredSizeWidget? bottom,
      double? elevation,
      bool? centerTitle,
      bool hasLeading = true}) {
    return AppBar(
      elevation: elevation ?? 0,
      bottom: bottom ??
          PreferredSize(
            preferredSize: const Size.fromHeight(8),
            child: Container(
              decoration: const BoxDecoration(
                color: ColorTheme.grayBackground,
                border: Border(
                  top: BorderSide(
                    color: ColorTheme.grayBorder,
                    width: 1,
                  ),
                ),
              ),
              height: 8.h,
            ),
          ),
      leadingWidth: hasLeading ? 48.w : 8.w,
      actions: actions,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
          color: ColorTheme.black,
          fontSize: hasLeading ? 16.sp : 20.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: centerTitle ?? true,
      leading: hasLeading
          ? InkWell(
              onTap: leadingOnTap ??
                  () {
                    Get.back();
                  },
              child: Center(
                child: SvgPicture.asset(
                  leadingPath ?? "assets/icon/arrow_back.svg",
                ),
              ),
            )
          : const SizedBox(),
    );
  }

  Widget imageBigButton({required String imagePath, required String text, required void Function()? onTap, double? height}) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          width: 1.sw,
          height: height ?? 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.only(bottom: 6.h, right: 20.w),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(fontSize: 44.sp, color: ColorTheme.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }

  Widget routeCard({required String title, required void Function()? onTap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          height: 48.h,
          color: ColorTheme.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(children: [Text(title, style: TextStyle(fontSize: 16.sp)), const Spacer(), SvgPicture.asset("assets/icon/right_arrow_24.svg")]),
        ),
      ),
    );
  }

  //TODO: 유언 영상 정보 변수 추가
  Widget willVideoInfoCard() {
    return Material(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorTheme.grayBorder),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("유언 영상 정보", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: Text("파일명 : XXXX", style: TextStyle(fontSize: 16.sp)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Text("생성 날짜 : XXXX", style: TextStyle(fontSize: 16.sp)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Text("영상 길이 : XXXX", style: TextStyle(fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );
  }

  showDialog({required String content, required void Function()? onPressed, String? button1Text, void Function()? button1OnPressed}) {
    Get.dialog(AlertDialog(
      content: Text(content, style: TextStyle(fontSize: 14.sp, color: ColorTheme.deepGrayText)),
      actions: [
        TextButton(
          onPressed: button1OnPressed ??
              () {
                Get.back();
              },
          child: Text(button1Text ?? "아니요", style: TextStyle(fontSize: 14.sp, color: ColorTheme.deepGrayText)),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text("네", style: TextStyle(fontSize: 14.sp, color: ColorTheme.black)),
        )
      ],
    ));
  }

  Widget videoTextScrollCard({
    required String content,
  }) {
    return Container(
      width: 311.w,
      height: 126.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.only(left: 11.w, right: 11.w, top: 10.h, bottom: 10.h),
      child: RawScrollbar(
          trackVisibility: true,
          thumbColor: ColorTheme.black,
          trackColor: const Color(0xFFD29E00),
          trackRadius: Radius.circular(10.r),
          radius: Radius.circular(10.r),
          thickness: 15,
          thumbVisibility: true,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Text(content),
              ))),
    );
  }

  Widget typeSelectCard(
      {required RxString selectText, required List<String> typeList, required RxBool cardIsOpen, String hintText = "항목을 선택해주세요", dynamic moreFunction}) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 5.h),
            child: InkWell(
              onTap: () {
                cardIsOpen.value = !cardIsOpen.value;
              },
              child: Ink(
                width: 1.sw - 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: ColorTheme.grayBorder),
                ),
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                child: Row(
                  children: [
                    Obx(() => Text(selectText.value == "" ? hintText : selectText.value,
                        style: TextStyle(fontSize: 16.sp, color: selectText.value == "" ? ColorTheme.grayText : ColorTheme.black))),
                    const Spacer(),
                    Obx(
                      () => SvgPicture.asset(cardIsOpen.value ? "assets/icon/arrow_up.svg" : "assets/icon/arrow_down.svg", width: 20.w, height: 20.h),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Obx(() => cardIsOpen.value
            ? Column(
                children: [
                  for (int i = 0; i < typeList.length; i++)
                    InkWell(
                      onTap: () async {
                        cardIsOpen.value = false;
                        selectText.value = typeList[i];

                        moreFunction;
                      },
                      child: Container(
                        width: 1.sw - 50.w,
                        height: 34.h,
                        decoration: BoxDecoration(
                          color: selectText.value == typeList[i] ? ColorTheme.black : ColorTheme.white,
                          border: Border(
                              bottom: const BorderSide(color: ColorTheme.grayBorder),
                              top: i == 0 ? const BorderSide(color: ColorTheme.grayBorder) : BorderSide.none,
                              right: const BorderSide(color: ColorTheme.grayBorder),
                              left: const BorderSide(color: ColorTheme.grayBorder)),
                        ),
                        padding: EdgeInsets.only(left: 12.w, right: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(typeList[i],
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: selectText.value == typeList[i] ? ColorTheme.white : ColorTheme.black,
                                    fontWeight: selectText.value == typeList[i] ? FontWeight.bold : FontWeight.normal)),
                          ],
                        ),
                      ),
                    ),
                ],
              )
            : const SizedBox()),
      ],
    );
  }

  Widget text({
    required String text,
    double? topPadding,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, top: topPadding ?? 16.h, left: 25.w),
      child: Text(text, style: TextStyle(fontSize: 12.sp, color: ColorTheme.black)),
    );
  }
}
