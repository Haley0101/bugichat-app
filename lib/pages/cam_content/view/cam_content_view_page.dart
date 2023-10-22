import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
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
        title: tr('CamContent'),
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
                      Text(tr('CamContentFind1')),
                      Text(' ${controller.output.value} ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: ColorTheme.skyBlue),),
                      Text(tr('CamContentFind2'))
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
                      child: Text(tr('CamContenttourist'), style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold))
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
                                    Text(tr('CamContenttourist1_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                    Text(tr('CamContenttourist1_2'), style: TextStyle(fontSize: 12.sp))
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
                                  Text(tr('CamContenttourist2_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                  Text(tr('CamContenttourist2_2'), style: TextStyle(fontSize: 12.sp))
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
                                  Text(tr('CamContenttourist3_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                  Text(tr('CamContenttourist3_2'), style: TextStyle(fontSize: 12.sp))
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
                      child: Text(tr('CamContentrestlist'), style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold))
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
                                    Text(tr('CamContentrestlist1_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                    Text(tr('CamContentrestlist1_2'), style: TextStyle(fontSize: 12.sp))
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
                                  Text(tr('CamContentrestlist2_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                  Text(tr('CamContentrestlist2_2'), style: TextStyle(fontSize: 12.sp))
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
                                  Text(tr('CamContentrestlist3_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                                  Text(tr('CamContentrestlist3_2'), style: TextStyle(fontSize: 12.sp))
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