import "package:flutter/material.dart";
import 'dart:math';
import 'dart:convert';
import 'utils.dart';
import 'http.dart';

final edgeInsetsMap = {
  "all": (Object value) {
    return EdgeInsets.all(parseDouble(value) ?? 0);
  },
  "fromLTRB": (Object left, Object top, Object right, Object bottom) {
    return EdgeInsets.fromLTRB(parseDouble(left) ?? 0, parseDouble(top) ?? 0,
        parseDouble(right) ?? 0, parseDouble(bottom) ?? 0);
  },
  "only": ({Object? left, Object? top, Object? right, Object? bottom}) {
    return EdgeInsets.only(
        left: parseDouble(left) ?? 0,
        top: parseDouble(top) ?? 0,
        right: parseDouble(right) ?? 0,
        bottom: parseDouble(bottom) ?? 0);
  },
  "symmetric": ({Object? horizontal, Object? vertical}) {
    return EdgeInsets.symmetric(
        horizontal: parseDouble(horizontal) ?? 0,
        vertical: parseDouble(vertical) ?? 0);
  }
};

final radiusMap = {
  "zero": Radius.zero,
  "circular": (Object value) {
    return Radius.circular(parseDouble(value) ?? 0);
  },
  "elliptical": (Object x, Object y) {
    return Radius.elliptical(parseDouble(x) ?? 0, parseDouble(y) ?? 0);
  },
};

final borderRadiusMap = {
  "zero": BorderRadius.zero,
  "circular": (Object value) {
    return BorderRadius.circular(parseDouble(value) ?? 0);
  },
  "all": (Object value) {
    return BorderRadius.all(value as Radius);
  },
  "horizontal": ({Object? left, Object? right}) {
    Radius _left = Radius.zero;
    Radius _right = Radius.zero;
    if (left is Radius) {
      _left = left;
    }
    if (right is Radius) {
      _right = right;
    }
    return BorderRadius.horizontal(
      left: _left,
      right: _right,
    );
  },
  "vertical": ({Object? top, Object? bottom}) {
    Radius _top = Radius.zero;
    Radius _bottom = Radius.zero;
    if (top is Radius) {
      _top = top;
    }
    if (bottom is Radius) {
      _bottom = bottom;
    }
    return BorderRadius.vertical(
      top: _top,
      bottom: _bottom,
    );
  },
  "only": (
      {Object? topLeft,
      Object? topRight,
      Object? bottomRight,
      Object? bottomLeft}) {
    Radius _topLeft = Radius.zero;
    Radius _topRight = Radius.zero;
    Radius _bottomRight = Radius.zero;
    Radius _bottomLeft = Radius.zero;
    if (topLeft is Radius) {
      _topLeft = topLeft;
    }
    if (topRight is Radius) {
      _topRight = topRight;
    }
    if (bottomRight is Radius) {
      _bottomRight = bottomRight;
    }
    if (bottomLeft is Radius) {
      _bottomLeft = bottomLeft;
    }

    return BorderRadius.only(
      topLeft: _topLeft,
      topRight: _topRight,
      bottomRight: _bottomRight,
      bottomLeft: _bottomLeft,
    );
  }
};

final navigatorMap = {
  "pop": (Object? context) {
    Navigator.pop(context as BuildContext);
  },
  "push": (Object? context, Object? route) {
    Navigator.push(context as BuildContext, route as Route);
  },
  "pushNamed": (Object? context, Object? routeName, {Object? arguments}) {
    Navigator.pushNamed(context as BuildContext, routeName as String,
        arguments: arguments);
  },
  "pushReplacement": (Object? context, Object? route) {
    Navigator.pushReplacement(context as BuildContext, route as Route);
  },
};

final apiMap = {
  "get": (Object? url, {Object? debug}) {
    bool _debug = false;
    if (debug != null) {
      _debug = debug as bool;
    }
    return Api.get(url as String, debug: _debug);
  },
  "post": (Object? url, Object? body, {Object? debug}) {
    bool _debug = false;
    if (debug != null) {
      _debug = debug as bool;
    }
    return Api.post(url as String, body, debug: _debug);
  },
  "jwt": () => Api.jwt,
  "version": () => Api.version,
  "platform": () => Api.platform,
  "buildNumber": () => Api.buildNumber
};

final mathMap = {
  "min": (Object x, Object y) {
    return min(x as num, y as num); 
  },
  "max": (Object x, Object y) {
    return max(x as num, y as num); 
  },
  "randomInt": (Object x) {
    return Random().nextInt(x as int);
  },
  "randomDouble": () {
    return Random().nextDouble();
  },
  "randomBool": () {
    return Random().nextBool();
  },
  "sin": (Object x) {
    return asin(x as num);
  },
  "asin": (Object x) {
    return asin(x as num);
  },
  "cos": (Object x) {
    return acos(x as num);
  },
  "acos": (Object x) {
    return acos(x as num);
  },
  "tan": (Object x) {
    return atan(x as num);
  },
  "atan": (Object x) {
    return atan(x as num);
  },
  "atan2": (Object a, Object b) {
    return atan2(a as num, b as num);
  },
  "sqrt": (Object x) {
    return sqrt(x as num);
  },
  "exp": (Object x) {
    return exp(x as num);
  },
  "log": (Object x) {
    return log(x as num);
  },
  "pow": (Object a, Object b) {
    return pow(a as num, b as num);
  }
};

final jsonMap = {
  "encode": (Object value) {
    return json.encode(value);
  },
  "decode": (Object value) {
    return json.decode(value as String);
  }
};
