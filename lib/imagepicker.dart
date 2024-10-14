import 'package:dax/dax.dart';
import 'package:dax_flutter/utils.dart';
import 'package:image_picker/image_picker.dart';

class IImagePicker implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return ImagePickerIns();
  }
}

class ImagePickerXfile implements LoxGetCallable {
  final XFile xfile;
  ImagePickerXfile(this.xfile);
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'path':
        return xfile.path;
      case 'name':
        return xfile.name;
      case 'legnth':
        return xfile.length;
      case 'mimeType':
        return xfile.mimeType;
      case 'readAsBytes':
        return xfile.readAsBytes;
    }
  }
}

class PickImage implements DaxCallable {
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
    return picker
        .pickImage(
            source: source as ImageSource,
            maxHeight: maxHeight,
            maxWidth: maxWidth)
        .then((value) {
      if (value == null) return value;
      return ImagePickerXfile(value);
    });
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
