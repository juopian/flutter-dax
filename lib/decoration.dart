import 'package:dax/dax.dart';
import 'package:flutter/material.dart';
import 'package:usecases/utils.dart';

class IBoxDecoration implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    BoxBorder? border;
    var borderParsed = namedArguments[const Symbol('border')];
    if (borderParsed != null) {
      border = borderParsed as BoxBorder;
    }
    BorderRadiusGeometry? borderRadius;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadiusGeometry;
    }
    List<BoxShadow>? boxShadow;
    var boxShadowParsed = namedArguments[const Symbol('boxShadow')];
    if (boxShadowParsed != null) {
      boxShadow = (boxShadowParsed as List).cast<BoxShadow>();
    }
    Gradient? gradient;
    var gradientParsed = namedArguments[const Symbol('gradient')];
    if (gradientParsed != null) {
      gradient = gradientParsed as Gradient;
    }
    return BoxDecoration(
        color: color,
        border: border,
        gradient: gradient,
        borderRadius: borderRadius,
        boxShadow: boxShadow);
  }
}

class ILinearGradient implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    AlignmentGeometry begin = Alignment.centerLeft;
    AlignmentGeometry end = Alignment.centerRight;
    var beginParsed = namedArguments[const Symbol('begin')];
    if (beginParsed != null) {
      begin = beginParsed as AlignmentGeometry;
    }
    var endParsed = namedArguments[const Symbol('end')];
    if (endParsed != null) {
      end = endParsed as AlignmentGeometry;
    }
    List<Color> colors = [];
    var colorsParsed = namedArguments[const Symbol('colors')];
    if (colorsParsed != null) {
      colors = (colorsParsed as List).cast<Color>();
    }
    return LinearGradient(begin: begin, end: end, colors: colors);
  }
}

class ITextStyle implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? fontSize;
    var sizeParsed = namedArguments[const Symbol('fontSize')];
    fontSize = parseDouble(sizeParsed);
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }

    FontWeight? fontWeight;
    var fontWeightParsed = namedArguments[const Symbol('fontWeight')];
    if (fontWeightParsed != null) {
      fontWeight = fontWeightParsed as FontWeight;
    }
    return TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color);
  }
}

class IBoxShadow implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color color = Colors.black;
    if (namedArguments[const Symbol('color')] != null) {
      color = namedArguments[const Symbol('color')] as Color;
    }
    Offset offset = Offset.zero;
    if (namedArguments[const Symbol('offset')] != null) {
      offset = namedArguments[const Symbol('offset')] as Offset;
    }
    double blurRadius =
        parseDouble(namedArguments[const Symbol('blurRadius')]) ?? 0.0;
    double spreadRadius =
        parseDouble(namedArguments[const Symbol('spreadRadius')]) ?? 0.0;
    return BoxShadow(
        color: color,
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius);
  }
}

class IInputDecoration implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    String? labelText;
    var labelTextParsed = namedArguments[const Symbol('labelText')];
    if (labelTextParsed != null) {
      labelText = labelTextParsed as String;
    }
    String? hintText;
    var hintTextParsed = namedArguments[const Symbol('hintText')];
    if (hintTextParsed != null) {
      hintText = hintTextParsed as String;
    }
    Widget? icon;
    var iconParsed = namedArguments[const Symbol('icon')];
    if (iconParsed != null) {
      icon = iconParsed as Widget;
    }
    Widget? prefixIcon;
    var prefixIconParsed = namedArguments[const Symbol('prefixIcon')];
    if (prefixIconParsed != null) {
      prefixIcon = prefixIconParsed as Widget;
    }
    Widget? suffixIcon;
    var suffixIconParsed = namedArguments[const Symbol('suffixIcon')];
    if (suffixIconParsed != null) {
      suffixIcon = suffixIconParsed as Widget;
    }
    String? errorText;
    var errorTextParsed = namedArguments[const Symbol('errorText')];
    if (errorTextParsed != null) {
      errorText = errorTextParsed as String;
    }
    String? prefixText;
    var prefixTextParsed = namedArguments[const Symbol('prefixText')];
    if (prefixTextParsed != null) {
      prefixText = prefixTextParsed as String;
    }
    String? suffixText;
    var suffixTextParsed = namedArguments[const Symbol('suffixText')];
    if (suffixTextParsed != null) {
      suffixText = suffixTextParsed as String;
    }
    String? helperText;
    var helperTextParsed = namedArguments[const Symbol('helperText')];
    if (helperTextParsed != null) {
      helperText = helperTextParsed as String;
    }
    bool isCollapsed = false;
    var isCollapsedParsed = namedArguments[const Symbol('isCollapsed')];
    if (isCollapsedParsed != null) {
      isCollapsed = isCollapsedParsed as bool;
    }
    bool enabled = true;
    var enabledParsed = namedArguments[const Symbol('enabled')];
    if (enabledParsed != null) {
      enabled = enabledParsed as bool;
    }
    bool? filled;
    var filledParsed = namedArguments[const Symbol('filled')];
    if (filledParsed != null) {
      filled = filledParsed as bool;
    }
    bool? isDense;
    var isDenseParsed = namedArguments[const Symbol('isDense')];
    if (isDenseParsed != null) {
      isDense = isDenseParsed as bool;
    }
    Color? fillColor;
    var fillColorParsed = namedArguments[const Symbol('fillColor')];
    if (fillColorParsed != null) {
      fillColor = fillColorParsed as Color;
    }
    Color? hoverColor;
    var hoverColorParsed = namedArguments[const Symbol('hoverColor')];
    if (hoverColorParsed != null) {
      hoverColor = hoverColorParsed as Color;
    }
    TextStyle? labelStyle;
    var labelStyleParsed = namedArguments[const Symbol('textStyle')];
    if (labelStyleParsed != null) {
      labelStyle = labelStyleParsed as TextStyle;
    }
    TextStyle? hintStyle;
    var hintStyleParsed = namedArguments[const Symbol('hintStyle')];
    if (hintStyleParsed != null) {
      hintStyle = hintStyleParsed as TextStyle;
    }
    TextStyle? errorStyle;
    var errorStyleParsed = namedArguments[const Symbol('errorStyle')];
    if (errorStyleParsed != null) {
      errorStyle = errorStyleParsed as TextStyle;
    }
    TextStyle? helperStyle;
    var helperStyleParsed = namedArguments[const Symbol('helperStyle')];
    if (helperStyleParsed != null) {
      helperStyle = helperStyleParsed as TextStyle;
    }
    TextStyle? prefixStyle;
    var prefixStyleParsed = namedArguments[const Symbol('prefixStyle')];
    if (prefixStyleParsed != null) {
      prefixStyle = prefixStyleParsed as TextStyle;
    }
    TextStyle? suffixStyle;
    var suffixStyleParsed = namedArguments[const Symbol('suffixStyle')];
    if (suffixStyleParsed != null) {
      suffixStyle = suffixStyleParsed as TextStyle;
    }
    EdgeInsetsGeometry? contentPadding;
    var contentPaddingParsed = namedArguments[const Symbol('contentPadding')];
    if (contentPaddingParsed != null) {
      contentPadding = contentPaddingParsed as EdgeInsetsGeometry;
    }
    InputBorder? border;
    var borderParsed = namedArguments[const Symbol('border')];
    if (borderParsed != null) {
      border = borderParsed as InputBorder;
    }
    InputBorder? focusedBorder;
    var focusedBorderParsed = namedArguments[const Symbol('focusedBorder')];
    if (focusedBorderParsed != null) {
      focusedBorder = focusedBorderParsed as InputBorder;
    }
    InputBorder? enabledBorder;
    var enabledBorderParsed = namedArguments[const Symbol('enabledBorder')];
    if (enabledBorderParsed != null) {
      enabledBorder = enabledBorderParsed as InputBorder;
    }
    InputBorder? errorBorder;
    var errorBorderParsed = namedArguments[const Symbol('errorBorder')];
    if (errorBorderParsed != null) {
      errorBorder = errorBorderParsed as InputBorder;
    }
    Widget? suffix;
    var suffixParsed = namedArguments[const Symbol('suffix')];
    if (suffixParsed != null) {
      suffix = suffixParsed as Widget;
    }
    Widget? prefix;
    var prefixParsed = namedArguments[const Symbol('prefix')];
    if (prefixParsed != null) {
      prefix = prefixParsed as Widget;
    }
    return InputDecoration(
        contentPadding: contentPadding,
        isCollapsed: isCollapsed,
        enabled: enabled,
        filled: filled,
        isDense: isDense,
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        fillColor: fillColor,
        hoverColor: hoverColor,
        labelStyle: labelStyle,
        hintStyle: hintStyle,
        errorStyle: errorStyle,
        helperStyle: helperStyle,
        prefixStyle: prefixStyle,
        suffixStyle: suffixStyle,
        helperText: helperText,
        labelText: labelText,
        hintText: hintText,
        icon: icon,
        suffix: suffix,
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        suffixText: suffixText,
        errorText: errorText);
  }
}

class ICircleBorder implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide side = BorderSide.none;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    return CircleBorder(side: side);
  }
}

class IStadiumBorder implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide side = BorderSide.none;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    return StadiumBorder(side: side);
  }
}


class IContinuousRectangleBorder implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide side = BorderSide.none;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    BorderRadius borderRadius = BorderRadius.zero;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }
    return ContinuousRectangleBorder(side: side, borderRadius: borderRadius);
  }
}

class IRoundedRectangleBorder implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide side = BorderSide.none;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    BorderRadius borderRadius = BorderRadius.zero;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }
    return RoundedRectangleBorder(side: side, borderRadius: borderRadius);
  }
}

class IBeveledRectangleBorder implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide side = BorderSide.none;
    var sideParsed = namedArguments[const Symbol('side')];
    if (sideParsed != null) {
      side = sideParsed as BorderSide;
    }
    BorderRadius borderRadius = BorderRadius.zero;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }
    return BeveledRectangleBorder(side: side, borderRadius: borderRadius);
  }
}

class IUnderlineInputBorder implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide borderSide = const BorderSide();
    BorderRadius borderRaidus = const BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(4),
    );
    var borderRaidusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRaidusParsed != null) {
      borderRaidus = borderRaidusParsed as BorderRadius;
    }
    var borderSideParsed = namedArguments[const Symbol('borderSide')];
    if (borderSideParsed != null) {
      borderSide = borderSideParsed as BorderSide;
    }
    return UnderlineInputBorder(
      borderRadius: borderRaidus,
      borderSide: borderSide,
    );
  }
}

class IOutlineInputBorder implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide borderSide = const BorderSide();
    var borderSideParsed = namedArguments[const Symbol('borderSide')];
    if (borderSideParsed != null) {
      borderSide = borderSideParsed as BorderSide;
    }
    BorderRadius borderRadius = BorderRadius.circular(4);
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }
    double gapPadding =
        parseDouble(namedArguments[const Symbol('gapPadding')]) ?? 4.0;
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: borderSide,
      gapPadding: gapPadding,
    );
  }
}

class IBorderSide implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color color = Colors.black;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    double width = parseDouble(namedArguments[const Symbol('width')]) ?? 1.0;
    BorderStyle style = BorderStyle.solid;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as BorderStyle;
    }
    return BorderSide(color: color, width: width, style: style);
  }
}
