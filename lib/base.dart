import 'package:dax/dax.dart';
import 'package:dax/lox_callable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'utils.dart';

class IOffset implements LoxFlutterFunction, LoxGetCallable {
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

class IUri implements LoxFlutterFunction {
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
    return Uri(
        scheme: scheme,
        host: host,
        port: port,
        path: path,
        query: query,
        queryParameters: queryParameters,
        fragment: fragment);
  }
}

class ISize implements LoxFlutterFunction {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double width = 0;
    double height = 0;
    if (arguments.length == 2) {
      width = parseDouble(arguments[0]) ?? 0;
      height = parseDouble(arguments[1]) ?? 0;
    }
    return Size(width, height);
  }
}

class IAlignment implements LoxFlutterFunction, LoxGetCallable {
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

class IColor implements LoxFlutterFunction {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    return Color(arguments[0] as int);
  }
}

class IAssetImage implements LoxFlutterFunction {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    return AssetImage(arguments[0] as String);
  }
}

class INetworkImage implements LoxFlutterFunction {
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

class ITextEditingController implements LoxFlutterFunction {
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

class IShowDialog implements LoxFlutterFunction {
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

class IShowModalBottomSheet implements LoxFlutterFunction {
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

class IDateFormat implements LoxFlutterFunction {
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

class IDateTime implements LoxFlutterFunction, LoxGetCallable {
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

class DateTimeNow implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return DateTime.now();
  }
}

class DateTimeUTC implements LoxFlutterFunction {
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

class DateTimeParse implements LoxFlutterFunction {
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

class IRegExp implements LoxFlutterFunction {
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
    return RegExpIns(pattern,
        multiLine: multiLine,
        unicode: unicode,
        caseSensitive: caseSensitive,
        dotAll: dotAll);
  }
}

class RegExpIns implements LoxGetCallable {
  final RegExp _regExp;
  final String source;
  final bool multiLine;
  final bool unicode;
  final bool caseSensitive;
  final bool dotAll;

  RegExpIns(this.source,
      {this.multiLine = false,
      this.unicode = false,
      this.caseSensitive = true,
      this.dotAll = false})
      : _regExp = RegExp(source,
            multiLine: multiLine,
            unicode: unicode,
            caseSensitive: caseSensitive,
            dotAll: dotAll);

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
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
