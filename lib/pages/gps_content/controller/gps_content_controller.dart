import 'dart:math';
import 'package:get/get.dart';

class GpsContentController extends GetxController {

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  getRandomCity() {
    var randomIndex = Random().nextInt(2);

    List<Map> cityArr = [
      {'name': '수영구 광안동', 'text': '광안대교'},
      {'name': '금정구 청룡동', 'text': '범어사'},
      {'name': '사하구 감천동', 'text': '감천문화마을'},
    ];

    return cityArr[randomIndex]['name'];

  }

}
