import 'package:dax/dax.dart';
import 'package:dax_flutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IImagePicker implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return ImagePickerIns();
  }
}

class PickImage implements LoxFlutterFunction {
  final ImagePicker picker;

  PickImage(this.picker);
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? maxWidth = parseDouble(namedArguments[const Symbol('maxWidth')]);
    double? maxHeight = parseDouble(namedArguments[const Symbol('maxHeight')]);
    var source = namedArguments[const Symbol('source')];
    if (source == null) {
      throw "source required in ImagePicker";
    }
    return picker.pickImage(
        source: source as ImageSource,
        maxHeight: maxHeight,
        maxWidth: maxWidth).then((value) => value?.path);
  }
}

class ImagePickerIns extends ImagePicker implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'pickImage':
        return PickImage(this);
      case 'pickVideo':
        return ImagePicker();
      case 'pickMultiImage':
        return ImagePicker();
      case 'pickMultiVideo':
        return ImagePicker();
    }
  }
}
