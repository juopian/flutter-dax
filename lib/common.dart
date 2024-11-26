import 'dart:io';
import 'package:open_file/open_file.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart';
import 'dart:math';
import 'dart:convert';
import 'base.dart';
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

final doubleMap = {"infinity": double.infinity, "parse": double.parse};

final intMap = {
  "parse": (Object value, {Object? radix}) {
    return int.parse(value.toString(), radix: radix as int? ?? 10);
  },
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

final openFileMap = {
  "open": (Object? file) {
    return OpenFile.open(file as String);
  }
};

var httpMap = {
  'get': (Object url, {Object? headers}) {
    Map<String, String> _headers = {};
    if (headers is Map) {
      headers.forEach((key, value) {
        _headers[key.toString()] = value.toString();
      });
    }
    return get(url as Uri, headers: _headers).then((response) {
      return IResponse(response);
    });
  },
  'post': (Object url, {Object? headers, Object? body}) {
    Map<String, String> _headers = {};
    if (headers is Map) {
      headers.forEach((key, value) {
        _headers[key.toString()] = value.toString();
      });
    }
    return post(url as Uri, headers: _headers, body: body).then((response) {
      return IResponse(response);
    });
  }
};

final clipboardMap = {
  "setData": (Object data) {
    return Clipboard.setData(data as ClipboardData);
  },
  "getData": (Object format) {
    return Clipboard.getData(format as String);
  }
};

final platformMap = {
  "isAndroid": Platform.isAndroid,
  "isIOS": Platform.isIOS,
  "isMacOS": Platform.isMacOS,
  "isWindows": Platform.isWindows,
  "isLinux": Platform.isLinux,
  "isFuchsia": Platform.isFuchsia,
  "localHostname": Platform.localHostname,
  "localeName": Platform.localeName,
  "operatingSystem": Platform.operatingSystem,
  "version": Platform.version,
};

final apiMap = {
  "get": (Object? url, {Object? debug, Object? headers}) {
    bool _debug = false;
    if (debug != null) {
      _debug = debug as bool;
    }
    Map<String, String> _headers = {};
    if (headers is Map) {
      headers.forEach((key, value) {
        _headers[key.toString()] = value.toString();
      });
    }
    return Api.get(url as String, debug: _debug, headers: _headers);
  },
  "post": (Object? url, {Object? body, Object? debug, Object? headers}) {
    bool _debug = false;
    if (debug != null) {
      _debug = debug as bool;
    }
    Map<String, String> _headers = {};
    if (headers is Map) {
      headers.forEach((key, value) {
        _headers[key.toString()] = value.toString();
      });
    }
    return Api.post(url as String,
        body: body, debug: _debug, headers: _headers);
  },
  "uploadFile": (Object? url,
      {Object? headers, Object? imagePath, Object? fieldName}) {
    Map<String, String> _headers = {};
    if (headers is Map) {
      headers.forEach((key, value) {
        _headers[key.toString()] = value.toString();
      });
    }
    return Api.uploadFile(url as String,
        headers: _headers,
        imagePath: imagePath as String,
        fieldName: fieldName as String);
  }
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

final base64Map = {
  "encode": (Object bytes) {
    return base64Encode(bytes as List<int>);
  },
  "decode": (Object value) {
    return base64Decode(value as String);
  }
};

final pathMap = {
  "join": (
    Object path1, [
    Object? path2,
    Object? path3,
    Object? path4,
    Object? path5,
    Object? path6,
    Object? path7,
    Object? path8,
  ]) {
    if (path8 != null) {
      return p.join(
          path1 as String,
          path2 as String,
          path3 as String,
          path4 as String,
          path5 as String,
          path6 as String,
          path7 as String,
          path8 as String);
    } else if (path7 != null) {
      return p.join(path1 as String, path2 as String, path3 as String,
          path4 as String, path5 as String, path6 as String, path7 as String);
    } else if (path6 != null) {
      return p.join(path1 as String, path2 as String, path3 as String,
          path4 as String, path5 as String, path6 as String);
    } else if (path5 != null) {
      return p.join(path1 as String, path2 as String, path3 as String,
          path4 as String, path5 as String);
    } else if (path4 != null) {
      return p.join(
          path1 as String, path2 as String, path3 as String, path4 as String);
    } else if (path3 != null) {
      return p.join(path1 as String, path2 as String, path3 as String);
    } else if (path2 != null) {
      return p.join(path1 as String, path2 as String);
    } else {
      return p.join(path1 as String);
    }
  },
  "joinAll": (Object parts) {
    return p.joinAll(parts as List<String>);
  },
  "absolute": (Object path) {
    return p.absolute(path as String);
  },
  "relative": (Object path, {Object? from}) {
    return p.relative(path as String, from: from as String);
  },
  "dirname": (Object path) {
    return p.dirname(path as String);
  },
  "basename": (Object path) {
    return p.basename(path as String);
  },
  "basenameWithoutExtension": (Object path) {
    return p.basenameWithoutExtension(path as String);
  },
  "extension": (Object path) {
    return p.extension(path as String);
  },
  "normalize": (Object path) {
    return p.normalize(path as String);
  },
  "isAbsolute": (Object path) {
    return p.isAbsolute(path as String);
  },
  "isRelative": (Object path) {
    return p.isRelative(path as String);
  },
  "split": (Object path) {
    return p.split(path as String);
  }
};
