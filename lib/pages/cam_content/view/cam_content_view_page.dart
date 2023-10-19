import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bugichat/pages/cam_content/controller/cam_content_controller.dart';
import 'package:bugichat/pages/sign_in/controller/sign_in_controller.dart';
import 'package:bugichat/common/global_widget/global_widget.dart';

class CamContentViewPage extends StatelessWidget {
  const CamContentViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CamContentController controller = Get.put(CamContentController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalWidget().appbar(
        title: "사진으로 관광지 탐색",
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => controller.image.value.path.isEmpty
                  ? Container()
                  : InkWell(
                      onTap: () {
                        controller.image.value = File('');
                        controller.output.value = '';
                      },
                      child: Center(child: Image.file(controller.image.value))
                    )
              ),
              // Obx(() => controller.image.value.path.isEmpty
              //   ? Text('사진을 촬영 해주세요', style: TextStyle(fontSize: 24.sp, fontWeight: FeontWeight.bold))
              //   : Image.file(controller.image.value)
              // ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 80.w, right: 80.w),
                child: Obx(() => controller.image.value.path.isEmpty
                  ? Container()
                  : Center(child: Row(
                    children: [
                      Text('찾으시는 장소는'),
                      Text(' ${controller.output.value} ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: ColorTheme.skyBlue),),
                      Text('입니다!!')
                    ],
                  ))
                ),
              ),
              SizedBox(height: 20.h),
              Obx(() => controller.output.value != "광안리"
                ? Container()
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 18.w, bottom: 8.h),
                      child: Text("주변 관광지", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold))
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse('https://map.kakao.com/link/to/7887457'),
                                  mode: LaunchMode.externalApplication
                              );
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 18.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/minrack.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover)),
                                    SizedBox(height: 8.h),
                                    Text("민락수변공원", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                    Text("부산 수영구 광안해변로 361", style: TextStyle(fontSize: 12.sp))
                                  ],
                                )
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                Uri.parse('https://map.kakao.com/link/to/18216044'),
                                mode: LaunchMode.externalApplication
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 18.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/rhkddksgoqus.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover,)),
                                  SizedBox(height: 8.h),
                                  Text("광안해변공원", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                  Text("부산 수영구 민락동 176-33", style: TextStyle(fontSize: 12.sp))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse('https://map.kakao.com/link/to/25039071'),
                                  mode: LaunchMode.externalApplication
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 18.w, right: 18.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/samik_2.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover,)),
                                  SizedBox(height: 8.h),
                                  Text("남천동 벛곷길", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                  Text("부산 수영구 광안해변로 100", style: TextStyle(fontSize: 12.sp))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 38.h),

                    Container(
                      margin: EdgeInsets.only(left: 18.w, bottom: 8.h),
                      child: Text("주변 맛집", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold))
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse('https://map.kakao.com/link/to/590377149'),
                                  mode: LaunchMode.externalApplication
                              );
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 18.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/tonshow.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover)),
                                    SizedBox(height: 8.h),
                                    Text("톤쇼우", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                    Text("부산 수영구 광안해변로279번길 13", style: TextStyle(fontSize: 12.sp))
                                  ],
                                )
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse('https://map.kakao.com/link/to/15206679'),
                                  mode: LaunchMode.externalApplication
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 18.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/gowok.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover,)),
                                  SizedBox(height: 8.h),
                                  Text("고옥", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                  Text("부산 수영구 광남로 6", style: TextStyle(fontSize: 12.sp))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse('https://map.kakao.com/link/to/1579337090'),
                                  mode: LaunchMode.externalApplication
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 18.w, right: 18.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/cho.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover,)),
                                  SizedBox(height: 8.h),
                                  Text("초필살돼지구이", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                  Text("부산 수영구 광남로108번길 9 1층", style: TextStyle(fontSize: 12.sp))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              // const Spacer(),
              // Obx(() => controller.image.value.path.isEmpty
              //     ? ElevatedButton.icon(
              //         onPressed: () => controller.sechanShowBottomSheet(),
              //         icon: Icon(Icons.camera_alt),
              //         label: Text('사진을 촬영 해주세요'),
              //     ) : Container(),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.sechanShowBottomSheet();
        },
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}