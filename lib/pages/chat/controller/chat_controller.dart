import 'dart:convert';
import 'package:bugichat/common/config/config.dart';
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
  RxBool waitingForBotResponse = false.obs;

  RxString userInput = "".obs;

  TextEditingController userInputText = TextEditingController();
  FocusNode userInputTextFocus = FocusNode();


  @override
  void onInit() async {
    // await getScreenLang();
    super.onInit();
  }


  onClickSendButton(BuildContext context) async {
    waitingForBotResponse.value = true;
    isLoading.value = true; // Loading starts here
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
      isLoading.value = false; // Loading finished, update the UI
      waitingForBotResponse.value = false;
      return result;
    } else {
      isLoading.value = false;
      waitingForBotResponse.value = false;
      // Handle any error situation you'd like
    }
  }


}