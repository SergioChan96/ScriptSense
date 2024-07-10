import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:opencv_dart/opencv_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:scriptsense/model/result_model.dart';
import 'package:scriptsense/services/segmenter.dart';
import 'package:scriptsense/ui/pages/result_page.dart';

import '../model/hive_text_model.dart';
import '../model/save_model.dart';
import '../services/interfaces/isegmenter.dart';
import '../services/interfaces/itranslation_service.dart';
import '../services/translation_service.dart';

part 'result_controller.g.dart';

@riverpod
class ResultController extends _$ResultController implements IResultController {
  bool AnalysnotStarted = true;
  bool selectAll = false;
  List<SaveModel> savedItems = [];
  List<bool> saved = [];
  final String currentDate = DateFormat('d/M/y').format(DateTime.now());

  void toggleSelectAll() {
    selectAll = !selectAll;
    for (int i = 0; i < saved.length; i++) {
      saved[i] = selectAll;
    }
    state = state.copyWith();
  }

  @override
  ResultModel build() {
    return ResultModel.initial();
  }

  @override
  Future<void> startAnalysisofImage(String image) async {
    Mat matImage = convertStringtoImage(image);
    ISegmenter seg = Segmenter();
    state = state.copyWith(lines: await seg.segmentImage(matImage));
    saved = List.filled(state.lines.length, false);
    Map<Mat, String> map = Map();
    for (Mat mat in state.lines) {
      map[mat] = await seg.detectChar(mat);
      state = state.copyWith(identifiedImages: map);
    }
  }

  @override
  Mat convertStringtoImage(String image) {
    Uint8List imageData = base64Decode(image);
    return imdecode(imageData, IMREAD_GRAYSCALE);
  }
  @override
  Future<void> debugLines() async {
    Segmenter seg = Segmenter();
    List<Mat> lines = await seg.segmentImage(await seg.loadImage());
    List<Mat> debug = [];
    for (Mat line in lines) {
      debug.add(seg.debugDetect(line));
    }
    state = state.copyWith(lines: debug);
  }

  Future<String> _translate(String result) async {
    final ITranslationService _translationService = TranslationService();
    try {
      final translatedText = await _translationService.translate('zh-CN', 'de', result);
      return translatedText;
    } catch (e, s) {
      print('Failed to translate text: $e');
      print('Error Type: ${e.runtimeType}');
      print('Stack trace: $s');
      return result;
    }
  }
  @override
  Future<void> save() async {
    final box = Hive.box<HiveTextModel>('scannedTexts');
    Iterable<Mat> mats = state.identifiedImages.keys;
    final exampleHiveTextModel = HiveTextModel("lol", "xD", "31/12/2023"); //for testing the date sorting filter
    for (int i = 0; i < saved.length; i++) {
      if (saved[i]) {
        print("index: $i, Text: ${state.identifiedImages[mats.elementAt(i)]!}");
        String originalText = state.identifiedImages[mats.elementAt(i)]!;
        String translatedText = await _translate(originalText);
        final hiveTextModel = HiveTextModel(originalText, translatedText, currentDate);
        box.add(hiveTextModel);
      }
      box.add(exampleHiveTextModel);
    }
  }


  @override
  void toggle(int index) {
    List<Mat> keys = state.identifiedImages.keys.toList();
    Mat mat = keys[index];
    String identifiedImage = state.identifiedImages[mat]!;
    SaveModel item = SaveModel(Image.memory(imencode(ImageFormat.jpg.ext, mat)), identifiedImage, currentDate);
    savedItems.add(item);
    state = state.copyWith();
    saved[index] = !saved[index];
    state = state.copyWith(lines: state.lines, identifiedImages: state.identifiedImages);
  }
}
