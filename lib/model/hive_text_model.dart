import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'hive_text_model.g.dart';
//part 'hive_text_model.freezed.dart';

//@freezed
@HiveType(typeId: 0)
class HiveTextModel extends HiveObject {
  @HiveField(0)
  final String originalText;

  @HiveField(1)
  final String translatedText;

  @HiveField(2)
  final String scanDate;

  @HiveField(3)
  late final bool isFavorite;

  HiveTextModel(this.originalText, this.translatedText, this.scanDate, {this.isFavorite = false});
}

/*@freezed
class HiveTextModel with _$HiveTextModel {
  @HiveType(typeId: 0, adapterName: 'HiveTextModelAdapter')
  const factory HiveTextModel({
    @HiveField(0) required String originalText,
    @HiveField(1) required String translatedText,
    @HiveField(2) required String scanDate,
  }) = _HiveTextModel;
}*/