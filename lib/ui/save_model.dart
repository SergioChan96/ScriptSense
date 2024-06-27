import "package:flutter/widgets.dart";

class SaveModel {
  Image image;
  String result;
  SaveModel(this.image, this.result);

  String toString() {
    return "save: ${image.height}:${image.width} -> ${result}";
  }
}