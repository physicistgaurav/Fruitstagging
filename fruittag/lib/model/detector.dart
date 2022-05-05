import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
//import 'package:flutter_file_utils/flutter_file_utils.dart';
import 'dart:io' as io;
import 'package:image/image.dart' as img;

class Detector {
  Detector();
  detectImage(XFile image) async {
    //to get image into Uint8List
    io.File _file = io.File(image.path);
    img.Image imageTemp = img.decodeImage(_file.readAsBytesSync())!;
    img.Image resizedImg = img.copyResize(imageTemp, height: 224, width: 224);
    var imgBytes = resizedImg.getBytes();
    var imgAsList = imgBytes.buffer.asUint8List();

    return getPred(imgAsList);
  }

  Future<String> loadLables() async {
    return await rootBundle.loadString('assets/lables.txt');
  }

  Future<String> getPred(Uint8List imgAsList) async {
    List resultBytes = List.filled(224 * 224 * 3, 0);

    int index = 0;
    for (int i = 0; i < imgAsList.lengthInBytes; i += 4) {
      resultBytes[index] = ((imgAsList[i]) / 255.0);
      resultBytes[index + 1] = ((imgAsList[i + 1]) / 255.0);
      resultBytes[index + 2] = ((imgAsList[i + 2]) / 255.0);
      index += 3;
    }
    var input = resultBytes.reshape([1, 224, 224, 3]);
    var output = List.filled(1 * 36, 0).reshape([1, 36]);

    InterpreterOptions interpreterOptions = InterpreterOptions();
    final lables = await loadLables();
    final splited_lables = lables.split('\n');
    try {
      Interpreter interpreter = await Interpreter.fromAsset(
          "tf_lite_model.tflite",
          options: interpreterOptions);
      interpreter.run(input, output);
      //List<String> labels = await FileUtil.loadLabels("assets/labels.txt");
    } catch (e) {
      print("Error Loading Model or running model");
    }
    double highestProb = 0;
    String Pred = "";
    for (int i = 0; i < output[0].length; i++) {
      if (output[0][i] > highestProb) {
        highestProb = output[0][i];
        Pred = splited_lables[i];
      }
    }
    return Pred;
  }
}
