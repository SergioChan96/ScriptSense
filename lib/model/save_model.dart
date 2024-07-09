import "package:flutter/widgets.dart";

class SaveModel {
  Image image;
  String result;
  String date;
  SaveModel(this.image, this.result, this.date);

  String toString() {
    return "save: ${image.height}:${image.width} -> ${result}";
  }
}