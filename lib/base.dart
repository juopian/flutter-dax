import 'package:dax/dax.dart';
import 'package:dax/lox_callable.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class IOffset implements LoxFlutterFunction, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'zero':
        return Offset.zero;
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


class IUri implements LoxFlutterFunction  {  

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
    return Color(arguments[0] as int);
  }
}

class IAssetImage implements LoxFlutterFunction {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return AssetImage(arguments[0] as String);
  }
}

class INetworkImage implements LoxFlutterFunction {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return NetworkImage(arguments[0] as String);
  }
}

class ITextEditingController implements LoxFlutterFunction {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return TextEditingControllerIns();
  }
}

class TextEditingControllerIns extends TextEditingController
    implements LoxSetCallable {
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
    return showDialog(
        context: context as BuildContext,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
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
    return showModalBottomSheet(
        context: context as BuildContext,
        backgroundColor: backgroundColor,
        barrierColor: barrierColor,
        isDismissible: isDismissible,
        elevation: elevation,
        builder: (context) {
          return (builder as LoxFunction).call(interpreter, [context], {})
              as Widget;
        });
  }
}

// class TabControllerIns extends TabController implements LoxSetCallable {
//   TabControllerIns(initialIndex, self)
//       : super(length: initialIndex, vsync: self);

//   @override
//   Object? set(Token name, Object? value) {
//     switch (name.lexeme) {
//       case 'text':
//         text = value as String;
//         break;
//     }
//   }
// }
