
import 'package:bugichat/common/theme/color_theme.dart';
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
          child: Text("주변 가볼 만한 곳", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
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
                  margin: EdgeInsets.only(left: 18.w, right: 18.w),
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.w, top: 22.h, bottom: 8.h),
          child: Text("주변 관광지 코스", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
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
                        Text("추천관광코스", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        Text("수영팔도시장 - 수영사적공원 - 수영성마을박물관", style: TextStyle(fontSize: 12.sp))
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
                        Text("광안코스", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        Text("밀락더마켓 - 민락수변공원 - 서프마린 - 광안리해수욕장", style: TextStyle(fontSize: 12.sp))
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
                          Text("산책코스", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                          Text("민락수변공원 - 광안해변공원 - 광안리해변테마거리 - 남천해변공원 - \n남천동벚꽃거리", style: TextStyle (fontSize: 12.sp))
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
      Center(child: Text("현재 준비중 입니다.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),))
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
        child: Text("주변 가볼 만한 곳", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
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
                      Text("감천문화마을", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text("부산 사하구 감내1로 200", style: TextStyle(fontSize: 12.sp))
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
                      Text("괴정골목시장", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text("부산 사하구 사하로198번길 7", style: TextStyle(fontSize: 12.sp))
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 18.w, top: 22.h, bottom: 8.h),
        child: Text("주변 관광지 코스", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
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
                      Text("추천관광코스", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text("감천문화마을 - 괴정골목시장 - 을숙도(낙동강하구에코센터 | 현대미술관) - \n부네치아 장림항", style: TextStyle(fontSize: 12.sp))
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
                      Text("추첰코스 1", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text("몰운대 산책(낙조전망대) - 다대포해수욕장 & 해변공원 - 다대씨파크 - \n감천문화마을", style: TextStyle(fontSize: 12.sp))
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
                      Text("추천코스 2", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Text("을숙도(낙동강하구에코센터 | 현대미술관) - 하단오일상설시장 - \n부네치아 장림항 - 다대포해수욕장 & 해변공원", style: TextStyle (fontSize: 12.sp))
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