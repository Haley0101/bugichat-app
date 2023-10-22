
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

Widget suyeong_gu() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.w, top: 22.h, bottom: 8.h),
          child: Text(tr('GPSPlace'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
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
                      Text(tr('GPSContenttourlist1_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text(tr('GPSContenttourlist1_2'), style: TextStyle(fontSize: 12.sp))
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
                  margin: EdgeInsets.only(left: 18.w, right: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/rhkddksgoqus.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover,)),
                      SizedBox(height: 8.h),
                      Text(tr('GPSContenttourlist2_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text(tr('GPSContenttourlist2_2'), style: TextStyle(fontSize: 12.sp))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.w, top: 22.h, bottom: 8.h),
          child: Text(tr('GPSContenttourlist'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
        ),
        SizedBox(
          height: 270.h,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ColorTheme.deepGrayText)
                    )
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 18.w, bottom: 8.h, top: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr('GPSContenttourlistCourse1_1_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        Text(tr('GPSContenttourlistCourse1_1_2'), style: TextStyle(fontSize: 12.sp))
                      ],
                    )
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ColorTheme.deepGrayText)
                    )
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 18.w, bottom: 8.h, top: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr('GPSContenttourlistCourse1_2_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        Text(tr('GPSContenttourlistCourse1_2_2'), style: TextStyle(fontSize: 12.sp))
                      ],
                    )
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ColorTheme.deepGrayText)
                    )
                  ),
                  child: Container(
                      margin: EdgeInsets.only(left: 18.w, bottom: 8.h, top: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr('GPSContenttourlistCourse1_3_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                          Text(tr('GPSContenttourlistCourse1_3_2'), style: TextStyle (fontSize: 12.sp))
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
        ),
        ],
      ),
  );
}

Widget geumjeong_gu() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(child: Text(tr("GPSContentLoad"), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),))
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           launchUrl(
      //               Uri.parse('https://map.kakao.com/link/to/7887457'),
      //               mode: LaunchMode.externalApplication
      //           );
      //         },
      //         child: Container(
      //             margin: EdgeInsets.only(left: 18.w),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/minrack.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover)),
      //                 SizedBox(height: 8.h),
      //                 Text("민락수변공원", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
      //                 Text("부산 수영구 광안해변로 361", style: TextStyle(fontSize: 12.sp))
      //               ],
      //             )
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           launchUrl(
      //               Uri.parse('https://map.kakao.com/link/to/18216044'),
      //               mode: LaunchMode.externalApplication
      //           );
      //         },
      //         child: Container(
      //             margin: EdgeInsets.only(left: 18.w),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/rhkddksgoqus.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover,)),
      //                 SizedBox(height: 8.h),
      //                 Text("광안해변공원", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
      //                 Text("부산 수영구 민락동 176-33", style: TextStyle(fontSize: 12.sp))
      //               ],
      //             )
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // Padding(
      //   padding: EdgeInsets.only(left: 18.w, top: 22.h, bottom: 8.h),
      //   child: Text("주변 관광지 코스", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
      // ),
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           launchUrl(
      //               Uri.parse('https://map.kakao.com/link/to/7887457'),
      //               mode: LaunchMode.externalApplication
      //           );
      //         },
      //         child: Container(
      //           margin: EdgeInsets.only(left: 18.w),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/minrack.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover)),
      //               SizedBox(height: 8.h),
      //               Text("민락수변공원", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
      //               Text("부산 수영구 광안해변로 361", style: TextStyle(fontSize: 12.sp))
      //             ],
      //           )
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           launchUrl(
      //               Uri.parse('https://map.kakao.com/link/to/18216044'),
      //               mode: LaunchMode.externalApplication
      //           );
      //         },
      //         child: Container(
      //           margin: EdgeInsets.only(left: 18.w),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/rhkddksgoqus.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover,)),
      //               SizedBox(height: 8.h),
      //               Text("광안해변공원", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
      //               Text("부산 수영구 민락동 176-33", style: TextStyle(fontSize: 12.sp))
      //             ],
      //           )
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    ],
  );
}

Widget saha_gu() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 18.w, top: 22.h, bottom: 8.h),
        child: Text(tr('GPSPlace'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
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
                      ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/gamchen.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover)),
                      SizedBox(height: 8.h),
                      Text(tr('GPSContenttourlist3_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text(tr('GPSContenttourlist3_2'), style: TextStyle(fontSize: 12.sp))
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
                      ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.asset('assets/icon/sijang.jpg', width: 200.w, height: 130.h, fit: BoxFit.cover,)),
                      SizedBox(height: 8.h),
                      Text(tr('GPSContenttourlist4_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text(tr('GPSContenttourlist4_2'), style: TextStyle(fontSize: 12.sp))
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 18.w, top: 22.h, bottom: 8.h),
        child: Text(tr('GPSContenttourlist'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
      ),
      SizedBox(
        height: 270.h,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ColorTheme.deepGrayText)
                  )
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 18.w, bottom: 8.h, top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr('GPSContenttourlistCourse2_1_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text(tr('GPSContenttourlistCourse2_1_2'), style: TextStyle(fontSize: 12.sp))
                    ],
                  )
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ColorTheme.deepGrayText)
                  )
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 18.w, bottom: 8.h, top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr('GPSContenttourlistCourse2_2_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text(tr('GPSContenttourlistCourse2_2_2'), style: TextStyle(fontSize: 12.sp))
                    ],
                  )
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ColorTheme.deepGrayText)
                  )
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 18.w, bottom: 8.h, top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr('GPSContenttourlistCourse2_3_1'), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text(tr('GPSContenttourlistCourse2_3_2'), style: TextStyle (fontSize: 12.sp))
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}