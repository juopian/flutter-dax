import 'package:dax/dax.dart';
import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorPosition implements LoxGetCallable {
  final Position position;

  GeolocatorPosition(this.position);
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'latitude':
        return position.latitude;
      case 'longitude':
        return position.longitude;
      case 'accuracy':
        return position.accuracy;
    }
  }
}

class GeolocatorGetCurrrentPosition implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return Geolocator.getCurrentPosition().then((Position position) {
      return GeolocatorPosition(position);
    });
  }
}

class IGeolocator implements LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'getCurrentPosition':
        return GeolocatorGetCurrrentPosition();
      case 'checkPermission':
        return Geolocator.checkPermission;
      case 'requestPermission':
        return Geolocator.requestPermission;
      case 'isLocationServiceEnabled':
        return Geolocator.isLocationServiceEnabled;
      case 'getLastKnownPosition':
        return Geolocator.getLastKnownPosition;
      case 'openAppSettings':
        return Geolocator.openAppSettings;
      case 'openLocationSettings':
        return Geolocator.openLocationSettings;
    }
    return null;
  }
}

class ILaunchUrl implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "Argument must be at least 1.";
    }
    Uri url = Uri.parse(arguments.first as String);
    LaunchMode mode = LaunchMode.platformDefault;
    var modeParsed = namedArguments[const Symbol('mode')];
    if (modeParsed != null) {
      mode = modeParsed as LaunchMode;
    }
    return launchUrl(url, mode: mode);
  }
}

class IWebViewController implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return WebViewControllerIns();
  }
}

class WebViewControllerIns implements LoxGetCallable, LoxSetCallable {
  late WebViewController _controller;
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'loadUrl':
        return _controller.loadUrl;
      case 'loadHtmlString':
        return _controller.loadHtmlString;
      case 'runJavascript':
        return _controller.runJavascript;
      case 'goBack':
        return _controller.goBack;
      case 'canGoBack':
        return _controller.canGoBack;
      case 'goForward':
        return _controller.goForward;
      case 'canGoForward':
        return _controller.canGoForward;
      case 'reload':
        return _controller.reload;
      case 'clearCache':
        return _controller.clearCache;
      case 'getTitle':
        return _controller.getTitle;
      case 'runJavascriptReturningResult':
        return _controller.runJavascriptReturningResult;
    }
    throw "Unknown property: ${name.lexeme}";
  }

  @override
  void set(Token name, Object? value) {
    switch (name.lexeme) {
      case 'controller':
        _controller = value as WebViewController;
    }
  }
}

class IJavascriptChannel implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var name = namedArguments[const Symbol('name')];
    if (name == null) {
      throw "parameter name is required";
    }
    var onMessageReceived = namedArguments[const Symbol('onMessageReceived')];
    if (onMessageReceived == null) {
      throw "parameter onMessageReceived is required";
    }
    return JavascriptChannel(
        name: name as String,
        onMessageReceived: (JavascriptMessage message) {
          var msgIns = JavascriptMessageIns(message.message);
          (onMessageReceived as LoxFunction).call(interpreter, [msgIns], {});
        });
  }
}

class JavascriptMessageIns extends JavascriptMessage implements LoxGetCallable {
  final String msg;

  JavascriptMessageIns(this.msg) : super(msg);
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'message':
        return msg;
    }
  }
}

class IWebView implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    String? initialUrl;
    var initialUrlParsed = namedArguments[const Symbol('initialUrl')];
    if (initialUrlParsed != null) {
      initialUrl = initialUrlParsed as String;
    }
    JavascriptMode javascriptMode = JavascriptMode.disabled;
    var javascriptModeParsed = namedArguments[const Symbol('javascriptMode')];
    if (javascriptModeParsed != null) {
      javascriptMode = javascriptModeParsed as JavascriptMode;
    }
    Function(String)? onPageStarted;
    var onPageStartedParsed = namedArguments[const Symbol('onPageStarted')];
    if (onPageStartedParsed != null) {
      onPageStarted = (s) {
        (onPageStartedParsed as LoxFunction).call(interpreter, [s], {});
      };
    }
    Function(String)? onPageFinished;
    var onPageFinishedParsed = namedArguments[const Symbol('onPageFinished')];
    if (onPageFinishedParsed != null) {
      onPageFinished = (s) {
        (onPageFinishedParsed as LoxFunction).call(interpreter, [s], {});
      };
    }
    bool debuggingEnabled = false;
    var debuggingEnabledParsed =
        namedArguments[const Symbol('debuggingEnabled')];
    if (debuggingEnabledParsed != null) {
      debuggingEnabled = debuggingEnabledParsed as bool;
    }
    String? userAgent;
    var userAgentParsed = namedArguments[const Symbol('userAgent')];
    if (userAgentParsed != null) {
      userAgent = userAgentParsed as String;
    }
    bool zoomEnabled = true;
    var zoomEnabledParsed = namedArguments[const Symbol('zoomEnabled')];
    if (zoomEnabledParsed != null) {
      zoomEnabled = zoomEnabledParsed as bool;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    Function(WebViewController)? onWebViewCreated;
    var onWebViewCreatedParsed =
        namedArguments[const Symbol('onWebViewCreated')];
    if (onWebViewCreatedParsed != null) {
      onWebViewCreated = (s) {
        (onWebViewCreatedParsed as LoxFunction).call(interpreter, [s], {});
      };
    }
    Function(WebResourceError)? onWebResourceError;
    var onWebResourceErrorParsed =
        namedArguments[const Symbol('onWebResourceError')];
    if (onWebResourceErrorParsed != null) {
      onWebResourceError = (s) {
        (onWebResourceErrorParsed as LoxFunction).call(interpreter, [s], {});
      };
    }
    Set<JavascriptChannel>? javascriptChannels;
    var javascriptChannelsParsed =
        namedArguments[const Symbol('javascriptChannels')];
    if (javascriptChannelsParsed != null) {
      javascriptChannels =
          (javascriptChannelsParsed as List).cast<JavascriptChannel>().toSet();
    }
    if (kIsWeb) return const Text("Webview only support on iOS and android");
    return WebView(
      initialUrl: initialUrl,
      javascriptMode: javascriptMode,
      javascriptChannels: javascriptChannels,
      onPageStarted: onPageStarted,
      onPageFinished: onPageFinished,
      debuggingEnabled: debuggingEnabled,
      userAgent: userAgent,
      backgroundColor: backgroundColor,
      zoomEnabled: zoomEnabled,
      onWebViewCreated: onWebViewCreated,
      onWebResourceError: onWebResourceError,
    );
  }
}
