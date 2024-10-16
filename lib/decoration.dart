import 'package:dax/dax.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class IBoxDecoration implements DaxCallable {
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
    BlendMode? backgroundBlendMode;
    var backgroundBlendModeParsed =
        namedArguments[const Symbol('backgroundBlendMode')];
    if (backgroundBlendModeParsed != null) {
      backgroundBlendMode = backgroundBlendModeParsed as BlendMode;
    }
    BoxShape shape = BoxShape.rectangle;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as BoxShape;
    }
    DecorationImage? image;
    var imageParsed = namedArguments[const Symbol('image')];
    if (imageParsed != null) {
      image = imageParsed as DecorationImage;
    }
    return BoxDecoration(
        color: color,
        border: border,
        gradient: gradient,
        image: image,
        shape: shape,
        backgroundBlendMode: backgroundBlendMode,
        borderRadius: borderRadius,
        boxShadow: boxShadow);
  }
}

class ILinearGradient implements DaxCallable {
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
    List<double>? stops;
    var stopsParsed = namedArguments[const Symbol('stops')];
    if (stopsParsed != null) {
      stops = (stopsParsed as List).cast<double>();
    }
    TileMode tileMode = TileMode.clamp;
    var tileModeParsed = namedArguments[const Symbol('tileMode')];
    if (tileModeParsed != null) {
      tileMode = tileModeParsed as TileMode;
    }
    return LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        stops: stops,
        tileMode: tileMode);
  }
}

class ITextStyle implements DaxCallable {
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
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    FontWeight? fontWeight;
    var fontWeightParsed = namedArguments[const Symbol('fontWeight')];
    if (fontWeightParsed != null) {
      fontWeight = fontWeightParsed as FontWeight;
    }
    FontStyle? fontStyle;
    var fontStyleParsed = namedArguments[const Symbol('fontStyle')];
    if (fontStyleParsed != null) {
      fontStyle = fontStyleParsed as FontStyle;
    }
    double? letterSpacing =
        parseDouble(namedArguments[const Symbol('letterSpacing')]);
    double? wordSpacing =
        parseDouble(namedArguments[const Symbol('wordSpacing')]);
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    double? decorationThickness =
        parseDouble(namedArguments[const Symbol('decorationThickness')]);
    TextOverflow? overflow;
    var overflowParsed = namedArguments[const Symbol('overflow')];
    if (overflowParsed != null) {
      overflow = overflowParsed as TextOverflow;
    }
    TextDecorationStyle? decorationStyle;
    var decorationStyleParsed = namedArguments[const Symbol('decorationStyle')];
    if (decorationStyleParsed != null) {
      decorationStyle = decorationStyleParsed as TextDecorationStyle;
    }
    TextDecoration? decoration;
    var decorationParsed = namedArguments[const Symbol('decoration')];
    if (decorationParsed != null) {
      decoration = decorationParsed as TextDecoration;
    }
    TextBaseline? textBaseline;
    var textBaselineParsed = namedArguments[const Symbol('textBaseline')];
    if (textBaselineParsed != null) {
      textBaseline = textBaselineParsed as TextBaseline;
    }
    List<Shadow>? shadows;
    var shadowsParsed = namedArguments[const Symbol('shadows')];
    if (shadowsParsed != null) {
      shadows = (shadowsParsed as List).cast<Shadow>();
    }
    Color? decorationColor;
    var decorationColorParsed = namedArguments[const Symbol('decorationColor')];
    if (decorationColorParsed != null) {
      decorationColor = decorationColorParsed as Color;
    }
    return TextStyle(
        backgroundColor: backgroundColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height,
        shadows: shadows,
        textBaseline: textBaseline,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        letterSpacing: letterSpacing,
        overflow: overflow,
        decoration: decoration,
        decorationStyle: decorationStyle,
        wordSpacing: wordSpacing,
        fontStyle: fontStyle,
        color: color);
  }
}

class IShadow implements DaxCallable {
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
    return Shadow(color: color, offset: offset, blurRadius: blurRadius);
  }
}

class IBoxShadow implements DaxCallable {
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

class IInputDecoration implements DaxCallable {
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
    InputBorder? disabledBorder;
    var disabledBorderParsed = namedArguments[const Symbol('disabledBorder')];
    if (disabledBorderParsed != null) {
      disabledBorder = disabledBorderParsed as InputBorder;
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
    Widget? label;
    var labelParsed = namedArguments[const Symbol('label')];
    if (labelParsed != null) {
      label = labelParsed as Widget;
    }
    BoxConstraints? prefixIconConstraints;
    var prefixIconConstraintsParsed =
        namedArguments[const Symbol('prefixIconConstraints')];
    if (prefixIconConstraintsParsed != null) {
      prefixIconConstraints = prefixIconConstraintsParsed as BoxConstraints;
    }
    BoxConstraints? suffixIconConstraints;
    var suffixIconConstraintsParsed =
        namedArguments[const Symbol('suffixIconConstraints')];
    if (suffixIconConstraintsParsed != null) {
      suffixIconConstraints = suffixIconConstraintsParsed as BoxConstraints;
    }
    TextDirection? hintTextDirection;
    var hintTextDirectionParsed =
        namedArguments[const Symbol('hintTextDirection')];
    if (hintTextDirectionParsed != null) {
      hintTextDirection = hintTextDirectionParsed as TextDirection;
    }
    return InputDecoration(
        label: label,
        contentPadding: contentPadding,
        isCollapsed: isCollapsed,
        enabled: enabled,
        filled: filled,
        isDense: isDense,
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        disabledBorder: disabledBorder,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        errorBorder: errorBorder,
        fillColor: fillColor,
        hoverColor: hoverColor,
        labelStyle: labelStyle,
        hintStyle: hintStyle,
        hintTextDirection: hintTextDirection,
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

class TableBorderAllBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color color = const Color(0xFF000000);
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    double width = 1.0;
    var widthParsed = namedArguments[const Symbol('width')];
    if (widthParsed != null) {
      width = widthParsed as double;
    }
    BorderStyle style = BorderStyle.solid;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as BorderStyle;
    }
    BorderRadius borderRadius = BorderRadius.zero;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }
    return TableBorder.all(
      color: color,
      width: width,
      style: style,
      borderRadius: borderRadius,
    );
  }
}

class TableBorderSymmetricBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide inside = BorderSide.none;
    var insideParsed = namedArguments[const Symbol('inside')];
    if (insideParsed != null) {
      inside = insideParsed as BorderSide;
    }
    BorderSide outside = BorderSide.none;
    var outsideParsed = namedArguments[const Symbol('outside')];
    if (outsideParsed != null) {
      outside = outsideParsed as BorderSide;
    }
    return TableBorder.symmetric(inside: inside, outside: outside);
  }
}

class ITableBorder implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    if (name.lexeme == "all") {
      return TableBorderAllBuilder();
    } else if (name.lexeme == "symmetric") {
      return TableBorderSymmetricBuilder();
    }
    throw "Unknown property: ${name.lexeme}";
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide top = BorderSide.none;
    var topParsed = namedArguments[const Symbol('top')];
    if (topParsed != null) {
      top = topParsed as BorderSide;
    }
    BorderSide right = BorderSide.none;
    var rightParsed = namedArguments[const Symbol('right')];
    if (rightParsed != null) {
      right = rightParsed as BorderSide;
    }
    BorderSide bottom = BorderSide.none;
    var bottomParsed = namedArguments[const Symbol('bottom')];
    if (bottomParsed != null) {
      bottom = bottomParsed as BorderSide;
    }
    BorderSide left = BorderSide.none;
    var leftParsed = namedArguments[const Symbol('left')];
    if (leftParsed != null) {
      left = leftParsed as BorderSide;
    }
    BorderSide horizontalInside = BorderSide.none;
    var horizontalInsideParsed =
        namedArguments[const Symbol('horizontalInside')];
    if (horizontalInsideParsed != null) {
      horizontalInside = horizontalInsideParsed as BorderSide;
    }
    BorderSide verticalInside = BorderSide.none;
    var verticalInsideParsed = namedArguments[const Symbol('verticalInside')];
    if (verticalInsideParsed != null) {
      verticalInside = verticalInsideParsed as BorderSide;
    }
    BorderRadius borderRadius = BorderRadius.zero;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }

    return TableBorder(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      horizontalInside: horizontalInside,
      verticalInside: verticalInside,
      borderRadius: borderRadius,
    );
  }
}

class ICircleBorder implements DaxCallable {
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

class IStadiumBorder implements DaxCallable {
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

class IContinuousRectangleBorder implements DaxCallable {
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

class IRoundedRectangleBorder implements DaxCallable {
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

class IBeveledRectangleBorder implements DaxCallable {
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

class IUnderlineInputBorder implements DaxCallable {
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

class IOutlineInputBorder implements DaxCallable {
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

class IBorderSide implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'none':
        return BorderSide.none;
    }
  }

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

class IDefaultTextStyle implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    TextAlign? textAlign;
    var textAlignParse = namedArguments[const Symbol('textAlign')];
    if (textAlignParse != null) {
      textAlign = textAlignParse as TextAlign;
    }
    var style = namedArguments[const Symbol('style')];
    if (style == null) {
      throw "DefaultTextStyle must have a style";
    }
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "DefaultTextStyle must have a child";
    }
    bool softWrap = true;
    var softWrapParsed = namedArguments[const Symbol('softWrap')];
    if (softWrapParsed != null) {
      softWrap = softWrapParsed as bool;
    }
    TextOverflow overflow = TextOverflow.clip;
    var overflowParsed = namedArguments[const Symbol('overflow')];
    if (overflowParsed != null) {
      overflow = overflowParsed as TextOverflow;
    }
    int? maxLines;
    var maxLinesParsed = namedArguments[const Symbol('maxLines')];
    if (maxLinesParsed != null) {
      maxLines = maxLinesParsed as int;
    }
    return DefaultTextStyle(
        style: style as TextStyle,
        child: child as Widget,
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines);
  }
}
