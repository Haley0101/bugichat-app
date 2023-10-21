import 'package:bugichat/pages/cam_content/view/cam_content_view_page.dart';
import 'package:bugichat/pages/chat/view/chat_view_page.dart';
import 'package:bugichat/pages/gps_content/view/gps_content_view_page.dart';
import 'package:bugichat/pages/main/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:bugichat/pages/main/bottom_navigation/view/bottom_navigation_bar.dart';
import 'package:bugichat/pages/main/controller/main_controller.dart';
import 'package:bugichat/pages/my_page/view/my_page_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({Key? key}) : super(key: key);

  // 탭별 화면
  static List<Widget> tabPages = <Widget>[
    const ChatViewPage(),
    const GpsContentViewPage(),
    const CamContentViewPage(),
    const MyPageViewPage()
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    // 페이지 전환을 위한 MyBottomNavgationBarController 인스턴스화 (의존성 주입)
    BottomNavgationBarController controller = Get.put(BottomNavgationBarController());
    return WillPopScope(
      onWillPop: () async {
        //뒤로가기 두번 누를 경우 나가기 동작
        bool result = controller.onWillPop();
        return await Future.value(result);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // MyBottomNavgationBarController의 변수가 변하면 화면(페이지) 변경
        body: Obx(() => SafeArea(child: tabPages[controller.selectedIndex.value])),
        bottomNavigationBar: const BottomNavgationWidget(),
      ),
    );
  }
}

