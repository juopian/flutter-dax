import 'package:dax/dax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'utils.dart';

class IText implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    TextStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as TextStyle;
    }
    return Text(
      arguments.first as String,
      style: style,
    );
  }
}

class ElevatedButtonStyleBuilder implements LoxFlutterFunction {
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
    return ElevatedButton.styleFrom(
      primary: primary,
      shadowColor: shadowColor,
      elevation: elevation,
      textStyle: textStyle,
      side: side,
      shape: shape,
      minimumSize: minimumSize,
      maximumSize: maximumSize,
      fixedSize: fixedSize,
      padding: padding
    );
  }
}

class IElevatedButton implements LoxFlutterFunction, LoxGetCallable {
  final builder = ElevatedButtonStyleBuilder();
  @override
  Object? get(Token name) {
    if (name.lexeme == "styleFrom") {
      return builder;
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
    return ElevatedButton(
        child: child as Widget,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}


class OutlinedButtonStyleBuilder implements LoxFlutterFunction {
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
    return OutlinedButton.styleFrom(
      primary: primary,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      elevation: elevation,
      textStyle: textStyle,
      side: side,
      shape: shape,
      minimumSize: minimumSize,
      maximumSize: maximumSize,
      fixedSize: fixedSize,
      padding: padding
    );
  }
}


class IOutlinedButton implements LoxFlutterFunction, LoxGetCallable {
  final builder = OutlinedButtonStyleBuilder();
  @override
  Object? get(Token name) {
    if (name.lexeme == "styleFrom") {
      return builder;
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
    return OutlinedButton(
        child: child as Widget,
        style: style,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class TextButtonStyleBuilder implements LoxFlutterFunction {
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
    return TextButton.styleFrom(
      primary: primary,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      elevation: elevation,
      textStyle: textStyle,
      side: side,
      shape: shape,
      minimumSize: minimumSize,
      maximumSize: maximumSize,
      fixedSize: fixedSize,
      padding: padding
    );
  }
}

class ITextButton implements LoxFlutterFunction, LoxGetCallable {
  final builder = TextButtonStyleBuilder();
  @override
  Object? get(Token name) {
    if (name.lexeme == "styleFrom") {
      return builder;
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
    return TextButton(
        child: child as Widget,
        style: style,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class IIcon implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "icon required in Icon";
    }
    var icon = arguments[0];
    double? size;
    size = parseDouble(namedArguments[const Symbol('size')]);
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    return Icon(icon as IconData, size: size, color: color);
  }
}

class IIconButton implements LoxFlutterFunction {
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
    return IconButton(
        icon: icon as Widget,
        onPressed: () {
          (onPressed as LoxFunction).call(interpreter, [], {});
        });
  }
}

class IImage implements LoxFlutterFunction {
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
    return Image(
      image: image,
      height: height,
      width: width,
      fit: fit,
    );
  }
}

class ICupertinoActivityIndicator implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return const CupertinoActivityIndicator();
  }
}

class ICircularProgressIndicator implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? strokeWidth =
        parseDouble(namedArguments[const Symbol('strokeWidth')]);
    double? value = parseDouble(namedArguments[const Symbol('value')]);
    Color? color;
    Color? backgroundColor;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    return CircularProgressIndicator(
      strokeWidth: strokeWidth ?? 4.0,
      value: value,
      color: color,
      backgroundColor: backgroundColor,
    );
  }
}

class ICheckbox implements LoxFlutterFunction {
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
    return Checkbox(
      value: value as bool,
      onChanged: (bool? value) {
        (onChanged as LoxFunction).call(interpreter, [value], {});
      },
    );
  }
}

class ITextField implements LoxFlutterFunction {
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
    TextStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as TextStyle;
    }
    return TextField(
      controller: controller,
      decoration: decoration,
      onChanged: onChanged,
      maxLines: maxLines,
      style: style,
    );
  }
}

class IDivider implements LoxFlutterFunction {
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

class IBottomNavigationBarItem implements LoxFlutterFunction {
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

class IAlertDialog implements LoxFlutterFunction {
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
    );
  }
}

class ISnackBar implements LoxFlutterFunction {
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
    return SnackBar(
      content: content as Widget,
      elevation: elevation,
      width: width,
      margin: margin,
      padding: padding,
      behavior: snackBarBehavior,
      backgroundColor: backgroundColor,
    );
  }
}

class IGestureDetector implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (child != null) {
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
