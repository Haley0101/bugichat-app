
import 'package:bugichat/common/global_widget/global_widget.dart';
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:bugichat/pages/policy/controller/policy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PolicyViewPage extends StatelessWidget {
  const PolicyViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String service = '''서비스 이용약관''';
    String policy = '''개인정보 이용약관''';
    PolicyController controller = Get.put(PolicyController());

    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: GlobalWidget().appbar(
        title: controller.title,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 24.h, bottom: 8.h),
              child: Text(controller.title, style: TextStyle(color: ColorTheme.black, fontSize: 14.sp, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 8.h),
              child: Text( controller.title == '이용약관'? service : policy, style: TextStyle(color: ColorTheme.black, fontSize: 14.sp)),
            ),
          ],
        ),
        )
      ),
    );
  }
}
