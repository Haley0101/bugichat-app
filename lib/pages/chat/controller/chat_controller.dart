import 'dart:convert';
import 'package:bugichat/common/config/config.dart';
import 'package:bugichat/common/languages/langCN.dart';
import 'package:bugichat/common/languages/langEN.dart';
import 'package:bugichat/common/languages/langJP.dart';
import 'package:bugichat/common/languages/langKO.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum ChatMessageType { MyMessage, OtherMessage }

class ChatMessage {
  final String content;
  final ChatMessageType type;

  ChatMessage(this.content, this.type);
}


class ChatController extends GetxController {
  late final screenLang;

  // RxList chatHistory = [].obs;
  final chatHistory = <ChatMessage>[].obs;
  RxBool isLoading = false.obs;

  RxString userInput = "".obs;

  TextEditingController userInputText = TextEditingController();
  FocusNode userInputTextFocus = FocusNode();


  @override
  void onInit() async {
    // await getScreenLang();
    super.onInit();
  }


  // getScreenLang() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userLang = prefs.getString('userLang');
  //   if (userLang == "ko") {
  //     screenLang = langKO();
  //     print("한국어로 설정 됨");
  //   } else if (userLang == "en") {
  //     screenLang = langEN();
  //     print("영어로 설정 됨");
  //   } else if (userLang == "jp") {
  //     screenLang = langJP();
  //     print("일본어로 설정 됨");
  //   } else if (userLang == "cn") {
  //     screenLang = langCN();
  //     print("중국어로 설정 됨");
  //   }
  // }


  onClickSendButton(BuildContext context) async {
    print(context.locale.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('${Config().globalIp}/api/ai-chat'));
    request.body = json.encode({
      "userText": userInput.value,
      "userId": userId,
      "userLang": context.locale.toString()
    });
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;

      chatHistory.add(ChatMessage(result["chatBot"], ChatMessageType.OtherMessage));
      isLoading.value = true; // Loading finished, update the UI
      return result;
    } else {
      // Handle any error situation you'd like
    }
  }


}