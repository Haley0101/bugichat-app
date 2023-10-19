
import 'package:bugichat/pages/main/view/main_view_page.dart';
import 'package:bugichat/pages/policy/view/policy_view_page.dart';
import 'package:bugichat/pages/sign_in/view/sign_in_view_page.dart';
import 'package:bugichat/pages/sign_up/view/sign_up_step1_view_page.dart';
import 'package:bugichat/pages/sign_up/view/sign_up_step2_view_page.dart';
import 'package:bugichat/pages/sign_up/view/sign_up_step3_view_page.dart';
import 'package:bugichat/pages/sign_up/view/sign_up_step4_view_page.dart';
import 'package:bugichat/pages/splash/view/splash_view_page.dart';
import 'package:bugichat/pages/splash2/view/splash_view_page.dart';
import 'package:get/get.dart';

class GetXRouter {
  static final route = [
    GetPage(name: '/', page: () => const SplashViewPage()),
    GetPage(name: '/loading', page: () => const SplashViewPage2()),

    GetPage(name: '/main', page: () => const MainViewPage()),
    GetPage(name: '/sign_in', page: () => const SignInViewPage()),
    // 회원가입 step1
    GetPage(name: '/sign_up_step1', page: () => const SignUpStep1ViewPage()),
    // 회원가입 step2
    GetPage(name: '/sign_up_step2', page: () => const SignUpStep2ViewPage()),
    // 회원가입 step3
    GetPage(name: '/sign_up_step3', page: () => const SignUpStep3ViewPage()),
    // 회원가입 step5
    GetPage(name: '/sign_up_step4', page: () => const SignUpStep4ViewPage()),
    GetPage(name: '/policy', page: () => const PolicyViewPage()),
  ];
}
