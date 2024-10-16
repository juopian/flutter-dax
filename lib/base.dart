import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dax/dax.dart';
import 'package:dax/lox_callable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'utils.dart';

class FromPlatformBuilder implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return PackageInfo.fromPlatform().then((packageInfo) {
      return PackageInfoIns(
        appName_: packageInfo.appName,
        packageName_: packageInfo.packageName,
        version_: packageInfo.version,
        buildNumber_: packageInfo.buildNumber,
        buildSignature_: packageInfo.buildSignature,
      );
    });
  }
}

class IPackageInfo implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'fromPlatform':
        return FromPlatformBuilder();
    }
  }
}

class PackageInfoIns extends PackageInfo implements LoxGetCallable {
  final String appName_;
  final String packageName_;
  final String version_;
  final String buildNumber_;
  final String buildSignature_;
  PackageInfoIns({
    required this.appName_,
    required this.packageName_,
    required this.version_,
    required this.buildNumber_,
    this.buildSignature_ = '',
  }) : super(
          appName: appName_,
          packageName: packageName_,
          version: version_,
          buildNumber: buildNumber_,
          buildSignature: buildSignature_,
        );

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'appName':
        return appName_;
      case 'packageName':
        return packageName_;
      case 'version':
        return version_;
      case 'buildNumber':
        return buildNumber_;
      case 'buildSignature':
        return buildSignature_;
    }
  }
}

class IFile implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "file required in File";
    }
    return FileIns(File(arguments.first as String));
  }
}

class FileIns implements File, LoxGetCallable {
  final File _file;
  FileIns(this._file);
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'writeAsStringSync':
        return _file.writeAsStringSync;
      case 'writeAsBytesSync':
        return _file.writeAsBytesSync;
      case 'writeAsString':
        return _file.writeAsString;
      case 'writeAsBytes':
        return _file.writeAsBytes;
      case 'path':
        return _file.path;
    }
  }

  @override
  File get absolute => throw UnimplementedError();

  @override
  Future<File> copy(String newPath) {
    throw UnimplementedError();
  }

  @override
  File copySync(String newPath) {
    throw UnimplementedError();
  }

  @override
  Future<File> create({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  void createSync({bool recursive = false}) {}

  @override
  Future<FileSystemEntity> delete({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  void deleteSync({bool recursive = false}) {}

  @override
  Future<bool> exists() {
    throw UnimplementedError();
  }

  @override
  bool existsSync() {
    throw UnimplementedError();
  }

  @override
  bool get isAbsolute => throw UnimplementedError();

  @override
  Future<DateTime> lastAccessed() {
    throw UnimplementedError();
  }

  @override
  DateTime lastAccessedSync() {
    throw UnimplementedError();
  }

  @override
  Future<DateTime> lastModified() {
    throw UnimplementedError();
  }

  @override
  DateTime lastModifiedSync() {
    throw UnimplementedError();
  }

  @override
  Future<int> length() {
    throw UnimplementedError();
  }

  @override
  int lengthSync() {
    throw UnimplementedError();
  }

  @override
  Future<RandomAccessFile> open({FileMode mode = FileMode.read}) {
    throw UnimplementedError();
  }

  @override
  Stream<List<int>> openRead([int? start, int? end]) {
    throw UnimplementedError();
  }

  @override
  RandomAccessFile openSync({FileMode mode = FileMode.read}) {
    throw UnimplementedError();
  }

  @override
  IOSink openWrite({FileMode mode = FileMode.write, Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  Directory get parent => throw UnimplementedError();

  @override
  String get path => throw UnimplementedError();

  @override
  Future<Uint8List> readAsBytes() {
    throw UnimplementedError();
  }

  @override
  Uint8List readAsBytesSync() {
    throw UnimplementedError();
  }

  @override
  Future<List<String>> readAsLines({Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  List<String> readAsLinesSync({Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  Future<String> readAsString({Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  String readAsStringSync({Encoding encoding = utf8}) {
    throw UnimplementedError();
  }

  @override
  Future<File> rename(String newPath) {
    throw UnimplementedError();
  }

  @override
  File renameSync(String newPath) {
    throw UnimplementedError();
  }

  @override
  Future<String> resolveSymbolicLinks() {
    throw UnimplementedError();
  }

  @override
  String resolveSymbolicLinksSync() {
    throw UnimplementedError();
  }

  @override
  Future setLastAccessed(DateTime time) {
    throw UnimplementedError();
  }

  @override
  void setLastAccessedSync(DateTime time) {}

  @override
  Future setLastModified(DateTime time) {
    throw UnimplementedError();
  }

  @override
  void setLastModifiedSync(DateTime time) {}

  @override
  Future<FileStat> stat() {
    throw UnimplementedError();
  }

  @override
  FileStat statSync() {
    throw UnimplementedError();
  }

  @override
  Uri get uri => throw UnimplementedError();

  @override
  Stream<FileSystemEvent> watch(
      {int events = FileSystemEvent.all, bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  Future<File> writeAsBytes(List<int> bytes,
      {FileMode mode = FileMode.write, bool flush = false}) {
    throw UnimplementedError();
  }

  @override
  void writeAsBytesSync(List<int> bytes,
      {FileMode mode = FileMode.write, bool flush = false}) {}

  @override
  Future<File> writeAsString(String contents,
      {FileMode mode = FileMode.write,
      Encoding encoding = utf8,
      bool flush = false}) {
    throw UnimplementedError();
  }

  @override
  void writeAsStringSync(String contents,
      {FileMode mode = FileMode.write,
      Encoding encoding = utf8,
      bool flush = false}) {}
}

class IResponse implements Response, LoxGetCallable {
  final Response _response;
  IResponse(this._response);
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'body':
        return _response.body;
      case 'bodyBytes':
        return _response.bodyBytes;
      case 'statusCode':
        return _response.statusCode;
      case 'contentLength':
        return _response.contentLength;
      case 'headers':
        return _response.headers;
    }
  }

  @override
  String get body => _response.body;

  @override
  Uint8List get bodyBytes => _response.bodyBytes;

  @override
  int? get contentLength => _response.contentLength;

  @override
  Map<String, String> get headers => _response.headers;

  @override
  bool get isRedirect => _response.isRedirect;

  @override
  bool get persistentConnection => _response.persistentConnection;

  @override
  String? get reasonPhrase => _response.reasonPhrase;

  @override
  BaseRequest? get request => throw UnimplementedError();

  @override
  int get statusCode => _response.statusCode;
}

class IDirectory implements Directory, LoxGetCallable {
  final Directory _directory;
  IDirectory(this._directory);

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'path':
        return _directory.path;
      case 'uri':
        return _directory.uri;
    }
  }

  @override
  Directory get absolute => _directory.absolute;

  @override
  Future<Directory> create({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  void createSync({bool recursive = false}) {}

  @override
  Future<Directory> createTemp([String? prefix]) {
    throw UnimplementedError();
  }

  @override
  Directory createTempSync([String? prefix]) {
    throw UnimplementedError();
  }

  @override
  Future<FileSystemEntity> delete({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  void deleteSync({bool recursive = false}) {}

  @override
  Future<bool> exists() {
    throw UnimplementedError();
  }

  @override
  bool existsSync() {
    throw UnimplementedError();
  }

  @override
  bool get isAbsolute => _directory.isAbsolute;

  @override
  Stream<FileSystemEntity> list(
      {bool recursive = false, bool followLinks = true}) {
    throw UnimplementedError();
  }

  @override
  List<FileSystemEntity> listSync(
      {bool recursive = false, bool followLinks = true}) {
    throw UnimplementedError();
  }

  @override
  Directory get parent => _directory.parent;

  @override
  String get path => _directory.path;

  @override
  Future<Directory> rename(String newPath) {
    throw UnimplementedError();
  }

  @override
  Directory renameSync(String newPath) {
    throw UnimplementedError();
  }

  @override
  Future<String> resolveSymbolicLinks() {
    throw UnimplementedError();
  }

  @override
  String resolveSymbolicLinksSync() {
    throw UnimplementedError();
  }

  @override
  Future<FileStat> stat() {
    throw UnimplementedError();
  }

  @override
  FileStat statSync() {
    throw UnimplementedError();
  }

  @override
  Uri get uri => _directory.uri;

  @override
  Stream<FileSystemEvent> watch(
      {int events = FileSystemEvent.all, bool recursive = false}) {
    throw UnimplementedError();
  }
}

class IgetApplicationDocumentsDirectory implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return getApplicationDocumentsDirectory().then((path) {
      return IDirectory(path);
    });
  }
}

class IgetTemporaryDirectory implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return getTemporaryDirectory().then((path) {
      return IDirectory(path);
    });
  }
}

class IgetDownloadsDirectory implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return getDownloadsDirectory().then((path) {
      if (path == null) return null;
      return IDirectory(path);
    });
  }
}

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

class UriParseBuilder implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    String uriString = arguments.first as String;
    return UriIns(Uri.parse(uriString));
  }
}

class UriIns implements Uri, LoxGetCallable {
  final Uri uri;
  UriIns(this.uri);

  @override
  String toString() {
    return uri.toString();
  }

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
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
      case 'pathSegments':
        return uri.pathSegments;
    }
  }

  @override
  String get authority => uri.authority;

  @override
  UriData? get data => uri.data;

  @override
  String get fragment => uri.fragment;

  @override
  bool get hasAbsolutePath => uri.hasAbsolutePath;

  @override
  bool get hasAuthority => uri.hasAuthority;

  @override
  bool get hasEmptyPath => uri.hasEmptyPath;

  @override
  bool get hasFragment => uri.hasFragment;

  @override
  bool get hasPort => uri.hasPort;

  @override
  bool get hasQuery => uri.hasQuery;

  @override
  bool get hasScheme => uri.hasScheme;

  @override
  String get host => uri.host;

  @override
  bool get isAbsolute => uri.isAbsolute;

  @override
  bool isScheme(String scheme) {
    return uri.isScheme(scheme);
  }

  @override
  Uri normalizePath() {
    return uri.normalizePath();
  }

  @override
  String get origin => uri.origin;

  @override
  String get path => uri.path;

  @override
  List<String> get pathSegments => uri.pathSegments;

  @override
  int get port => uri.port;

  @override
  String get query => uri.query;

  @override
  Map<String, String> get queryParameters => uri.queryParameters;

  @override
  Map<String, List<String>> get queryParametersAll => uri.queryParametersAll;

  @override
  Uri removeFragment() {
    return uri.removeFragment();
  }

  @override
  Uri replace(
      {String? scheme,
      String? userInfo,
      String? host,
      int? port,
      String? path,
      Iterable<String>? pathSegments,
      String? query,
      Map<String, dynamic>? queryParameters,
      String? fragment}) {
    return uri.replace(
        scheme: scheme,
        userInfo: userInfo,
        host: host,
        port: port,
        path: path,
        pathSegments: pathSegments,
        query: query,
        queryParameters: queryParameters,
        fragment: fragment);
  }

  @override
  Uri resolve(String reference) {
    return uri.resolve(reference);
  }

  @override
  Uri resolveUri(Uri reference) {
    return uri.resolveUri(reference);
  }

  @override
  String get scheme => uri.scheme;

  @override
  String toFilePath({bool? windows}) {
    return uri.toFilePath(windows: windows);
  }

  @override
  String get userInfo => uri.userInfo;
}

class IUri implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'parse':
        return UriParseBuilder();
      case 'encodeFull':
        return Uri.encodeFull;
      case 'encodeComponent':
        return Uri.encodeComponent;
      case 'decodeComponent':
        return Uri.decodeComponent;
      case 'decodeFull':
        return Uri.decodeFull;
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

class ISize implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'fromHeight':
        return SizefromHeight();
      case 'fromWidth':
        return SizefromWidth();
      case 'fromRadius':
        return SizefromRadius();
      case 'square':
        return Sizesquare();
    }
  }

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

class IValueNotifier implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "value required in ValueNotifier";
    }
    var value = arguments.first;
    return ValueNotifierIns(value!);
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  final FloatingActionButtonLocation baseLocation;
  final Offset offset;

  CustomFloatingActionButtonLocation(this.baseLocation,
      {this.offset = Offset.zero});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final Offset baseOffset = baseLocation.getOffset(scaffoldGeometry);
    return baseOffset + offset;
  }
}

class ICustomFloatingActionButtonLocation extends DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "value required in CustomFloatingActionButtonLocation";
    }
    var value = arguments.first;
    Offset offset = Offset.zero;
    var offsetParsed = namedArguments[const Symbol('offset')];
    if (offsetParsed != null) {
      offset = offsetParsed as Offset;
    }
    return CustomFloatingActionButtonLocation(
        value as FloatingActionButtonLocation,
        offset: offset);
  }
}

class ValueNotifierIns extends ChangeNotifier
    implements LoxGetCallable, LoxSetCallable, ValueListenable {
  ValueNotifierIns(this._value);
  @override
  Object? set(Token name, Object? value) {
    switch (name.lexeme) {
      case 'value':
        if (_value == value) {
          break;
        }
        _value = value!;
        notifyListeners();
        break;
    }
  }

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'value':
        return _value;
    }
  }

  @override
  Object get value => _value;
  Object _value;
  set value(Object newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }
}

class IValueListenableBuilder implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    var valueListenable = namedArguments[const Symbol('valueListenable')];
    if (valueListenable == null) {
      throw "valueListenable required in ValueListenableBuilder";
    }
    var builder = namedArguments[const Symbol('builder')];
    if (builder == null) {
      throw "builder required in ListView.builder";
    }
    return ValueListenableBuilder(
        builder: (context, value, child) {
          return (builder as LoxFunction)
              .call(interpreter, [context, value, child], {}) as Widget;
        },
        valueListenable: valueListenable as ValueListenable,
        child: child);
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

class ColorFromARGBBuilder implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.length < 4) {
      throw "Argument must be at least 4.";
    }
    return Color.fromARGB(arguments[0] as int, arguments[1] as int,
        arguments[2] as int, arguments[3] as int);
  }
}

class ColorFromRGBOBuilder implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.length < 4) {
      throw "Argument must be at least 4.";
    }
    return Color.fromRGBO(arguments[0] as int, arguments[1] as int,
        arguments[2] as int, arguments[3] as double);
  }
}

class IColor implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'transparent':
        return Colors.transparent;
      case 'fromARGB':
        return ColorFromARGBBuilder();
      case 'fromRGBO':
        return ColorFromRGBOBuilder();
    }
  }

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

class IFocusNode implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return FocusNodeIns();
  }
}

class FocusNodeIns extends FocusNode implements LoxGetCallable {
  FocusNodeIns() : super(debugLabel: 'FocusNodeIns');

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'unfocus':
        return unfocus;
      case 'hasFocus':
        return hasFocus;
      case 'canRequestFocus':
        return canRequestFocus;
      case 'requestFocus':
        return requestFocus;
      case 'dispose':
        return dispose;
    }
  }
}

class IPageController implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    int initialPage = 0;
    var initialPageParsed = namedArguments[const Symbol('initialPage')];
    if (initialPageParsed != null) {
      initialPage = initialPageParsed as int;
    }
    return PageControllerIns(initialPage);
  }
}

class PageControllerIns extends PageController implements LoxGetCallable {
  final int index;
  PageControllerIns(this.index) : super(initialPage: index);

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'page':
        return page;
      case 'animateToPage':
        return animateToPage;
      case 'jumpToPage':
        return jumpToPage;
      case 'dispose':
        return dispose;
    }
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
      case 'text':
        return text;
      case 'dispose':
        return dispose;
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

class ScaffoldMessengerIns implements LoxGetCallable {
  final ScaffoldMessengerState state;
  ScaffoldMessengerIns(this.state);
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'showSnackBar':
        return state.showSnackBar;
    }
  }
}

class ScaffoldMessengerBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    return ScaffoldMessengerIns(
        ScaffoldMessenger.of(arguments.first as BuildContext));
  }
}

class IScaffoldMessenger implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'of':
        return ScaffoldMessengerBuilder();
    }
  }
}

class MediaQueryIns implements LoxGetCallable {
  final MediaQueryData data;
  MediaQueryIns(this.data);
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'size':
        return SizeIns(data.size.width, data.size.height);
      case 'devicePixelRatio':
        return data.devicePixelRatio;
      case 'textScaleFactor':
        return data.textScaleFactor;
      case 'padding':
        return data.padding;
    }
  }
}

class MediaQueryBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    return MediaQueryIns(MediaQuery.of(arguments.first as BuildContext));
  }
}

class IMediaQuery implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'of':
        return MediaQueryBuilder();
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
        builder: (ctx) {
          return (builder as LoxFunction).call(interpreter, [ctx], {})
              as Widget;
        });
  }
}

class IMaterialPageRoute implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var builder = namedArguments[const Symbol('builder')];
    if (builder == null) {
      throw "builder required in MaterialPageRoute";
    }
    return MaterialPageRoute(builder: (ctx) {
      return (builder as LoxFunction).call(interpreter, [ctx], {}) as Widget;
    });
  }
}

class TimerPeriodicBuilder implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.length < 2) {
      throw "arguments required in Timer";
    }
    return Timer.periodic(arguments.first as Duration, (timer) {
      (arguments[1] as LoxFunction).call(interpreter, [TimerIns(timer)], {});
    });
  }
}

class ITimer implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'periodic':
        return TimerPeriodicBuilder();
    }
  }

  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.length < 2) {
      throw "arguments required in Timer";
    }
    return TimerIns(Timer(arguments.first as Duration, () {
      (arguments[1] as LoxFunction).call(interpreter, [], {});
    }));
  }
}

class TimerIns implements Timer, LoxGetCallable {
  final Timer _timer;
  TimerIns(this._timer);

  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'cancel':
        return _timer.cancel;
      case 'isActive':
        return _timer.isActive;
      case 'tick':
        return _timer.tick;
    }
  }

  @override
  void cancel() {
    _timer.cancel();
  }

  @override
  bool get isActive => _timer.isActive;

  @override
  int get tick => _timer.tick;
}

class IDuration implements DaxCallable {
  @override
  Object call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    int days = 0;
    var daysParsed = namedArguments[const Symbol('days')];
    if (daysParsed != null) {
      days = daysParsed as int;
    }
    int hours = 0;
    var hoursParsed = namedArguments[const Symbol('hours')];
    if (hoursParsed != null) {
      hours = hoursParsed as int;
    }
    int minutes = 0;
    var minutesParsed = namedArguments[const Symbol('minutes')];
    if (minutesParsed != null) {
      minutes = minutesParsed as int;
    }
    int seconds = 0;
    var secondsParsed = namedArguments[const Symbol('seconds')];
    if (secondsParsed != null) {
      seconds = secondsParsed as int;
    }
    int milliseconds = 0;
    var millisecondsParsed = namedArguments[const Symbol('milliseconds')];
    if (millisecondsParsed != null) {
      milliseconds = millisecondsParsed as int;
    }
    int microseconds = 0;
    var microsecondsParsed = namedArguments[const Symbol('microseconds')];
    if (microsecondsParsed != null) {
      microseconds = microsecondsParsed as int;
    }
    return Duration(
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
        milliseconds: milliseconds,
        microseconds: microseconds);
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

class IClipboardData implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var text = namedArguments[const Symbol('text')];
    if (text == null) {
      throw "text required in ClipboardData";
    }
    return ClipboardData(text: text as String);
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

class RegExpIns implements RegExp, LoxGetCallable {
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

  @override
  Iterable<RegExpMatch> allMatches(String input, [int start = 0]) {
    return _regExp.allMatches(input, start);
  }

  @override
  RegExpMatch? firstMatch(String input) {
    return _regExp.firstMatch(input);
  }

  @override
  bool hasMatch(String input) {
    return _regExp.hasMatch(input);
  }

  @override
  bool get isCaseSensitive => _regExp.isCaseSensitive;

  @override
  bool get isDotAll => _regExp.isDotAll;

  @override
  bool get isMultiLine => _regExp.isMultiLine;

  @override
  bool get isUnicode => _regExp.isUnicode;

  @override
  Match? matchAsPrefix(String string, [int start = 0]) {
    return _regExp.matchAsPrefix(string, start);
  }

  @override
  String get pattern => _regExp.pattern;

  @override
  String? stringMatch(String input) {
    return _regExp.stringMatch(input);
  }
}
