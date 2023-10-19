import 'dart:async';

import 'package:bugichat/common/service/firebase_push.dart';
import 'package:bugichat/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'pages/splash/view/splash_view_page.dart';
import 'package:bugichat/route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); // 화면 회전 방지 설정

  runZonedGuarded(
    //앱 강제 종료시 firebase_crashlytics에 보고
    () {
      runApp(Phoenix(
        child: EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
          path: 'assets/translations',
          child: ScreenUtilInit(
            //화면 일정 비율로 설정해주기 위한 클래스
            designSize: const Size(358, 800),
            minTextAdapt: true, //너비와 높이의 최소값에 따라 텍스트를 조정할지 여부
            builder: (context, child) => GetMaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                initialBinding: BindingsBuilder.put(() => FirebasePush(), permanent: true),
                builder: (context, child) {
                  return MediaQuery(
                    //화면마다 각각 다르게 css를 주는 함수
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!, // child는 null이 아님을 해서 에러 방지 해둠.
                  );
                },
                theme: ThemeData(fontFamily: 'Pretendard'),
                //전체 테마 폰트를 설정해뒀음. 변경하고 싶으면 Theme.of().textTheme 사용하면 됨
                debugShowCheckedModeBanner: false,
                //Debug 모양 나오는거 없애기
                // locale: Get.deviceLocale,
                //현재 표시할 언어(디바이스) 설정
                defaultTransition: Transition.cupertino,
                home: const SplashViewPage(),
                //home을 실행할때 로딩창으로 띄움
                getPages: GetXRouter.route), // route에 있는 경로들을 get에 넣어준다
          ),
        ),
      ));
    },

    FirebaseCrashlytics.instance.recordError,
  );
}
