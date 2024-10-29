import 'dart:typed_data';
import 'package:dax/dax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'utils.dart';
import 'datepicker.dart';
import 'main.dart';
import 'chart.dart';

class IText implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    TextStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as TextStyle;
    }
    TextAlign? textAlign;
    var textAlignParsed = namedArguments[const Symbol('textAlign')];
    if (textAlignParsed != null) {
      textAlign = textAlignParsed as TextAlign;
    }
    TextDirection? textDirection;
    var textDirectionParsed = namedArguments[const Symbol('textDirection')];
    if (textDirectionParsed != null) {
      textDirection = textDirectionParsed as TextDirection;
    }
    bool? softWrap;
    var softWrapParsed = namedArguments[const Symbol('softWrap')];
    if (softWrapParsed != null) {
      softWrap = softWrapParsed as bool;
    }
    TextOverflow? overflow;
    var overflowParsed = namedArguments[const Symbol('overflow')];
    if (overflowParsed != null) {
      overflow = overflowParsed as TextOverflow;
    }
    int? maxLines;
    var maxLinesParsed = namedArguments[const Symbol('maxLines')];
    if (maxLinesParsed != null) {
      maxLines = maxLinesParsed as int;
    }
    return Text(
      arguments.first as String,
      textDirection: textDirection,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      style: style,
    );
  }
}

class ElevatedButtonStyleBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color? primary;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as Color;
    }
    Color? shadowColor;
    var shadowColorParsed = namedArguments[const Symbol('shadowColor')];
    if (shadowColorParsed != null) {
      shadowColor = shadowColorParsed as Color;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    TextStyle? textStyle;
    var textStyleParsed = namedArguments[const Symbol('textStyle')];
    if (textStyleParsed != null) {
      textStyle = textStyleParsed as TextStyle;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    BorderSide? side;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    Size? minimumSize;
    var minimumSizeParsed = namedArguments[const Symbol('minimumSize')];
    if (minimumSizeParsed != null) {
      minimumSize = minimumSizeParsed as Size;
    }
    Size? maximumSize;
    var maximumSizeParsed = namedArguments[const Symbol('maximumSize')];
    if (maximumSizeParsed != null) {
      maximumSize = maximumSizeParsed as Size;
    }
    Size? fixedSize;
    var fixedSizeParsed = namedArguments[const Symbol('fixedSize')];
    if (fixedSizeParsed != null) {
      fixedSize = fixedSizeParsed as Size;
    }
    OutlinedBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as OutlinedBorder;
    }
    AlignmentGeometry? alignment;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as AlignmentGeometry;
    }
    return ElevatedButton.styleFrom(
        primary: primary,
        shadowColor: shadowColor,
        elevation: elevation,
        textStyle: textStyle,
        alignment: alignment,
        side: side,
        shape: shape,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        fixedSize: fixedSize,
        padding: padding);
  }
}

class ElevatedButtonIconBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var icon = namedArguments[const Symbol('icon')];
    if (icon == null) {
      throw "icon required in TextButton.icon";
    }
    var label = namedArguments[const Symbol('label')];
    if (label == null) {
      throw "label required in TextButton.icon";
    }
    ButtonStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as ButtonStyle;
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in TextButton";
    }
    bool? autofocus;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    return ElevatedButton.icon(
        icon: icon as Widget,
        label: label as Widget,
        autofocus: autofocus,
        style: style,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class IPreferredSize implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var preferredSize = namedArguments[const Symbol('preferredSize')];
    if (preferredSize == null) {
      throw "preferredSize required in PreferredSizeWidget";
    }
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in PreferredSizeWidget";
    }
    return PreferredSize(
        child: child as Widget, preferredSize: preferredSize as Size);
  }
}

class IElevatedButton implements DaxCallable, LoxGetCallable {
  final builder = ElevatedButtonStyleBuilder();
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'styleFrom':
        return builder;
      case 'icon':
        return ElevatedButtonIconBuilder();
    }
    throw "Unknown property: ${name.lexeme}";
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in ElevatedButton";
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in ElevatedButton";
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    ButtonStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as ButtonStyle;
    }
    return ElevatedButton(
        child: child as Widget,
        autofocus: autofocus,
        style: style,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class OutlinedButtonStyleBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color? primary;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as Color;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    Color? shadowColor;
    var shadowColorParsed = namedArguments[const Symbol('shadowColor')];
    if (shadowColorParsed != null) {
      shadowColor = shadowColorParsed as Color;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    TextStyle? textStyle;
    var textStyleParsed = namedArguments[const Symbol('textStyle')];
    if (textStyleParsed != null) {
      textStyle = textStyleParsed as TextStyle;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    BorderSide? side;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    Size? minimumSize;
    var minimumSizeParsed = namedArguments[const Symbol('minimumSize')];
    if (minimumSizeParsed != null) {
      minimumSize = minimumSizeParsed as Size;
    }
    Size? maximumSize;
    var maximumSizeParsed = namedArguments[const Symbol('maximumSize')];
    if (maximumSizeParsed != null) {
      maximumSize = maximumSizeParsed as Size;
    }
    Size? fixedSize;
    var fixedSizeParsed = namedArguments[const Symbol('fixedSize')];
    if (fixedSizeParsed != null) {
      fixedSize = fixedSizeParsed as Size;
    }
    OutlinedBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as OutlinedBorder;
    }
    AlignmentGeometry? alignment;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as AlignmentGeometry;
    }
    return OutlinedButton.styleFrom(
        primary: primary,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        elevation: elevation,
        textStyle: textStyle,
        side: side,
        shape: shape,
        alignment: alignment,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        fixedSize: fixedSize,
        padding: padding);
  }
}

class OutlinedButtonIconBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var icon = namedArguments[const Symbol('icon')];
    if (icon == null) {
      throw "icon required in TextButton.icon";
    }
    var label = namedArguments[const Symbol('label')];
    if (label == null) {
      throw "label required in TextButton.icon";
    }
    ButtonStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as ButtonStyle;
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in TextButton";
    }
    bool? autofocus;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    return OutlinedButton.icon(
        icon: icon as Widget,
        label: label as Widget,
        autofocus: autofocus,
        style: style,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class IOutlinedButton implements DaxCallable, LoxGetCallable {
  final builder = OutlinedButtonStyleBuilder();
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'styleFrom':
        return builder;
      case 'icon':
        return OutlinedButtonIconBuilder();
    }
    throw "Unknown property: ${name.lexeme}";
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in OutlinedButton";
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in OutlinedButton";
    }
    ButtonStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as ButtonStyle;
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    return OutlinedButton(
        child: child as Widget,
        autofocus: autofocus,
        style: style,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class TextButtonStyleBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color? primary;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as Color;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    Color? shadowColor;
    var shadowColorParsed = namedArguments[const Symbol('shadowColor')];
    if (shadowColorParsed != null) {
      shadowColor = shadowColorParsed as Color;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    TextStyle? textStyle;
    var textStyleParsed = namedArguments[const Symbol('textStyle')];
    if (textStyleParsed != null) {
      textStyle = textStyleParsed as TextStyle;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    BorderSide? side;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    Size? minimumSize;
    var minimumSizeParsed = namedArguments[const Symbol('minimumSize')];
    if (minimumSizeParsed != null) {
      minimumSize = minimumSizeParsed as Size;
    }
    Size? maximumSize;
    var maximumSizeParsed = namedArguments[const Symbol('maximumSize')];
    if (maximumSizeParsed != null) {
      maximumSize = maximumSizeParsed as Size;
    }
    Size? fixedSize;
    var fixedSizeParsed = namedArguments[const Symbol('fixedSize')];
    if (fixedSizeParsed != null) {
      fixedSize = fixedSizeParsed as Size;
    }
    OutlinedBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as OutlinedBorder;
    }
    AlignmentGeometry? alignment;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as AlignmentGeometry;
    }
    return TextButton.styleFrom(
        primary: primary,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        elevation: elevation,
        textStyle: textStyle,
        side: side,
        shape: shape,
        alignment: alignment,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        fixedSize: fixedSize,
        padding: padding);
  }
}

class TextButtonIconBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var icon = namedArguments[const Symbol('icon')];
    if (icon == null) {
      throw "icon required in TextButton.icon";
    }
    var label = namedArguments[const Symbol('label')];
    if (label == null) {
      throw "label required in TextButton.icon";
    }
    ButtonStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as ButtonStyle;
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in TextButton";
    }
    bool? autofocus;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    return TextButton.icon(
        icon: icon as Widget,
        label: label as Widget,
        autofocus: autofocus,
        style: style,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class ITextButton implements DaxCallable, LoxGetCallable {
  final builder = TextButtonStyleBuilder();
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'styleFrom':
        return builder;
      case 'icon':
        return TextButtonIconBuilder();
    }
    throw "Unknown property: ${name.lexeme}";
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in TextButton";
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in TextButton";
    }
    ButtonStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as ButtonStyle;
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    return TextButton(
        child: child as Widget,
        style: style,
        autofocus: autofocus,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class IIcon implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "icon required in Icon";
    }
    var icon = arguments[0];
    double? size = parseDouble(namedArguments[const Symbol('size')]);
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    return Icon(icon as IconData, size: size, color: color);
  }
}

class IIconButton implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var icon = namedArguments[const Symbol('icon')];
    if (icon == null) {
      throw "icon required in IconButton";
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in IconButton";
    }
    double iconSize =
        parseDouble(namedArguments[const Symbol('iconSize')]) ?? 24;
    EdgeInsetsGeometry padding = const EdgeInsets.all(8);
    var paddingParse = namedArguments[const Symbol('padding')];
    if (paddingParse != null) {
      padding = paddingParse as EdgeInsetsGeometry;
    }
    AlignmentGeometry alignment = Alignment.center;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    BoxConstraints? constraints;
    var constraintsParse = namedArguments[const Symbol('constraints')];
    if (constraintsParse != null) {
      constraints = constraintsParse as BoxConstraints;
    }
    bool autofocus = false;
    var autofocusParse = namedArguments[const Symbol('autofocus')];
    if (autofocusParse != null) {
      autofocus = autofocusParse as bool;
    }
    Color? color;
    var colorParse = namedArguments[const Symbol('color')];
    if (colorParse != null) {
      color = colorParse as Color;
    }
    Color? disabledColor;
    var disabledColorParse = namedArguments[const Symbol('disabledColor')];
    if (disabledColorParse != null) {
      disabledColor = disabledColorParse as Color;
    }
    Color? splashColor;
    var splashColorParse = namedArguments[const Symbol('splashColor')];
    if (splashColorParse != null) {
      splashColor = splashColorParse as Color;
    }
    Color? focusColor;
    var focusColorParse = namedArguments[const Symbol('focusColor')];
    if (focusColorParse != null) {
      focusColor = focusColorParse as Color;
    }
    return IconButton(
        icon: icon as Widget,
        iconSize: iconSize,
        autofocus: autofocus,
        constraints: constraints,
        padding: padding,
        color: color,
        disabledColor: disabledColor,
        focusColor: focusColor,
        splashColor: splashColor,
        alignment: alignment,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class IBackButton implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    Function()? onPressed;
    var onPressedParsed = namedArguments[const Symbol('onPressed')];
    if (onPressedParsed != null) {
      onPressed = () {
        (onPressedParsed as LoxFunction).call(interpreter, [], {});
      };
    }
    return BackButton(
      color: color,
      onPressed: onPressed,
    );
  }
}

class IDecorationImage implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var image = namedArguments[const Symbol('image')];
    if (image == null) {
      throw "image required in DecorationImage";
    }
    BoxFit? fit;
    var fitParsed = namedArguments[const Symbol('fit')];
    if (fitParsed != null) {
      fit = fitParsed as BoxFit;
    }
    double scale = parseDouble(namedArguments[const Symbol('scale')]) ?? 1.0;
    ImageRepeat repeat = ImageRepeat.noRepeat;
    var repeatParsed = namedArguments[const Symbol('repeat')];
    if (repeatParsed != null) {
      repeat = repeatParsed as ImageRepeat;
    }
    AlignmentGeometry alignment = Alignment.center;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    return DecorationImage(
        repeat: repeat,
        alignment: alignment,
        image: image as ImageProvider,
        fit: fit,
        scale: scale);
  }
}

class MemoryImageBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double scale = parseDouble(namedArguments[const Symbol('scale')]) ?? 1.0;
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    BoxFit? fit;
    var fitParsed = namedArguments[const Symbol('fit')];
    if (fitParsed != null) {
      fit = fitParsed as BoxFit;
    }
    Color? color;
    var colorParse = namedArguments[const Symbol('color')];
    if (colorParse != null) {
      color = colorParse as Color;
    }
    AlignmentGeometry alignment = Alignment.center;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    BlendMode? blendMode;
    var blendModeParse = namedArguments[const Symbol('blendMode')];
    if (blendModeParse != null) {
      blendMode = blendModeParse as BlendMode;
    }
    ImageRepeat repeat = ImageRepeat.noRepeat;
    var repeatParse = namedArguments[const Symbol('repeat')];
    if (repeatParse != null) {
      repeat = repeatParse as ImageRepeat;
    }
    bool matchTextDirection = false;
    var matchTextDirectionParse =
        namedArguments[const Symbol('matchTextDirection')];
    if (matchTextDirectionParse != null) {
      matchTextDirection = matchTextDirectionParse as bool;
    }
    bool isAntiAlias = false;
    var isAntiAliasParse = namedArguments[const Symbol('isAntiAlias')];
    if (isAntiAliasParse != null) {
      isAntiAlias = isAntiAliasParse as bool;
    }
    FilterQuality filterQuality = FilterQuality.low;
    var filterQualityParse = namedArguments[const Symbol('filterQuality')];
    if (filterQualityParse != null) {
      filterQuality = filterQualityParse as FilterQuality;
    }
    return Image.memory(
      arguments[0] as Uint8List,
      scale: scale,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      isAntiAlias: isAntiAlias,
      color: color,
      colorBlendMode: blendMode,
      filterQuality: filterQuality,
    );
  }
}

class NetworkImageBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double scale = parseDouble(namedArguments[const Symbol('scale')]) ?? 1.0;

    double? height = parseDouble(namedArguments[const Symbol('height')]);
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    BoxFit? fit;
    var fitParsed = namedArguments[const Symbol('fit')];
    if (fitParsed != null) {
      fit = fitParsed as BoxFit;
    }
    Color? color;
    var colorParse = namedArguments[const Symbol('color')];
    if (colorParse != null) {
      color = colorParse as Color;
    }
    AlignmentGeometry alignment = Alignment.center;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    BlendMode? blendMode;
    var blendModeParse = namedArguments[const Symbol('blendMode')];
    if (blendModeParse != null) {
      blendMode = blendModeParse as BlendMode;
    }
    ImageRepeat repeat = ImageRepeat.noRepeat;
    var repeatParse = namedArguments[const Symbol('repeat')];
    if (repeatParse != null) {
      repeat = repeatParse as ImageRepeat;
    }
    bool matchTextDirection = false;
    var matchTextDirectionParse =
        namedArguments[const Symbol('matchTextDirection')];
    if (matchTextDirectionParse != null) {
      matchTextDirection = matchTextDirectionParse as bool;
    }
    bool isAntiAlias = false;
    var isAntiAliasParse = namedArguments[const Symbol('isAntiAlias')];
    if (isAntiAliasParse != null) {
      isAntiAlias = isAntiAliasParse as bool;
    }
    FilterQuality filterQuality = FilterQuality.low;
    var filterQualityParse = namedArguments[const Symbol('filterQuality')];
    if (filterQualityParse != null) {
      filterQuality = filterQualityParse as FilterQuality;
    }
    Map<String, String>? headers;
    var headersParse = namedArguments[const Symbol('headers')];
    if (headersParse != null) {
      headers = headersParse as Map<String, String>;
    }
    return Image.network(
      arguments[0] as String,
      scale: scale,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      isAntiAlias: isAntiAlias,
      color: color,
      headers: headers,
      colorBlendMode: blendMode,
      filterQuality: filterQuality,
    );
  }
}

class AssetImageBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double scale = parseDouble(namedArguments[const Symbol('scale')]) ?? 1.0;

    double? height = parseDouble(namedArguments[const Symbol('height')]);
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    BoxFit? fit;
    var fitParsed = namedArguments[const Symbol('fit')];
    if (fitParsed != null) {
      fit = fitParsed as BoxFit;
    }
    Color? color;
    var colorParse = namedArguments[const Symbol('color')];
    if (colorParse != null) {
      color = colorParse as Color;
    }
    AlignmentGeometry alignment = Alignment.center;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    BlendMode? blendMode;
    var blendModeParse = namedArguments[const Symbol('blendMode')];
    if (blendModeParse != null) {
      blendMode = blendModeParse as BlendMode;
    }
    ImageRepeat repeat = ImageRepeat.noRepeat;
    var repeatParse = namedArguments[const Symbol('repeat')];
    if (repeatParse != null) {
      repeat = repeatParse as ImageRepeat;
    }
    bool matchTextDirection = false;
    var matchTextDirectionParse =
        namedArguments[const Symbol('matchTextDirection')];
    if (matchTextDirectionParse != null) {
      matchTextDirection = matchTextDirectionParse as bool;
    }
    bool isAntiAlias = false;
    var isAntiAliasParse = namedArguments[const Symbol('isAntiAlias')];
    if (isAntiAliasParse != null) {
      isAntiAlias = isAntiAliasParse as bool;
    }
    FilterQuality filterQuality = FilterQuality.low;
    var filterQualityParse = namedArguments[const Symbol('filterQuality')];
    if (filterQualityParse != null) {
      filterQuality = filterQualityParse as FilterQuality;
    }
    return Image.asset(
      arguments[0] as String,
      scale: scale,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      isAntiAlias: isAntiAlias,
      color: color,
      colorBlendMode: blendMode,
      filterQuality: filterQuality,
    );
  }
}

class IImage implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'memory':
        return MemoryImageBuilder();
      case 'asset':
        return AssetImageBuilder();
      case 'network':
        return NetworkImageBuilder();
    }
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var imageParsed = namedArguments[const Symbol('image')];
    if (imageParsed == null) {
      throw "image required in Image";
    }
    ImageProvider image = imageParsed as ImageProvider;
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    BoxFit? fit;
    var fitParsed = namedArguments[const Symbol('fit')];
    if (fitParsed != null) {
      fit = fitParsed as BoxFit;
    }
    Color? color;
    var colorParse = namedArguments[const Symbol('color')];
    if (colorParse != null) {
      color = colorParse as Color;
    }
    AlignmentGeometry alignment = Alignment.center;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    BlendMode? blendMode;
    var blendModeParse = namedArguments[const Symbol('blendMode')];
    if (blendModeParse != null) {
      blendMode = blendModeParse as BlendMode;
    }
    ImageRepeat repeat = ImageRepeat.noRepeat;
    var repeatParse = namedArguments[const Symbol('repeat')];
    if (repeatParse != null) {
      repeat = repeatParse as ImageRepeat;
    }
    bool matchTextDirection = false;
    var matchTextDirectionParse =
        namedArguments[const Symbol('matchTextDirection')];
    if (matchTextDirectionParse != null) {
      matchTextDirection = matchTextDirectionParse as bool;
    }
    bool isAntiAlias = false;
    var isAntiAliasParse = namedArguments[const Symbol('isAntiAlias')];
    if (isAntiAliasParse != null) {
      isAntiAlias = isAntiAliasParse as bool;
    }
    FilterQuality filterQuality = FilterQuality.low;
    var filterQualityParse = namedArguments[const Symbol('filterQuality')];
    if (filterQualityParse != null) {
      filterQuality = filterQualityParse as FilterQuality;
    }
    return Image(
      image: image,
      height: height,
      width: width,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      filterQuality: filterQuality,
      isAntiAlias: isAntiAlias,
      alignment: alignment,
      colorBlendMode: blendMode,
      color: color,
      fit: fit,
    );
  }
}

class ICupertinoActivityIndicator implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double radius = parseDouble(namedArguments[const Symbol('radius')]) ?? 10;
    return CupertinoActivityIndicator(
      radius: radius,
    );
  }
}

class ICircularProgressIndicator implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double strokeWidth =
        parseDouble(namedArguments[const Symbol('strokeWidth')]) ?? 4;
    double? value = parseDouble(namedArguments[const Symbol('value')]);
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
      value: value,
      color: color,
      backgroundColor: backgroundColor,
    );
  }
}

class SwitchAdaptive implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var value = namedArguments[const Symbol('value')];
    if (value == null) {
      throw "value required in Switch";
    }
    var onChanged = namedArguments[const Symbol('onChanged')];
    if (onChanged == null) {
      throw "onChanged required in Switch";
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    double? splashRadius =
        parseDouble(namedArguments[const Symbol('splashRadius')]);
    Color? activeColor;
    var activeColorParsed = namedArguments[const Symbol('activeColor')];
    if (activeColorParsed != null) {
      activeColor = activeColorParsed as Color;
    }
    Color? activeTrackColor;
    var activeTrackColorParsed = namedArguments[const Symbol('inactiveColor')];
    if (activeTrackColorParsed != null) {
      activeTrackColor = activeTrackColorParsed as Color;
    }
    Color? inactiveThumbColor;
    var inactiveThumbColorParsed = namedArguments[const Symbol('hoverColor')];
    if (inactiveThumbColorParsed != null) {
      inactiveThumbColor = inactiveThumbColorParsed as Color;
    }
    Color? inactiveTrackColor;
    var inactiveTrackColorParsed = namedArguments[const Symbol('focusColor')];
    if (inactiveTrackColorParsed != null) {
      inactiveTrackColor = inactiveTrackColorParsed as Color;
    }
    Color? focusColor;
    var focusColorParse = namedArguments[const Symbol('focusColor')];
    if (focusColorParse != null) {
      focusColor = focusColorParse as Color;
    }
    return Switch.adaptive(
        value: value as bool,
        splashRadius: splashRadius,
        autofocus: autofocus,
        focusColor: focusColor,
        activeColor: activeColor,
        activeTrackColor: activeTrackColor,
        inactiveThumbColor: inactiveThumbColor,
        inactiveTrackColor: inactiveTrackColor,
        onChanged: (value) {
          (onChanged as LoxFunction).call(interpreter, [value], {});
        });
  }
}

class ISwitch implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    if (name.lexeme == "adaptive") {
      return SwitchAdaptive();
    }
    throw "Unknown property: ${name.lexeme}";
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var value = namedArguments[const Symbol('value')];
    if (value == null) {
      throw "value required in Switch";
    }
    var onChanged = namedArguments[const Symbol('onChanged')];
    if (onChanged == null) {
      throw "onChanged required in Switch";
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    double? splashRadius =
        parseDouble(namedArguments[const Symbol('splashRadius')]);
    Color? activeColor;
    var activeColorParsed = namedArguments[const Symbol('activeColor')];
    if (activeColorParsed != null) {
      activeColor = activeColorParsed as Color;
    }
    Color? activeTrackColor;
    var activeTrackColorParsed = namedArguments[const Symbol('inactiveColor')];
    if (activeTrackColorParsed != null) {
      activeTrackColor = activeTrackColorParsed as Color;
    }
    Color? inactiveThumbColor;
    var inactiveThumbColorParsed = namedArguments[const Symbol('hoverColor')];
    if (inactiveThumbColorParsed != null) {
      inactiveThumbColor = inactiveThumbColorParsed as Color;
    }
    Color? inactiveTrackColor;
    var inactiveTrackColorParsed = namedArguments[const Symbol('focusColor')];
    if (inactiveTrackColorParsed != null) {
      inactiveTrackColor = inactiveTrackColorParsed as Color;
    }
    Color? focusColor;
    var focusColorParse = namedArguments[const Symbol('focusColor')];
    if (focusColorParse != null) {
      focusColor = focusColorParse as Color;
    }
    return Switch(
      value: value as bool,
      splashRadius: splashRadius,
      autofocus: autofocus,
      focusColor: focusColor,
      activeColor: activeColor,
      activeTrackColor: activeTrackColor,
      inactiveThumbColor: inactiveThumbColor,
      inactiveTrackColor: inactiveTrackColor,
      onChanged: (bool value) {
        (onChanged as LoxFunction).call(interpreter, [value], {});
      },
    );
  }
}

class ISlider implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var value = namedArguments[const Symbol('value')];
    if (value == null) {
      throw "value required in Slider";
    }
    var onChanged = namedArguments[const Symbol('onChanged')];
    if (onChanged == null) {
      throw "onChanged required in Slider";
    }
    double min = parseDouble(namedArguments[const Symbol('min')]) ?? 0;
    double max = parseDouble(namedArguments[const Symbol('max')]) ?? 1;
    int? divisions;
    var divisionsParse = namedArguments[const Symbol('divisions')];
    if (divisionsParse != null) {
      divisions = divisionsParse as int;
    }
    String? label;
    var labelParse = namedArguments[const Symbol('label')];
    if (labelParse != null) {
      label = labelParse as String;
    }
    Color? activeColor;
    var activeColorParse = namedArguments[const Symbol('activeColor')];
    if (activeColorParse != null) {
      activeColor = activeColorParse as Color;
    }
    Color? inactiveColor;
    var inactiveColorParse = namedArguments[const Symbol('inactiveColor')];
    if (inactiveColorParse != null) {
      inactiveColor = inactiveColorParse as Color;
    }
    Color? thumbColor;
    var thumbColorParse = namedArguments[const Symbol('thumbColor')];
    if (thumbColorParse != null) {
      thumbColor = thumbColorParse as Color;
    }
    bool autofocus = false;
    var autofocusParse = namedArguments[const Symbol('autofocus')];
    if (autofocusParse != null) {
      autofocus = autofocusParse as bool;
    }
    return Slider(
      value: value as double,
      min: min,
      max: max,
      divisions: divisions,
      label: label,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      thumbColor: thumbColor,
      autofocus: autofocus,
      onChanged: (value) {
        (onChanged as LoxFunction).call(interpreter, [value], {});
      },
    );
  }
}

class IRadio implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var value = namedArguments[const Symbol('value')];
    if (value == null) {
      throw "value required in Radio";
    }
    var groupValue = namedArguments[const Symbol('groupValue')];
    if (groupValue == null) {
      throw "groupValue required in Radio";
    }
    var onChanged = namedArguments[const Symbol('onChanged')];
    if (onChanged == null) {
      throw "onChanged required in Radio";
    }
    bool toggleable = false;
    var toggleableParse = namedArguments[const Symbol('toggleable')];
    if (toggleableParse != null) {
      toggleable = toggleableParse as bool;
    }
    Color? activeColor;
    var activeColorParse = namedArguments[const Symbol('activeColor')];
    if (activeColorParse != null) {
      activeColor = activeColorParse as Color;
    }
    Color? focusColor;
    var focusColorParse = namedArguments[const Symbol('focusColor')];
    if (focusColorParse != null) {
      focusColor = focusColorParse as Color;
    }
    bool autofocus = false;
    var autofocusParse = namedArguments[const Symbol('autofocus')];
    if (autofocusParse != null) {
      autofocus = autofocusParse as bool;
    }
    double? splashRadius =
        parseDouble(namedArguments[const Symbol('splashRadius')]);
    return Radio(
      value: value,
      toggleable: toggleable,
      focusColor: focusColor,
      activeColor: activeColor,
      groupValue: groupValue,
      splashRadius: splashRadius,
      autofocus: autofocus,
      onChanged: (value) {
        (onChanged as LoxFunction).call(interpreter, [value], {});
      },
    );
  }
}

class ICheckbox implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var value = namedArguments[const Symbol('value')];
    if (value == null) {
      throw "value required in Checkbox";
    }
    var onChanged = namedArguments[const Symbol('onChanged')];
    if (onChanged == null) {
      throw "onChanged required in Checkbox";
    }
    Color? activeColor;
    var activeColorParsed = namedArguments[const Symbol('activeColor')];
    if (activeColorParsed != null) {
      activeColor = activeColorParsed as Color;
    }
    Color? checkColor;
    var checkColorParsed = namedArguments[const Symbol('checkColor')];
    if (checkColorParsed != null) {
      checkColor = checkColorParsed as Color;
    }
    Color? focusColor;
    var focusColorParsed = namedArguments[const Symbol('focusColor')];
    if (focusColorParsed != null) {
      focusColor = focusColorParsed as Color;
    }
    double? splashRadius =
        parseDouble(namedArguments[const Symbol('splashRadius')]);
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    OutlinedBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as OutlinedBorder;
    }
    BorderSide? side;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    return Checkbox(
      value: value as bool,
      activeColor: activeColor,
      checkColor: checkColor,
      focusColor: focusColor,
      autofocus: autofocus,
      shape: shape,
      side: side,
      splashRadius: splashRadius,
      onChanged: (bool? value) {
        (onChanged as LoxFunction).call(interpreter, [value], {});
      },
    );
  }
}

class ITextField implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    TextEditingController? controller;
    var controllerParsed = namedArguments[const Symbol('controller')];
    if (controllerParsed != null) {
      controller = controllerParsed as TextEditingController;
    }
    Function(String)? onChanged;
    var onChangedParsed = namedArguments[const Symbol('onChanged')];
    if (onChangedParsed != null) {
      onChanged = (String value) {
        (onChangedParsed as LoxFunction).call(interpreter, [value], {});
      };
    }
    Function(String)? onSubmitted;
    var onSubmittedParsed = namedArguments[const Symbol('onChanged')];
    if (onSubmittedParsed != null) {
      onSubmitted = (String value) {
        (onSubmitted as LoxFunction).call(interpreter, [value], {});
      };
    }
    InputDecoration? decoration;
    var decorationParsed = namedArguments[const Symbol('decoration')];
    if (decorationParsed != null) {
      decoration = decorationParsed as InputDecoration;
    }
    int maxLines = 1;
    var maxLinesParsed = namedArguments[const Symbol('maxLines')];
    if (maxLinesParsed != null) {
      maxLines = maxLinesParsed as int;
    }
    int? minLines;
    var minLinesParsed = namedArguments[const Symbol('minLines')];
    if (minLinesParsed != null) {
      minLines = minLinesParsed as int;
    }
    TextStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as TextStyle;
    }
    TextInputType? keyboardType;
    var keyboardTypeParsed = namedArguments[const Symbol('keyboardType')];
    if (keyboardTypeParsed != null) {
      keyboardType = keyboardTypeParsed as TextInputType;
    }
    TextAlign textAlign = TextAlign.start;
    var textAlignParsed = namedArguments[const Symbol('textAlign')];
    if (textAlignParsed != null) {
      textAlign = textAlignParsed as TextAlign;
    }
    TextAlignVertical? textAlignVertical;
    var textAlignVerticalParsed =
        namedArguments[const Symbol('textAlignVertical')];
    if (textAlignVerticalParsed != null) {
      textAlignVertical = textAlignVerticalParsed as TextAlignVertical;
    }
    TextDirection? textDirection;
    var textDirectionParsed = namedArguments[const Symbol('textDirection')];
    if (textDirectionParsed != null) {
      textDirection = textDirectionParsed as TextDirection;
    }
    TextInputAction? textInputAction;
    var textInputActionParsed = namedArguments[const Symbol('textInputAction')];
    if (textInputActionParsed != null) {
      textInputAction = textInputActionParsed as TextInputAction;
    }
    TextCapitalization textCapitalization = TextCapitalization.none;
    var textCapitalizationParsed =
        namedArguments[const Symbol('textCapitalization')];
    if (textCapitalizationParsed != null) {
      textCapitalization = textCapitalizationParsed as TextCapitalization;
    }
    bool readOnly = false;
    var readOnlyParsed = namedArguments[const Symbol('readOnly')];
    if (readOnlyParsed != null) {
      readOnly = readOnlyParsed as bool;
    }
    bool? showCursor;
    var showCursorParsed = namedArguments[const Symbol('showCursor')];
    if (showCursorParsed != null) {
      showCursor = showCursorParsed as bool;
    }
    double? cursorHeight =
        parseDouble(namedArguments[const Symbol('cursorHeight')]);
    Radius? cursorRadius;
    var cursorRadiusParsed = namedArguments[const Symbol('cursorRadius')];
    if (cursorRadiusParsed != null) {
      cursorRadius = cursorRadiusParsed as Radius;
    }
    Color? cursorColor;
    var cursorColorParsed = namedArguments[const Symbol('cursorColor')];
    if (cursorColorParsed != null) {
      cursorColor = cursorColorParsed as Color;
    }
    bool? enabled;
    var enabledParsed = namedArguments[const Symbol('enabled')];
    if (enabledParsed != null) {
      enabled = enabledParsed as bool;
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    bool autocorrect = true;
    var autocorrectParsed = namedArguments[const Symbol('autocorrect')];
    if (autocorrectParsed != null) {
      autocorrect = autocorrectParsed as bool;
    }
    bool obscureText = false;
    var obscureTextParsed = namedArguments[const Symbol('obscureText')];
    if (obscureTextParsed != null) {
      obscureText = obscureTextParsed as bool;
    }
    String obscureCharacter = '•';
    var obscureCharacterParsed =
        namedArguments[const Symbol('obscureCharacter')];
    if (obscureCharacterParsed != null) {
      obscureCharacter = obscureCharacterParsed as String;
    }
    bool expands = false;
    var expandsParsed = namedArguments[const Symbol('expands')];
    if (expandsParsed != null) {
      expands = expandsParsed as bool;
    }
    FocusNode? focusNode;
    var focusNodeParsed = namedArguments[const Symbol('focusNode')];
    if (focusNodeParsed != null) {
      focusNode = focusNodeParsed as FocusNode;
    }
    int? maxLength;
    var maxLengthParsed = namedArguments[const Symbol('maxLength')];
    if (maxLengthParsed != null) {
      maxLength = maxLengthParsed as int;
    }
    double cursorWidth =
        parseDouble(namedArguments[const Symbol('cursorWidth')]) ?? 2.0;
    return TextField(
      enabled: enabled,
      autocorrect: autocorrect,
      focusNode: focusNode,
      obscuringCharacter: obscureCharacter,
      autofocus: autofocus,
      obscureText: obscureText,
      controller: controller,
      decoration: decoration,
      textAlign: textAlign,
      expands: expands,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      readOnly: readOnly,
      showCursor: showCursor,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor,
      style: style,
    );
  }
}

class IDivider implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    double? thickness = parseDouble(namedArguments[const Symbol('thickness')]);
    double? indent = parseDouble(namedArguments[const Symbol('indent')]);
    double? endIndent = parseDouble(namedArguments[const Symbol('endIndent')]);
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}

class IVerticalDivider implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    double? thickness = parseDouble(namedArguments[const Symbol('thickness')]);
    double? indent = parseDouble(namedArguments[const Symbol('indent')]);
    double? endIndent = parseDouble(namedArguments[const Symbol('endIndent')]);
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    return VerticalDivider(
      width: width,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}

class IBottomNavigationBarItem implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var icon = namedArguments[const Symbol('icon')];
    if (icon == null) {
      throw "icon required in BottomNavigationBarItem";
    }
    String? label;
    var labelParsed = namedArguments[const Symbol('label')];
    if (labelParsed != null) {
      label = labelParsed as String;
    }
    String? tooltip;
    var tooltipParsed = namedArguments[const Symbol('tooltip')];
    if (tooltipParsed != null) {
      tooltip = tooltipParsed as String;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    Widget? activeIcon;
    var activeIconParsed = namedArguments[const Symbol('activeIcon')];
    if (activeIconParsed != null) {
      activeIcon = activeIconParsed as Widget;
    }
    return BottomNavigationBarItem(
      icon: icon as Widget,
      label: label,
      activeIcon: activeIcon,
      tooltip: tooltip,
      backgroundColor: backgroundColor,
    );
  }
}

class ISimpleDialog implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    List<Widget>? children;
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed != null) {
      children = childrenParsed as List<Widget>;
    }
    Widget? title;
    var titleParsed = namedArguments[const Symbol('title')];
    if (titleParsed != null) {
      title = titleParsed as Widget;
    }
    TextStyle? titleTextStyle;
    var titleTextStyleParsed = namedArguments[const Symbol('titleTextStyle')];
    if (titleTextStyleParsed != null) {
      titleTextStyle = titleTextStyleParsed as TextStyle;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    EdgeInsetsGeometry titlePadding =
        const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0);
    var titlePaddingParsed = namedArguments[const Symbol('titlePadding')];
    if (titlePaddingParsed != null) {
      titlePadding = titlePaddingParsed as EdgeInsetsGeometry;
    }
    EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(0, 12, 0, 16);
    var contentPaddingParsed = namedArguments[const Symbol('contentPadding')];
    if (contentPaddingParsed != null) {
      contentPadding = contentPaddingParsed as EdgeInsetsGeometry;
    }
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    return SimpleDialog(
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      elevation: elevation,
      shape: shape,
      children: children,
    );
  }
}

class IAlertDialog implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? title;
    var titleParsed = namedArguments[const Symbol('title')];
    if (titleParsed != null) {
      title = titleParsed as Widget;
    }
    Widget? content;
    var contentParsed = namedArguments[const Symbol('content')];
    if (contentParsed != null) {
      content = contentParsed as Widget;
    }
    TextStyle? titleTextStyle;
    var titleTextStyleParsed = namedArguments[const Symbol('titleTextStyle')];
    if (titleTextStyleParsed != null) {
      titleTextStyle = titleTextStyleParsed as TextStyle;
    }
    TextStyle? contentTextStyle;
    var contentTextStyleParsed =
        namedArguments[const Symbol('contentTextStyle')];
    if (contentTextStyleParsed != null) {
      contentTextStyle = contentTextStyleParsed as TextStyle;
    }
    List<Widget>? actions;
    var actionsParsed = namedArguments[const Symbol('actions')];
    if (actionsParsed != null) {
      actions = (actionsParsed as List).cast<Widget>();
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    EdgeInsetsGeometry? titlePadding;
    var titlePaddingParsed = namedArguments[const Symbol('titlePadding')];
    if (titlePaddingParsed != null) {
      titlePadding = titlePaddingParsed as EdgeInsetsGeometry;
    }
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.fromLTRB(24, 24, 24, 24);
    var contentPaddingParsed = namedArguments[const Symbol('contentPadding')];
    if (contentPaddingParsed != null) {
      contentPadding = contentPaddingParsed as EdgeInsetsGeometry;
    }
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    bool scrollable = false;
    var scrollableParsed = namedArguments[const Symbol('scrollable')];
    if (scrollableParsed != null) {
      scrollable = scrollableParsed as bool;
    }
    EdgeInsetsGeometry actionsPadding = EdgeInsets.zero;
    var actionsPaddingParsed = namedArguments[const Symbol('actionsPadding')];
    if (actionsPaddingParsed != null) {
      actionsPadding = actionsPaddingParsed as EdgeInsetsGeometry;
    }
    VerticalDirection? actionsOverflowDirection;
    var actionsOverflowDirectionParsed =
        namedArguments[const Symbol('actionsOverflowDirection')];
    if (actionsOverflowDirectionParsed != null) {
      actionsOverflowDirection =
          actionsOverflowDirectionParsed as VerticalDirection;
    }
    double? actionsOverflowButtonSpacing = parseDouble(
        namedArguments[const Symbol('actionsOverflowButtonSpacing')]);
    EdgeInsetsGeometry? buttonPadding;
    var buttonPaddingParsed = namedArguments[const Symbol('buttonPadding')];
    if (buttonPaddingParsed != null) {
      buttonPadding = buttonPaddingParsed as EdgeInsetsGeometry;
    }
    MainAxisAlignment? actionsAlignment;
    var actionsAlignmentParsed =
        namedArguments[const Symbol('actionsAlignment')];
    if (actionsAlignmentParsed != null) {
      actionsAlignment = actionsAlignmentParsed as MainAxisAlignment;
    }
    return AlertDialog(
      title: title,
      content: content,
      titleTextStyle: titleTextStyle,
      contentTextStyle: contentTextStyle,
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: elevation,
      titlePadding: titlePadding,
      contentPadding: contentPadding,
      shape: shape,
      scrollable: scrollable,
      actionsAlignment: actionsAlignment,
      actionsPadding: actionsPadding,
      actionsOverflowDirection: actionsOverflowDirection,
      actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
      buttonPadding: buttonPadding,
    );
  }
}

class ISnackBar implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var content = namedArguments[const Symbol('content')];
    if (content == null) {
      throw "content required in SnackBar";
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    SnackBarBehavior? snackBarBehavior;
    var snackBarBehaviorParsed = namedArguments[const Symbol('behavior')];
    if (snackBarBehaviorParsed != null) {
      snackBarBehavior = snackBarBehaviorParsed as SnackBarBehavior;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    EdgeInsetsGeometry? margin;
    var marginParsed = namedArguments[const Symbol('margin')];
    if (marginParsed != null) {
      margin = marginParsed as EdgeInsetsGeometry;
    }
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    SnackBarAction? action;
    var actionParsed = namedArguments[const Symbol('action')];
    if (actionParsed != null) {
      action = actionParsed as SnackBarAction;
    }
    DismissDirection dismissDirection = DismissDirection.down;
    var dismissDirectionParsed =
        namedArguments[const Symbol('dismissDirection')];
    if (dismissDirectionParsed != null) {
      dismissDirection = dismissDirectionParsed as DismissDirection;
    }
    Duration duration = const Duration(milliseconds: 4000);
    var durationParsed = namedArguments[const Symbol('duration')];
    if (durationParsed != null) {
      duration = durationParsed as Duration;
    }
    return SnackBar(
      content: content as Widget,
      elevation: elevation,
      width: width,
      shape: shape,
      margin: margin,
      duration: duration,
      padding: padding,
      behavior: snackBarBehavior,
      backgroundColor: backgroundColor,
      action: action,
      dismissDirection: dismissDirection,
    );
  }
}

class ISnackBarAction implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var label = namedArguments[const Symbol('label')];
    if (label == null) {
      throw "label required in SnackBarAction";
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in SnackBarAction";
    }
    Color? textColor;
    var textColorParsed = namedArguments[const Symbol('textColor')];
    if (textColorParsed != null) {
      textColor = textColorParsed as Color;
    }
    Color? disabledTextColor;
    var disabledTextColorParsed =
        namedArguments[const Symbol('disabledTextColor')];
    if (disabledTextColorParsed != null) {
      disabledTextColor = disabledTextColorParsed as Color;
    }
    return SnackBarAction(
      label: label as String,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      onPressed: () {
        (onPressed as LoxFunction).call(interpreter, [], {});
      },
    );
  }
}

class IGestureDetector implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    Function()? onTap;
    var onTapParsed = namedArguments[const Symbol('onTap')];
    if (onTapParsed != null) {
      onTap = () {
        (onTapParsed as LoxFunction).call(interpreter, [], {});
      };
    }
    Function()? onDoubleTap;
    var onDoubleTapParsed = namedArguments[const Symbol('onDoubleTap')];
    if (onDoubleTapParsed != null) {
      onDoubleTap = () {
        (onDoubleTapParsed as LoxFunction).call(interpreter, [], {});
      };
    }
    Function()? onLongPress;
    var onLongPressParsed = namedArguments[const Symbol('onLongPress')];
    if (onLongPressParsed != null) {
      onLongPress = () {
        (onLongPress as LoxFunction).call(interpreter, [], {});
      };
    }

    return GestureDetector(
      child: child,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
    );
  }
}

class ChartLineWithDataBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "arguments required in ChartLineWithDataBuilder";
    }
    var data = arguments.first;
    bool animated = false;
    var animatedParsed = namedArguments[const Symbol('animated')];
    if (animatedParsed != null) {
      animated = animatedParsed as bool;
    }
    double height = parseDouble(namedArguments[const Symbol('height')]) ?? 200;
    int titleFontSize = 14;
    var titleFontSizeParsed = namedArguments[const Symbol('titleFontSize')];
    if (titleFontSizeParsed != null) {
      titleFontSize = titleFontSizeParsed as int;
    }
    double maskFontSize =
        parseDouble(namedArguments[const Symbol('maskFontSize')]) ?? 18;
    bool showLegend = true;
    var showLegendParsed = namedArguments[const Symbol('showLegend')];
    if (showLegendParsed != null) {
      showLegend = showLegendParsed as bool;
    }
    var showChartTitle = true;
    var showChartTitleParsed = namedArguments[const Symbol('showChartTitle')];
    if (showChartTitleParsed != null) {
      showChartTitle = showChartTitleParsed as bool;
    }
    double strokeWidth =
        parseDouble(namedArguments[const Symbol('strokeWidth')]) ?? 1;
    bool hidePrimaryAxis = false;
    var hidePrimaryAxisParsed = namedArguments[const Symbol('hidePrimaryAxis')];
    if (hidePrimaryAxisParsed != null) {
      hidePrimaryAxis = hidePrimaryAxisParsed as bool;
    }
    bool hideSecondaryAxis = false;
    var hideSecondaryAxisParsed =
        namedArguments[const Symbol('hideSecondaryAxis')];
    if (hideSecondaryAxisParsed != null) {
      hideSecondaryAxis = hideSecondaryAxisParsed as bool;
    }
    bool hideDomainAxis = false;
    var hideDomainAxisParsed = namedArguments[const Symbol('hideDomainAxis')];
    if (hideDomainAxisParsed != null) {
      hideDomainAxis = hideDomainAxisParsed as bool;
    }
    bool Function(String)? hiddenFn;
    var hiddenFnParsed = namedArguments[const Symbol('hiddenFn')];
    if (hiddenFnParsed != null) {
      hiddenFn = (s) {
        return (hiddenFnParsed as LoxFunction).call(interpreter, [s], {})
            as bool;
      };
    }
    Widget? loadingWidget;
    var loadingWidgetParsed = namedArguments[const Symbol('loadingWidget')];
    if (loadingWidgetParsed != null) {
      loadingWidget = loadingWidgetParsed as Widget;
    }
    bool showAxisLine = false;
    var showAxisLineParsed = namedArguments[const Symbol('showAxisLine')];
    if (showAxisLineParsed != null) {
      showAxisLine = showAxisLineParsed as bool;
    }
    return ChartLine.withChartData(data as List<dynamic>,
        animate: animated,
        height: height,
        titleFontSize: titleFontSize,
        maskFontSize: maskFontSize,
        showLegend: showLegend,
        showChartTitle: showChartTitle,
        strokeWidth: strokeWidth,
        loadingWidget: loadingWidget,
        hidePrimaryAxis: hidePrimaryAxis,
        hiddenFn: hiddenFn,
        showAxisLine: showAxisLine,
        hideSecondaryAxis: hideSecondaryAxis,
        hideDomainAxis: hideDomainAxis);
  }
}

class IChartLine implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'withChartData':
        return ChartLineWithDataBuilder();
    }
    throw "Unknown property: ${name.lexeme}";
  }
}

class ChartBarWithDataBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "arguments required in ChartBarWithDataBuilder";
    }
    var data = arguments.first;
    bool animated = false;
    var animatedParsed = namedArguments[const Symbol('animated')];
    if (animatedParsed != null) {
      animated = animatedParsed as bool;
    }
    double height = parseDouble(namedArguments[const Symbol('height')]) ?? 200;
    bool vertical = true;
    var verticalParsed = namedArguments[const Symbol('vertical')];
    if (verticalParsed != null) {
      vertical = verticalParsed as bool;
    }
    bool showBarLabel = false;
    var showBarLabelParsed = namedArguments[const Symbol('showBarLabel')];
    if (showBarLabelParsed != null) {
      showBarLabel = showBarLabelParsed as bool;
    }
    int titleFontSize = 14;
    var titleFontSizeParsed = namedArguments[const Symbol('titleFontSize')];
    if (titleFontSizeParsed != null) {
      titleFontSize = titleFontSizeParsed as int;
    }
    double maskFontSize =
        parseDouble(namedArguments[const Symbol('maskFontSize')]) ?? 18;
    bool showLegend = true;
    var showLegendParsed = namedArguments[const Symbol('showLegend')];
    if (showLegendParsed != null) {
      showLegend = showLegendParsed as bool;
    }
    var showChartTitle = true;
    var showChartTitleParsed = namedArguments[const Symbol('showChartTitle')];
    if (showChartTitleParsed != null) {
      showChartTitle = showChartTitleParsed as bool;
    }
    bool hidePrimaryAxis = false;
    var hidePrimaryAxisParsed = namedArguments[const Symbol('hidePrimaryAxis')];
    if (hidePrimaryAxisParsed != null) {
      hidePrimaryAxis = hidePrimaryAxisParsed as bool;
    }
    bool hideSecondaryAxis = false;
    var hideSecondaryAxisParsed =
        namedArguments[const Symbol('hideSecondaryAxis')];
    if (hideSecondaryAxisParsed != null) {
      hideSecondaryAxis = hideSecondaryAxisParsed as bool;
    }
    bool hideDomainAxis = false;
    var hideDomainAxisParsed = namedArguments[const Symbol('hideDomainAxis')];
    if (hideDomainAxisParsed != null) {
      hideDomainAxis = hideDomainAxisParsed as bool;
    }

    Widget? loadingWidget;
    var loadingWidgetParsed = namedArguments[const Symbol('loadingWidget')];
    if (loadingWidgetParsed != null) {
      loadingWidget = loadingWidgetParsed as Widget;
    }
    bool showAxisLine = false;
    var showAxisLineParsed = namedArguments[const Symbol('showAxisLine')];
    if (showAxisLineParsed != null) {
      showAxisLine = showAxisLineParsed as bool;
    }
    String groupType = 'grouped';
    var groupTypeParsed = namedArguments[const Symbol('groupType')];
    if (groupTypeParsed != null) {
      groupType = groupTypeParsed as String;
    }
    return ChartBar.withChartData(data as List<dynamic>,
        animate: animated,
        height: height,
        vertical: vertical,
        titleFontSize: titleFontSize,
        maskFontSize: maskFontSize,
        showLegend: showLegend,
        groupType: groupType,
        showBarLabel: showBarLabel,
        showChartTitle: showChartTitle,
        loadingWidget: loadingWidget,
        hidePrimaryAxis: hidePrimaryAxis,
        showAxisLine: showAxisLine,
        hideSecondaryAxis: hideSecondaryAxis,
        hideDomainAxis: hideDomainAxis);
  }
}

class IChartBar implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'withChartData':
        return ChartBarWithDataBuilder();
    }
    throw "Unknown property: ${name.lexeme}";
  }
}

class ChartPieWithDataBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "arguments required in ChartPieWithDataBuilder";
    }
    var data = arguments.first;
    bool animated = false;
    var animatedParsed = namedArguments[const Symbol('animated')];
    if (animatedParsed != null) {
      animated = animatedParsed as bool;
    }
    double height = parseDouble(namedArguments[const Symbol('height')]) ?? 200;
    int titleFontSize = 14;
    var titleFontSizeParsed = namedArguments[const Symbol('titleFontSize')];
    if (titleFontSizeParsed != null) {
      titleFontSize = titleFontSizeParsed as int;
    }
    double maskFontSize =
        parseDouble(namedArguments[const Symbol('maskFontSize')]) ?? 18;
    bool showLegend = true;
    var showLegendParsed = namedArguments[const Symbol('showLegend')];
    if (showLegendParsed != null) {
      showLegend = showLegendParsed as bool;
    }
    var showChartTitle = true;
    var showChartTitleParsed = namedArguments[const Symbol('showChartTitle')];
    if (showChartTitleParsed != null) {
      showChartTitle = showChartTitleParsed as bool;
    }
    Widget? loadingWidget;
    var loadingWidgetParsed = namedArguments[const Symbol('loadingWidget')];
    if (loadingWidgetParsed != null) {
      loadingWidget = loadingWidgetParsed as Widget;
    }
    int arcWidth = 40;
    var arcWidthParsed = namedArguments[const Symbol('arcWidth')];
    if (arcWidthParsed != null) {
      arcWidth = arcWidthParsed as int;
    }
    return ChartPie.withChartData(
      data as List<dynamic>,
      height: height,
      animate: animated,
      titleFontSize: titleFontSize,
      maskFontSize: maskFontSize,
      showLegend: showLegend,
      arcWidth: arcWidth,
      showChartTitle: showChartTitle,
      loadingWidget: loadingWidget,
    );
  }
}

class IChartPie implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'withChartData':
        return ChartPieWithDataBuilder();
    }
    throw "Unknown property: ${name.lexeme}";
  }
}

class IDatePicker implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var date = namedArguments[const Symbol('date')];
    if (date == null) {
      throw "date required in DatePicker";
    }
    var onDateChanged = namedArguments[const Symbol('onDateChanged')];
    if (onDateChanged == null) {
      throw "onDateChange required in DatePicker";
    }
    bool autoHide = true;
    var autoHideParsed = namedArguments[const Symbol('autoHide')];
    if (autoHideParsed != null) {
      autoHide = autoHideParsed as bool;
    }
    return DatePicker(
      date: date as String,
      autoHide: autoHide,
      onDateChanged: (s) {
        (onDateChanged as LoxFunction).call(interpreter, [s], {});
      },
    );
  }
}

class ISafeArea implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in SafeArea";
    }
    bool left = true;
    var leftParsed = namedArguments[const Symbol('left')];
    if (leftParsed != null) {
      left = leftParsed as bool;
    }
    bool top = true;
    var topParsed = namedArguments[const Symbol('top')];
    if (topParsed != null) {
      top = topParsed as bool;
    }
    bool right = true;
    var rightParsed = namedArguments[const Symbol('right')];
    if (rightParsed != null) {
      right = rightParsed as bool;
    }
    bool bottom = true;
    var bottomParsed = namedArguments[const Symbol('bottom')];
    if (bottomParsed != null) {
      bottom = bottomParsed as bool;
    }
    bool maintainBottomViewPadding = false;
    var maintainBottomViewPaddingParsed =
        namedArguments[const Symbol('maintainBottomViewPadding')];
    if (maintainBottomViewPaddingParsed != null) {
      maintainBottomViewPadding = maintainBottomViewPaddingParsed as bool;
    }
    EdgeInsets minimum = EdgeInsets.zero;
    var minimumParsed = namedArguments[const Symbol('minimum')];
    if (minimumParsed != null) {
      minimum = minimumParsed as EdgeInsets;
    }
    return SafeArea(
      child: child as Widget,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
    );
  }
}

class IDaxStatefulWidget implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var klass = namedArguments[const Symbol('klass')];
    if (klass == null) {
      throw "klass required in DaxStatefulWidget";
    }
    return DaxStatefulWidget(
      klass: klass as LoxClass,
      interpreter: interpreter,
      arguments: arguments,
    );
  }
}

class IDaxStatelessWidget implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var klass = namedArguments[const Symbol('klass')];
    if (klass == null) {
      throw "klass required in DaxStatefulWidget";
    }
    return DaxStatelessWidget(
        klass: klass as LoxClass,
        interpreter: interpreter,
        arguments: arguments);
  }
}
