import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scriptsense/model/hive_text_model.dart';

part 'hive_controller.g.dart';

@riverpod
class HiveController extends _$HiveController {

  @override
  Future<Box<HiveTextModel>> build() async {
    return await Hive.openBox<HiveTextModel>('scannedTexts');
  }
}

