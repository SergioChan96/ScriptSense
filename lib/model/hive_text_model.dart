import 'package:hive/hive.dart';

part 'hive_text_model.g.dart';

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