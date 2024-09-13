import 'package:dax/dax.dart';
import 'package:dax_flutter/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';


class IColors implements LoxGetCallable {
  @override
  Object? get(Token name) {
    return _colorMap[name.lexeme];
  }
}

final _colorMap = {
  'transparent': Colors.transparent,
  'red': Colors.red,
  'redAccent': Colors.redAccent,
  'pink': Colors.pink,
  'pinkAccent': Colors.pinkAccent,
  'deepOrange': Colors.deepOrange,
  'deepOrangeAccent': Colors.deepOrangeAccent,
  'orange': Colors.orange,
  'orangeAccent': Colors.orangeAccent,
  'amber': Colors.amber,
  'amberAccent': Colors.amberAccent,
  'yellow': Colors.yellow,
  'yellowAccent': Colors.yellowAccent,
  'lime': Colors.lime,
  'limeAccent': Colors.limeAccent,
  'lightGreen': Colors.lightGreen,
  'lightGreenAccent': Colors.lightGreenAccent,
  'green': Colors.green,
  'greenAccent': Colors.greenAccent,
  'teal': Colors.teal,
  'tealAccent': Colors.tealAccent,
  'cyan': Colors.cyan,
  'cyanAccent': Colors.cyanAccent,
  'lightBlue': Colors.lightBlue,
  'lightBlueAccent': Colors.lightBlueAccent,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'purple': Colors.purple,
  'purpleAccent': Colors.purpleAccent,
  'deepPurple': Colors.deepPurple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'blueGrey': Colors.blueGrey,
  'brown': Colors.brown,
  'grey': Colors.grey,
  'black': Colors.black,
  'black12': Colors.black12,
  'black26': Colors.black26,
  'black38': Colors.black38,
  'black45': Colors.black45,
  'black54': Colors.black54,
  'black87': Colors.black87,
  'white': Colors.white,
  'white10': Colors.white10,
  'white12': Colors.white12,
  'white24': Colors.white24,
  'white30': Colors.white30,
  'white38': Colors.white38,
  'white54': Colors.white54,
  'white60': Colors.white60,
  'white70': Colors.white70,
};

class IFontWeight implements LoxGetCallable {
  @override
  Object? get(Token name) {
    return _fontWeightMap[name.lexeme];
  }
}

final _fontWeightMap = {
  "bold": FontWeight.bold,
  "normal": FontWeight.normal,
  "w100": FontWeight.w100,
  "w200": FontWeight.w200,
  "w300": FontWeight.w300,
  "w400": FontWeight.w400,
  "w500": FontWeight.w500,
  "w600": FontWeight.w600,
  "w700": FontWeight.w700,
  "w800": FontWeight.w800,
  "w900": FontWeight.w900,
};

final mainAxisAlignmentMap = {
  "start": MainAxisAlignment.start,
  "center": MainAxisAlignment.center,
  "end": MainAxisAlignment.end,
  "spaceAround": MainAxisAlignment.spaceAround,
  "spaceBetween": MainAxisAlignment.spaceBetween,
  "spaceEvenly": MainAxisAlignment.spaceEvenly
};

final crossAxisAlignmentMap = {
  "start": CrossAxisAlignment.start,
  "end": CrossAxisAlignment.end,
  "center": CrossAxisAlignment.center,
  "baseline": CrossAxisAlignment.baseline,
  "stretch": CrossAxisAlignment.stretch,
};

final textAlignMap = {
  "start": TextAlign.start,
  "center": TextAlign.center,
  "end": TextAlign.end,
  "left": TextAlign.left,
  "right": TextAlign.right,
  "jusitfy": TextAlign.justify,
};

final boxFitMap = {
  "contain": BoxFit.contain,
  "cover": BoxFit.cover,
  "fill": BoxFit.fill,
  "fitHeight": BoxFit.fitHeight,
  "fitWidth": BoxFit.fitWidth,
  "scaleDown": BoxFit.scaleDown,
  "none": BoxFit.none,
};

class ITextInputType implements LoxGetCallable {
  @override
  Object? get(Token name) {
    return textInputTypeMap[name.lexeme];
  }
}

final textInputTypeMap = {
  "emailAddress": TextInputType.emailAddress,
  "datetime": TextInputType.datetime,
  "multiline": TextInputType.multiline,
  "name": TextInputType.name,
  "number": TextInputType.number,
  "phone": TextInputType.phone,
  "text": TextInputType.text,
  "url": TextInputType.url,
  "values": TextInputType.values,
  "visiblePassword": TextInputType.visiblePassword,
  "streetAddress": TextInputType.streetAddress,
  "none": TextInputType.none,
};

final borderStyleMap = {
  "solid": BorderStyle.solid,
  "none": BorderStyle.none,
};

final axisDirectionMap = {
  "up": AxisDirection.up,
  "down": AxisDirection.down,
  "right": AxisDirection.right,
  "left": AxisDirection.left,
};

final wrapAlignmentMap = {
  "start": WrapAlignment.start,
  "end": WrapAlignment.end,
  "center": WrapAlignment.center,
  "spaceBetween": WrapAlignment.spaceBetween,
  "spaceAround": WrapAlignment.spaceAround,
  "spaceEvenly": WrapAlignment.spaceEvenly,
};

final textDirectionMap = {
  "ltr": TextDirection.ltr,
  "rtl": TextDirection.rtl,
};

final stackFitMap = {
  "loose": StackFit.loose,
  "expand": StackFit.expand,
  "passthrough": StackFit.passthrough,
};

final tabBarIndicatorSizeMap = {
  "tab": TabBarIndicatorSize.tab,
  "label": TabBarIndicatorSize.label,
};

final snackBarBehaviorMap = {
  "fixed": SnackBarBehavior.fixed,
  "floating": SnackBarBehavior.floating,
};

final listTileControlAffinityMap = {
  "leading": ListTileControlAffinity.leading,
  "trailing": ListTileControlAffinity.trailing,
  "platform": ListTileControlAffinity.platform,
};

final axisMap = {
  "vertical": Axis.vertical,
  "horizontal": Axis.horizontal,
};

final textOverflowMap = {
  "ellipsis": TextOverflow.ellipsis,
  "clip": TextOverflow.clip,
  "fade": TextOverflow.fade,
  "visible": TextOverflow.visible
};

final blendModeMap = {
  "clear": BlendMode.clear,
  "color": BlendMode.color,
  "colorBurn": BlendMode.colorBurn,
  "colorDodge": BlendMode.colorDodge,
  "darken": BlendMode.darken,
  "difference": BlendMode.difference,
  "dst": BlendMode.dst,
  "dstATop": BlendMode.dstATop,
  "dstIn": BlendMode.dstIn,
  "dstOut": BlendMode.dstOut,
  "dstOver": BlendMode.dstOver,
  "exclusion": BlendMode.exclusion,
  "hardLight": BlendMode.hardLight,
  "lighten": BlendMode.lighten,
  "multiply": BlendMode.multiply,
  "overlay": BlendMode.overlay,
  "screen": BlendMode.screen,
  "softLight": BlendMode.softLight
};

final imageRepeatMap = {
  "noRepeat": ImageRepeat.noRepeat,
  "repeat": ImageRepeat.repeat,
  "repeatX": ImageRepeat.repeatX,
  "repeatY": ImageRepeat.repeatY
};

final filterQualityMap = {
  "low": FilterQuality.low,
  "medium": FilterQuality.medium,
  "high": FilterQuality.high
};

class ITextAlignVertical implements LoxGetCallable, DaxCallable {
  @override
  Object? get(Token name) {
    return _textAlignVerticalMap[name.lexeme];
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double y = parseDouble(namedArguments[const Symbol('y')]) ?? 0;
    return TextAlignVertical(y: y);
  }
}

final _textAlignVerticalMap = {
  "bottom": TextAlignVertical.bottom,
  "top": TextAlignVertical.top,
  "center": TextAlignVertical.center
};

final textInputActionMap = {
  "none": TextInputAction.none,
  "unspecified": TextInputAction.unspecified,
  "done": TextInputAction.done,
  "go": TextInputAction.go,
  "next": TextInputAction.next,
  "previous": TextInputAction.previous,
  "search": TextInputAction.search,
  "send": TextInputAction.send
};

final textCapitalizationMap = {
  "none": TextCapitalization.none,
  "words": TextCapitalization.words,
  "sentences": TextCapitalization.sentences,
  "characters": TextCapitalization.characters
};

final verticalDirectionMap = {
  "down": VerticalDirection.down,
  "up": VerticalDirection.up
};

final dismissDirectionMap = {
  "vertical": DismissDirection.vertical,
  "horizontal": DismissDirection.horizontal,
  "up": DismissDirection.up,
  "down": DismissDirection.down,
  "none": DismissDirection.none
};

final dragStartBehaviorMap = {
  "down": DragStartBehavior.down,
  "start": DragStartBehavior.start,
};

final mainAxisSizeMap = {"min": MainAxisSize.min, "max": MainAxisSize.max};

final textBaselineMap = {
  "alphabetic": TextBaseline.alphabetic,
  "ideographic": TextBaseline.ideographic
};

final wrapCrossAlignmentMap = {
  "start": WrapCrossAlignment.start,
  "end": WrapCrossAlignment.end,
  "center": WrapCrossAlignment.center,
};

final clipBehaviorMap = {
  "none": Clip.none,
  "antiAlias": Clip.antiAlias,
  "antiAliasWithSaveLayer": Clip.antiAliasWithSaveLayer,
  "hardEdge": Clip.hardEdge,
};

class IFloatingActionButtonLocation implements LoxGetCallable {
  @override
  Object? get(Token name) {
    return _floatingActionButtonLocationMap[name.lexeme];
  }
}

final _floatingActionButtonLocationMap = {
  "startTop": FloatingActionButtonLocation.startTop,
  "endTop": FloatingActionButtonLocation.endTop,
  "startFloat": FloatingActionButtonLocation.startFloat,
  "endFloat": FloatingActionButtonLocation.endFloat,
  "centerFloat": FloatingActionButtonLocation.centerFloat,
  "centerDocked": FloatingActionButtonLocation.centerDocked,
  "centerTop": FloatingActionButtonLocation.centerTop,
  "miniCenterDocked": FloatingActionButtonLocation.miniCenterDocked,
  "miniCenterTop": FloatingActionButtonLocation.miniCenterTop,
  "miniStartTop": FloatingActionButtonLocation.miniStartTop,
  "miniEndTop": FloatingActionButtonLocation.miniEndTop,
  "miniStartFloat": FloatingActionButtonLocation.miniStartFloat,
  "miniEndFloat": FloatingActionButtonLocation.miniEndFloat,
};

final boxShapeMap = {
  "circle": BoxShape.circle,
  "rectangle": BoxShape.rectangle,
};

final tileModeMap = {
  "decal": TileMode.decal,
  "clamp": TileMode.clamp,
  "repeated": TileMode.repeated,
  "mirror": TileMode.mirror,
};

final fontStyleMap = {
  "normal": FontStyle.normal,
  "italic": FontStyle.italic,
};

final textDecorationStyleMap = {
  "solid": TextDecorationStyle.solid,
  "double": TextDecorationStyle.double,
  "dotted": TextDecorationStyle.dotted,
  "dashed": TextDecorationStyle.dashed,
  "wavy": TextDecorationStyle.wavy,
};

final javascriptModeMap = {
  "disabled": JavascriptMode.disabled,
  "unrestricted": JavascriptMode.unrestricted
};

final launchModeMap = {
  "inAppWebView": LaunchMode.inAppWebView,
  "platformDefault": LaunchMode.platformDefault,
  "externalApplication": LaunchMode.externalApplication,
  "externalNonBrowserApplication": LaunchMode.externalNonBrowserApplication,
};

final locationPermissionMap = {
  "deniedForever": LocationPermission.deniedForever,
  "always": LocationPermission.always,
  "denied": LocationPermission.denied,
  "whenInUse": LocationPermission.whileInUse,
  "unableToDetermine": LocationPermission.unableToDetermine
};

final imageSourceMap = {
  "camera": ImageSource.camera,
  "gallery": ImageSource.gallery,
};