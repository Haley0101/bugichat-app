import 'package:bugichat/pages/sign_in/controller/sign_in_controller.dart';
import 'package:bugichat/pages/chat/controller/chat_controller.dart';
import 'package:bugichat/common/global_widget/global_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bugichat/common/theme/color_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatViewPage extends StatelessWidget {
  const ChatViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());
    return Scaffold(
        backgroundColor: ColorTheme.white,
        appBar: GlobalWidget().appbar(
            title: tr('titleText'),
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
                    child: Image.asset(
                      'assets/icon/earthIcon.png',
                      height: 24.h,
                      width: 24.h,
                    )),
              )
            ]),
        body: SafeArea(
          child: Column(children: [
            Expanded(
                child: SingleChildScrollView(
                    child: SizedBox(
              width: 440.h,
              child: Obx(
                () => controller.chatHistory.isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 180.h, right: 8.w, left: 8.w),
                          child: Text(
                            tr('chatBotHintText'),
                            style: TextStyle(
                                fontSize: 24.sp,
                                color: ColorTheme.deepGrayText),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    controller.chatHistory.length,
                        (i) => Align(
                      alignment: controller.chatHistory[i].type ==
                          ChatMessageType.MyMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8.w, right: 8.w, top: i == controller.chatHistory.length -1 && controller.chatHistory[i].content == "Loading..." ?32.h :4.h , bottom:i == controller.chatHistory.length -1 && controller.chatHistory[i].content != "Loading..." ?32.h :4.h),
                        child:
                        (controller.chatHistory[i].content == "Loading...")
                            ? Padding(
                              padding: EdgeInsets.only(left: 28.w),
                              child: Image.asset('assets/icon/chatLoading.gif', height: 24.h),
                            )
                            : (controller.chatHistory[i].type ==
                            ChatMessageType.MyMessage)
                            ? Padding(padding:(EdgeInsets.only(right:-0.w)),child :
                        Container(decoration :(BoxDecoration(color :(const Color.fromRGBO(152,238,204,1)),borderRadius:(BorderRadius.circular(8.r)))),child :Padding(padding :EdgeInsets.all(8.w),child :
                        Text(controller.chatHistory[i].content,style :(TextStyle(fontSize :28.sp ,fontWeight
                            :FontWeight.bold)),softWrap
                            :true ,maxLines
                            :null,),),),)
                            : Row(crossAxisAlignment :(CrossAxisAlignment.start),children:[
                        Container(margin:EdgeInsets.only(right: 8.w),
                        child:
                        Image.asset('assets/icon/sign_logo.png', width:
                        25.h, height: 25.h,),
                      ),
                      Flexible(child:
                      Container(margin: EdgeInsets.only(right: 62.w),
                        padding: EdgeInsets.all(8.w),
                        decoration:
                        BoxDecoration(color:(const Color.fromRGBO(
                            208,245,190,1)), borderRadius:(BorderRadius.circular(8.r))),
                        child:
                        Text(controller.chatHistory[i].content.replaceAll("\n", ""), style:(TextStyle(fontSize:28.sp, fontWeight: FontWeight.bold)),
                          softWrap:true,
                          maxLines:null,
                        ),
                        ),)
                        ],),
                    ),
                  ),
                ),
              ),
              ),
            ))),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: GlobalWidget().textField(
                  horizontalPadding: (12.w),
                  controller: (controller.userInputText),
                  focusNode: (controller.userInputTextFocus),
                  hintText: (tr('chatBotInputBox')),
                  suffixWidget: (InkWell(
                      onTap: () async {
                        controller.chatHistory.add(ChatMessage(
                            controller.userInputText.text,
                            ChatMessageType.MyMessage));
                        controller.userInput.value =
                            controller.userInputText.text;
                        controller.userInputText.clear();
                        controller.isLoading.value =
                            true; // Loading starts here.
                        await controller.onClickSendButton(context);

                        Future.delayed(const Duration(seconds: 2), () {
                          if (controller.isLoading.value) {
                            // If the loading is still ongoing after a delay (here 2 seconds).
                            // You might want to handle this situation differently.
                            // For instance by showing an error message.
                            controller.isLoading.value = false;
                          }
                        });
                      },
                      child: SvgPicture.asset('assets/icon/sendUi.svg',
                          height: 26.h)))),
            )
          ]),
        ));
  }
}
