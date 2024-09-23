import 'package:dax/dax.dart';
import 'package:dax/lox_callable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'utils.dart';

class IOffset implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'zero':
        return Offset.zero;
      case 'infinit':
        return Offset.infinite;
    }
    return null;
  }

  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double dx = 0;
    double dy = 0;
    if (arguments.length == 2) {
      dx = parseDouble(arguments[0]) ?? 0;
      dy = parseDouble(arguments[1]) ?? 0;
    }
    return Offset(dx, dy);
  }
}

class UriIns implements LoxGetCallable {
  final Uri uri;
  UriIns(this.uri);

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'uri':
        return uri;
      case 'scheme':
        return uri.scheme;
      case 'host':
        return uri.host;
      case 'port':
        return uri.port;
      case 'path':
        return uri.path;
      case 'query':
        return uri.query;
      case 'fragment':
        return uri.fragment;
    }
  }
}

class UriParseBuilder implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    String uriString = arguments.first as String;
    return UriIns(Uri.parse(uriString));
  }
}

class IUri implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'parse':
        return UriParseBuilder();
    }
  }

  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    String? scheme;
    var schemeParsed = namedArguments[const Symbol('scheme')];
    if (schemeParsed != null) {
      scheme = schemeParsed as String;
    }
    String? host;
    var hostParsed = namedArguments[const Symbol('host')];
    if (hostParsed != null) {
      host = hostParsed as String;
    }
    int? port;
    var portParsed = namedArguments[const Symbol('port')];
    if (portParsed != null) {
      port = portParsed as int;
    }
    String? path;
    var pathParsed = namedArguments[const Symbol('path')];
    if (pathParsed != null) {
      path = pathParsed as String;
    }
    String? query;
    var queryParsed = namedArguments[const Symbol('query')];
    if (queryParsed != null) {
      query = queryParsed as String;
    }
    String? fragment;
    var fragmentParsed = namedArguments[const Symbol('fragment')];
    if (fragmentParsed != null) {
      fragment = fragmentParsed as String;
    }
    Map<String, dynamic>? queryParameters;
    var queryParametersParsed = namedArguments[const Symbol('queryParameters')];
    if (queryParametersParsed != null) {
      queryParameters = queryParametersParsed as Map<String, dynamic>;
    }
    return UriIns(Uri(
        scheme: scheme,
        host: host,
        port: port,
        path: path,
        query: query,
        queryParameters: queryParameters,
        fragment: fragment));
  }
}

class SizefromHeight implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double height = 0;
    if (arguments.length == 1) {
      height = parseDouble(arguments[0]) ?? 0;
    }
    return Size.fromHeight(height);
  }
}

class SizefromWidth implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double width = 0;
    if (arguments.length == 1) {
      width = parseDouble(arguments[0]) ?? 0;
    }
    return Size.fromWidth(width);
  }
}

class SizefromRadius implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double radius = 0;
    if (arguments.length == 1) {
      radius = parseDouble(arguments[0]) ?? 0;
    }
    return Size.fromRadius(radius);
  }
}

class Sizesquare implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double size = 0;
    if (arguments.length == 1) {
      size = parseDouble(arguments[0]) ?? 0;
    }
    return Size.square(size);
  }
}

class ISize implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double width = 0;
    double height = 0;
    if (arguments.length == 2) {
      width = parseDouble(arguments[0]) ?? 0;
      height = parseDouble(arguments[1]) ?? 0;
    }
    return SizeIns(width, height);
  }
}

class SizeIns extends Size implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'width':
        return width;
      case 'height':
        return height;
      case 'zero':
        return Size.zero;
      case 'infinite':
        return Size.infinite;
      case 'fromHeight':
        return SizefromHeight();
      case 'fromWidth':
        return SizefromWidth();
      case 'fromRadius':
        return SizefromRadius();
      case 'square':
        return Sizesquare();
    }
    return null;
  }

  SizeIns(double width, double height) : super(width, height);
}

class IViewSize implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var size = MediaQuery.of(arguments.first as BuildContext).size;
    return ISize().call(interpreter, [size.width, size.height], namedArguments);
  }
}

class ISnackBarShow implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return ScaffoldMessenger.of(arguments.first as BuildContext)
        .showSnackBar(arguments.last as SnackBar);
  }
}

class TransformRotate implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var angle = namedArguments[const Symbol('angle')];
    if (angle == null) {
      throw "angle required in Transform.rotate";
    }
    Offset? origin;
    var originParsed = namedArguments[const Symbol('origin')];
    if (originParsed != null) {
      origin = originParsed as Offset;
    }
    AlignmentGeometry? alignment;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as AlignmentGeometry;
    }
    FilterQuality? filterQuality;
    var filterQualityParsed = namedArguments[const Symbol('filterQuality')];
    if (filterQualityParsed != null) {
      filterQuality = filterQualityParsed as FilterQuality;
    }
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    return Transform.rotate(
      angle: angle as double,
      origin: origin,
      alignment: alignment,
      filterQuality: filterQuality,
      child: child,
    );
  }
}

class TransformScale implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var scale = namedArguments[const Symbol('scale')];
    if (scale == null) {
      throw "scale required in Transform.scale";
    }
    Offset? origin;
    var originParsed = namedArguments[const Symbol('origin')];
    if (originParsed != null) {
      origin = originParsed as Offset;
    }
    AlignmentGeometry? alignment;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as AlignmentGeometry;
    }
    FilterQuality? filterQuality;
    var filterQualityParsed = namedArguments[const Symbol('filterQuality')];
    if (filterQualityParsed != null) {
      filterQuality = filterQualityParsed as FilterQuality;
    }
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    return Transform.scale(
      scale: scale as double,
      origin: origin,
      alignment: alignment,
      filterQuality: filterQuality,
      child: child,
    );
  }
}

class TransformTranslate implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var offset = namedArguments[const Symbol('offset')];
    if (offset == null) {
      throw "offset required in Transform.translate";
    }
    FilterQuality? filterQuality;
    var filterQualityParsed = namedArguments[const Symbol('filterQuality')];
    if (filterQualityParsed != null) {
      filterQuality = filterQualityParsed as FilterQuality;
    }
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    return Transform.translate(
      offset: offset as Offset,
      filterQuality: filterQuality,
      child: child,
    );
  }
}

class ITransform implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case "rotate":
        return TransformRotate();
      case "scale":
        return TransformScale();
      case "translate":
        return TransformTranslate();
    }
  }

  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var transform = namedArguments[const Symbol('tranform')];
    if (transform == null) {
      throw "tranform required in Transform";
    }
    Offset? origin;
    var originParsed = namedArguments[const Symbol('origin')];
    if (originParsed != null) {
      origin = originParsed as Offset;
    }
    AlignmentGeometry? alignment;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as AlignmentGeometry;
    }
    FilterQuality? filterQuality;
    var filterQualityParsed = namedArguments[const Symbol('filterQuality')];
    if (filterQualityParsed != null) {
      filterQuality = filterQualityParsed as FilterQuality;
    }
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    return Transform(
      origin: origin,
      transform: transform as Matrix4,
      alignment: alignment,
      filterQuality: filterQuality,
      child: child,
    );
  }
}

class Matrix4skew implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.length < 2) {
      throw "skew requires 2 arguments";
    }
    double alpha = parseDouble(arguments[0]) ?? 0;
    double beta = parseDouble(arguments[1]) ?? 0;
    return Matrix4.skew(alpha, beta);
  }
}

class Matrix4skewX implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    double alpha = parseDouble(arguments.first) ?? 0;
    return Matrix4.skewX(alpha);
  }
}

class Matrix4skewY implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    double alpha = parseDouble(arguments.first) ?? 0;
    return Matrix4.skewY(alpha);
  }
}

class Matrix4translate implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.length < 3) {
      throw "translate requires 3 arguments";
    }
    double x = parseDouble(arguments[0]) ?? 0;
    double y = parseDouble(arguments[1]) ?? 0;
    double z = parseDouble(arguments[2]) ?? 0;
    return Matrix4.translationValues(x, y, z);
  }
}

class Matrix4rotationX implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    double alpha = parseDouble(arguments.first) ?? 0;
    return Matrix4.rotationX(alpha);
  }
}

class Matrix4rotationY implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    double alpha = parseDouble(arguments.first) ?? 0;
    return Matrix4.rotationY(alpha);
  }
}

class Matrix4rotationZ implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    double alpha = parseDouble(arguments.first) ?? 0;
    return Matrix4.rotationZ(alpha);
  }
}

class Matrix4scale implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.length < 3) {
      throw "scale requires 3 arguments";
    }
    double x = parseDouble(arguments[0]) ?? 0;
    double y = parseDouble(arguments[1]) ?? 0;
    double z = parseDouble(arguments[2]) ?? 0;
    return Matrix4.diagonal3Values(x, y, z);
  }
}

class IMatrix4 implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case "skew":
        return Matrix4skew();
      case "skewX":
        return Matrix4skewX();
      case "skewY":
        return Matrix4skewY();
      case "translationValues":
        return Matrix4translate();
      case "rotationX":
        return Matrix4rotationX();
      case "rotationY":
        return Matrix4rotationY();
      case "rotationZ":
        return Matrix4rotationZ();
      case "diagonal3Values":
        return Matrix4scale();
      case "zero":
        return Matrix4.zero();
      case "identity":
        return Matrix4.identity();
    }
  }

  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.length < 16) {
      throw "16 arguments required in Matrix4.fromList";
    }
    return Matrix4(
      arguments[0] as double,
      arguments[1] as double,
      arguments[2] as double,
      arguments[3] as double,
      arguments[4] as double,
      arguments[5] as double,
      arguments[6] as double,
      arguments[7] as double,
      arguments[8] as double,
      arguments[9] as double,
      arguments[10] as double,
      arguments[11] as double,
      arguments[12] as double,
      arguments[13] as double,
      arguments[14] as double,
      arguments[15] as double,
    );
  }
}

class BorderAll implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color color = Colors.black;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    double width = parseDouble(namedArguments[const Symbol('width')]) ?? 1;
    BorderStyle style = BorderStyle.solid;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as BorderStyle;
    }
    return Border.all(color: color, width: width, style: style);
  }
}

class BorderfromBorderSide implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "side required in Border.fromBorderSide";
    }
    return Border.fromBorderSide(arguments.first as BorderSide);
  }
}

class BorderSymmetric implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    BorderSide horizontal = BorderSide.none;
    var horizontalParsed = namedArguments[const Symbol('horizontal')];
    if (horizontalParsed != null) {
      horizontal = horizontalParsed as BorderSide;
    }
    BorderSide vertical = BorderSide.none;
    var verticalParsed = namedArguments[const Symbol('vertical')];
    if (verticalParsed != null) {
      vertical = verticalParsed as BorderSide;
    }
    return Border.symmetric(horizontal: horizontal, vertical: vertical);
  }
}

class IBorder implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'all':
        return BorderAll();
      case 'fromBorderSide':
        return BorderAll();
      case 'symmetric':
        return BorderSymmetric();
    }
  }

  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
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
    return Border(top: top, right: right, bottom: bottom, left: left);
  }
}

class IAlignmentDirectional implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'topStart':
        return AlignmentDirectional.topStart;
      case 'topCenter':
        return AlignmentDirectional.topCenter;
      case 'topEnd':
        return AlignmentDirectional.topEnd;
      case 'centerStart':
        return AlignmentDirectional.centerStart;
      case 'center':
        return AlignmentDirectional.center;
      case 'centerEnd':
        return AlignmentDirectional.centerEnd;
      case 'bottomStart':
        return AlignmentDirectional.bottomStart;
      case 'bottomCenter':
        return AlignmentDirectional.bottomCenter;
      case 'bottomEnd':
        return AlignmentDirectional.bottomEnd;
    }
  }

  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double start = 0;
    double end = 0;
    if (arguments.length == 2) {
      start = parseDouble(arguments[0]) ?? 0;
      end = parseDouble(arguments[1]) ?? 0;
    }
    return AlignmentDirectional(start, end);
  }
}

class IAlignment implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'topLeft':
        return Alignment.topLeft;
      case 'topCenter':
        return Alignment.topCenter;
      case 'topRight':
        return Alignment.topRight;
      case 'centerLeft':
        return Alignment.centerLeft;
      case 'center':
        return Alignment.center;
      case 'centerRight':
        return Alignment.centerRight;
      case 'bottomLeft':
        return Alignment.bottomLeft;
      case 'bottomCenter':
        return Alignment.bottomCenter;
      case 'bottomRight':
        return Alignment.bottomRight;
      default:
        return null;
    }
  }

  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double x = 0;
    double y = 0;
    if (arguments.length == 2) {
      x = parseDouble(arguments[0]) ?? 0;
      y = parseDouble(arguments[1]) ?? 0;
    }
    return Alignment(x, y);
  }
}

class IColor implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    return Color(arguments[0] as int);
  }
}

class IAssetImage implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    return AssetImage(arguments[0] as String);
  }
}

class INetworkImage implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    double scale = parseDouble(namedArguments[const Symbol('scale')]) ?? 1;
    return NetworkImage(arguments[0] as String, scale: scale);
  }
}

class ITextEditingController implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    String? text;
    if (arguments.isNotEmpty) {
      text = arguments[0] as String;
    }
    return TextEditingControllerIns(text);
  }
}

class TextEditingControllerIns extends TextEditingController
    implements LoxSetCallable, LoxGetCallable {
  final String? initText;

  TextEditingControllerIns(this.initText) : super(text: initText);

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'clear':
        return clear;
    }
  }

  @override
  Object? set(Token name, Object? value) {
    switch (name.lexeme) {
      case 'text':
        text = value as String;
        break;
    }
  }
}

class IShowDialog implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var context = namedArguments[const Symbol('context')];
    if (context == null) {
      throw "context required in showDialog";
    }
    bool barrierDismissible = true;
    var barrierDismissibleParsed =
        namedArguments[const Symbol('barrierDismissible')];
    if (barrierDismissibleParsed != null) {
      barrierDismissible = barrierDismissibleParsed as bool;
    }
    Color? barrierColor = Colors.black54;
    var barrierColorParsed = namedArguments[const Symbol('barrierColor')];
    if (barrierColorParsed != null) {
      barrierColor = barrierColorParsed as Color;
    }
    var builder = namedArguments[const Symbol('builder')];
    if (builder == null) {
      throw "builder required in showDialog";
    }
    bool useSafeArea = true;
    var useSafeAreaParsed = namedArguments[const Symbol('useSafeArea')];
    if (useSafeAreaParsed != null) {
      useSafeArea = useSafeAreaParsed as bool;
    }
    bool useRootNavigator = true;
    var useRootNavigatorParsed =
        namedArguments[const Symbol('useRootNavigator')];
    if (useRootNavigatorParsed != null) {
      useRootNavigator = useRootNavigatorParsed as bool;
    }
    return showDialog(
        context: context as BuildContext,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        useSafeArea: useSafeArea,
        useRootNavigator: useRootNavigator,
        builder: (context) {
          return (builder as LoxFunction).call(interpreter, [context], {})
              as Widget;
        });
  }
}

class IShowModalBottomSheet implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var context = namedArguments[const Symbol('context')];
    if (context == null) {
      throw "context required in showModalBottomSheet";
    }
    var builder = namedArguments[const Symbol('builder')];
    if (builder == null) {
      throw "builder required in showModalBottomSheet";
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    Color? barrierColor;
    var barrierColorParsed = namedArguments[const Symbol('barrierColor')];
    if (barrierColorParsed != null) {
      barrierColor = barrierColorParsed as Color;
    }
    bool isDismissible = true;
    var isDismissibleParsed = namedArguments[const Symbol('isDismissible')];
    if (isDismissibleParsed != null) {
      isDismissible = isDismissibleParsed as bool;
    }
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    BoxConstraints? constraints;
    var constraintsParsed = namedArguments[const Symbol('constraints')];
    if (constraintsParsed != null) {
      constraints = constraintsParsed as BoxConstraints;
    }
    return showModalBottomSheet(
        context: context as BuildContext,
        backgroundColor: backgroundColor,
        barrierColor: barrierColor,
        isDismissible: isDismissible,
        elevation: elevation,
        constraints: constraints,
        shape: shape,
        builder: (context) {
          return (builder as LoxFunction).call(interpreter, [context], {})
              as Widget;
        });
  }
}

class IDateFormat implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    var formatStr = arguments[0] as String;
    return DateFormatIns(formatStr);
  }
}

class DateFormatIns extends DateFormat implements LoxGetCallable {
  final String formatStr;
  DateFormatIns(this.formatStr) : super(formatStr);

  @override
  Object? get(Token name) {
    if (name.lexeme == "format") {
      return format;
    } else if (name.lexeme == "parse") {
      return parse;
    }
    throw "Unknown property: ${name.lexeme}";
  }
}

class IDateTime implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    if (name.lexeme == "now") {
      return DateTimeNow();
    } else if (name.lexeme == "utc") {
      return DateTimeUTC();
    } else if (name.lexeme == "parse") {
      return DateTimeParse();
    }
    throw "Unknown property: ${name.lexeme}";
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    var year = arguments[0] as int;
    if (arguments.length == 1) {
      return DateTime(year);
    }
    var month = arguments[1] as int;
    if (arguments.length == 2) {
      return DateTime(year, month);
    }
    var day = arguments[2] as int;
    if (arguments.length == 3) {
      return DateTime(year, month, day);
    }
    var hour = arguments[3] as int;
    if (arguments.length == 4) {
      return DateTime(year, month, day, hour);
    }
    var minute = arguments[4] as int;
    if (arguments.length == 5) {
      return DateTime(year, month, day, hour, minute);
    }
    var second = arguments[5] as int;
    if (arguments.length == 6) {
      return DateTime(year, month, day, hour, minute, second);
    }
    var millisecond = arguments[6] as int;
    if (arguments.length == 7) {
      return DateTime(year, month, day, hour, minute, second, millisecond);
    }
  }
}

class DateTimeNow implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return DateTime.now();
  }
}

class DateTimeUTC implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    var year = arguments[0] as int;
    if (arguments.length == 1) {
      return DateTime.utc(year);
    }
    var month = arguments[1] as int;
    if (arguments.length == 2) {
      return DateTime.utc(year, month);
    }
    var day = arguments[2] as int;
    if (arguments.length == 3) {
      return DateTime.utc(year, month, day);
    }
    var hour = arguments[3] as int;
    if (arguments.length == 4) {
      return DateTime.utc(year, month, day, hour);
    }
    var minute = arguments[4] as int;
    if (arguments.length == 5) {
      return DateTime.utc(year, month, day, hour, minute);
    }
    var second = arguments[5] as int;
    if (arguments.length == 6) {
      return DateTime.utc(year, month, day, hour, minute, second);
    }
    var millisecond = arguments[6] as int;
    if (arguments.length == 7) {
      return DateTime.utc(year, month, day, hour, minute, second, millisecond);
    }
  }
}

class DateTimeParse implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    var dateTimeStr = arguments[0] as String;
    return DateTime.parse(dateTimeStr);
  }
}

class IRegExp implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    var pattern = arguments[0] as String;
    bool unicode = false;
    var unicodeParsed = namedArguments[const Symbol('unicode')];
    if (unicodeParsed != null) {
      unicode = unicodeParsed as bool;
    }
    bool multiLine = false;
    var multiLineParsed = namedArguments[const Symbol('multiLine')];
    if (multiLineParsed != null) {
      multiLine = multiLineParsed as bool;
    }
    bool caseSensitive = true;
    var caseSensitiveParsed = namedArguments[const Symbol('caseSensitive')];
    if (caseSensitiveParsed != null) {
      caseSensitive = caseSensitiveParsed as bool;
    }
    bool dotAll = false;
    var dotAllParsed = namedArguments[const Symbol('dotAll')];
    if (dotAllParsed != null) {
      dotAll = dotAllParsed as bool;
    }
    return RegExpIns(RegExp(pattern,
        multiLine: multiLine,
        unicode: unicode,
        caseSensitive: caseSensitive,
        dotAll: dotAll));
  }
}

class RegExpIns implements LoxGetCallable {
  final RegExp _regExp;
  RegExpIns(this._regExp);

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'regexp':
        return _regExp;
      case 'allMatches':
        return _regExp.allMatches;
      case 'firstMatch':
        return _regExp.firstMatch;
      case 'hasMatch':
        return _regExp.hasMatch;
      case 'stringMatch':
        return _regExp.stringMatch;
    }
    throw "Unknown property: ${name.lexeme}";
  }
}
