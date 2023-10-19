import 'dart:io';
// import 'dart:typed_data';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
// import 'package:image/image.dart' as img;

class CamContentController extends GetxController {
  var image = File('').obs;
  var output = ''.obs;

  clearImage() {
    image.value = File('');
    output.value = '';
  }

  @override
  void onInit() async {
    clearImage();
    super.onInit();
  }

// 모델 로딩 함수 및 이미지 분류 함수
//   Future<void> loadModelAndClassifyImage(File image) async {
//     // Load model
//     final interpreterOptions = tfl.InterpreterOptions();
//     final interpreter = await tfl.Interpreter.fromAsset("assets/model_unquant.tflite", options: interpreterOptions);
//
//     // Load image and get its tensorbuffer
//     var imgBytes = File(image.path).readAsBytesSync();
//
//     // Preprocessing of the input data.
//     img.Image? originalImage = img.decodeImage(imgBytes);
//
//     if (originalImage == null) return;
//
//     // Resize the image to the expected size for your model
//     var resizedImage = img.copyResize(originalImage, width: 224, height: 224);
//
//     // Normalize pixel values (from 0-255 to -1 to 1)
//     var normalizedImg = resizedImage.getBytes().map((pixelValue) => (pixelValue / 127.5) - 1).toList();
//
//     Float32List inputBuffer= Float32List.fromList(normalizedImg);
//
//     // Create ByteBuffer for input
//     int numElements = normalizedImg.length;
//     ByteBuffer bufferInput = Int8List(numElements*4).buffer; // Multiply by 4 because Float32 is 4 bytes
//     ByteData byteDataInput= ByteData.view(bufferInput);
//     for(int i=0; i<numElements; i++) {
//       byteDataInput.setFloat32(i*4, inputBuffer[i]); // Use inputBuffer here because it's a Float32List version of normalizedImg
//     }
//
//     final outputSize= interpreter.getOutputTensor(0).shape.where((e) => e != null).reduce((value, element) => value * element);
//
//     ByteBuffer bufferOutput = Int8List(outputSize*4).buffer;
//
//     // Run inference and gather results.
//     interpreter.run(bufferInput, bufferOutput);
//
//     String labelsContent = await rootBundle.loadString('assets/labels.txt');
//     // print(labelsContent);
//     List<String> labels = labelsContent.split('\n');
//     // print(labels);
//
//
//     int labelIndex = Int32List.view(bufferOutput)[0];
//     // print(labelIndex);
//
//
//     if(labelIndex >= labels.length) {
//       output.value="No result found.";
//       return;
//     }
//
//     output.value = labels[0].toString().split(' ')[1];
//   }

  void sechanShowBottomSheet() {
    Get.bottomSheet(
        SizedBox(
          height: 100.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 16.w),
              TextButton(
                onPressed: () {
                  pickCarema();
                },
                child: Text('카메라',
                  style: TextStyle(fontSize: 30.sp, color: Colors.black)
                ),
              ),
              Text("  |  ", style: TextStyle(fontSize: 30.sp)),
              TextButton(
                onPressed: () {
                  pickGallery();
                },
                child: Text('갤러리',
                    style: TextStyle(fontSize: 30.sp, color: Colors.black)
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white);
  }


// 카메라로 사진 찍는 함수
  pickCarema() async {
    var pickedImage = await ImagePicker().pickImage(source : ImageSource.camera);
    if (pickedImage == null)
      return null;
    // Convert XFile to File
    image.value = File(pickedImage.path);
    output.value = "광안리";
    // loadModelAndClassifyImage(image.value);
  }

// 카메라로 사진 찍는 함수
  pickGallery() async {
    var pickedImage = await ImagePicker().pickImage(source : ImageSource.gallery);
    if (pickedImage == null)
      return null;
    // Convert XFile to File
    image.value = File(pickedImage.path);
    output.value = "광안리";
    // loadModelAndClassifyImage(image.value);
  }

}
