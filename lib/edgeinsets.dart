import 'package:flutter/material.dart';
import 'utils.dart';
import 'api.dart';

final edgeInsetsMap = {
  "all": (Object value) {
    return EdgeInsets.all(parseDouble(value) ?? 0);
  },
  "symmetric": ({Object? horizontal, Object? vertical}) {
    return EdgeInsets.symmetric(
        horizontal: parseDouble(horizontal) ?? 0,
        vertical: parseDouble(vertical) ?? 0);
  }
};

final borderMap = {
  "all": ({Object? width, Object? color}) {
    double _width = parseDouble(width) ?? 1.0;
    Color _color = Colors.black;
    if (color is Color) {
      _color = color;
    }
    return Border.all(width: _width, color: _color);
  }
};

final radiusMap = {
  "circular": (Object value) {
    return Radius.circular(parseDouble(value) ?? 0);
  }
};

final borderRadiusMap = {
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

final transformMap = {
  "translate": ({Object? offset, Object? child}) {
    Offset _offset = Offset.zero;
    if (offset is Offset) {
      _offset = offset;
    }
    Widget? _child;
    if (child is Widget) {
      _child = child;
    }
    return Transform.translate(
      offset: _offset,
      child: _child,
    );
  },
  "rotate": ({Object? angle, Object? child}) {
    double _angle = parseDouble(angle) ?? 0;
    Widget? _child;
    if (child is Widget) {
      _child = child;
    }
    return Transform.rotate(
      angle: _angle,
      child: _child,
    );
  },
  "scale": ({Object? scale, Object? child}) {
    double _scale = parseDouble(scale) ?? 0;
    Widget? _child;
    if (child is Widget) {
      _child = child;
    }
    return Transform.scale(
      scale: _scale,
      child: _child,
    );
  }
};

final matrix4Map = {
  "skew": (Object? x, Object? y) {
    return Matrix4.skew(parseDouble(x) ?? 0, parseDouble(y) ?? 0);
  },
  "skewX": (Object? x) {
    return Matrix4.skewX(parseDouble(x) ?? 0);
  },
  "skewY": (Object? y) {
    return Matrix4.skewY(parseDouble(y) ?? 0);
  },
  "translate": (Object? x, Object? y, Object? z) {
    return Matrix4.translationValues(
        parseDouble(x) ?? 0, parseDouble(y) ?? 0, parseDouble(z) ?? 0);
  },
  "rotationX": (Object? x) {
    return Matrix4.rotationX(parseDouble(x) ?? 0);
  },
  "rotationY": (Object? y) {
    return Matrix4.rotationY(parseDouble(y) ?? 0);
  },
  "rotationZ": (Object? z) {
    return Matrix4.rotationZ(parseDouble(z) ?? 0);
  },
  "scale": (Object? x, Object? y, Object? z) {
    return Matrix4.diagonal3Values(
        parseDouble(x) ?? 1, parseDouble(y) ?? 1, parseDouble(z) ?? 1);
  },
};

final navigatorMap = {
  "pop": (Object? context) {
    Navigator.pop(context as BuildContext);
  }
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
  }
};
