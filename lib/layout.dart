import 'package:dax/dax.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class IExpanded implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in Expanded";
    }
    int flex = 1;
    var flexParsed = namedArguments[const Symbol('flex')];
    if (flexParsed != null) {
      flex = flexParsed as int;
    }
    return Expanded(
      flex: flex,
      child: child as Widget,
    );
  }
}

class IRow implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
    var mainAxisAlignmentParsed =
        namedArguments[const Symbol('mainAxisAlignment')];
    if (mainAxisAlignmentParsed != null) {
      mainAxisAlignment = mainAxisAlignmentParsed as MainAxisAlignment;
    }
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
    var crossAxisAlignmentParsed =
        namedArguments[const Symbol('crossAxisAlignment')];
    if (crossAxisAlignmentParsed != null) {
      crossAxisAlignment = crossAxisAlignmentParsed as CrossAxisAlignment;
    }
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed == null) {
      throw "children required in Row";
    }
    MainAxisSize mainAxisSize = MainAxisSize.max;
    var mainAxisSizeParsed = namedArguments[const Symbol('mainAxisSize')];
    if (mainAxisSizeParsed != null) {
      mainAxisSize = mainAxisSizeParsed as MainAxisSize;
    }
    TextDirection? textDirection;
    var textDirectionParsed = namedArguments[const Symbol('textDirection')];
    if (textDirectionParsed != null) {
      textDirection = textDirectionParsed as TextDirection;
    }
    VerticalDirection verticalDirection = VerticalDirection.down;
    var verticalDirectionParsed =
        namedArguments[const Symbol('verticalDirection')];
    if (verticalDirectionParsed != null) {
      verticalDirection = verticalDirectionParsed as VerticalDirection;
    }
    TextBaseline? textBaseline;
    var textBaselineParsed = namedArguments[const Symbol('textBaseline')];
    if (textBaselineParsed != null) {
      textBaseline = textBaselineParsed as TextBaseline;
    }
    List<Widget> children = (childrenParsed as List).cast<Widget>();
    return Row(
        children: children,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        textBaseline: textBaseline,
        verticalDirection: verticalDirection,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment);
  }
}

class IColumn implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
    var mainAxisAlignmentParsed =
        namedArguments[const Symbol('mainAxisAlignment')];
    if (mainAxisAlignmentParsed != null) {
      mainAxisAlignment = mainAxisAlignmentParsed as MainAxisAlignment;
    }
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
    var crossAxisAlignmentParsed =
        namedArguments[const Symbol('crossAxisAlignment')];
    if (crossAxisAlignmentParsed != null) {
      crossAxisAlignment = crossAxisAlignmentParsed as CrossAxisAlignment;
    }
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed == null) {
      throw "children required in Column";
    }
    MainAxisSize mainAxisSize = MainAxisSize.max;
    var mainAxisSizeParsed = namedArguments[const Symbol('mainAxisSize')];
    if (mainAxisSizeParsed != null) {
      mainAxisSize = mainAxisSizeParsed as MainAxisSize;
    }
    TextDirection? textDirection;
    var textDirectionParsed = namedArguments[const Symbol('textDirection')];
    if (textDirectionParsed != null) {
      textDirection = textDirectionParsed as TextDirection;
    }
    VerticalDirection verticalDirection = VerticalDirection.down;
    var verticalDirectionParsed =
        namedArguments[const Symbol('verticalDirection')];
    if (verticalDirectionParsed != null) {
      verticalDirection = verticalDirectionParsed as VerticalDirection;
    }
    TextBaseline? textBaseline;
    var textBaselineParsed = namedArguments[const Symbol('textBaseline')];
    if (textBaselineParsed != null) {
      textBaseline = textBaselineParsed as TextBaseline;
    }
    List<Widget> children = (childrenParsed as List).cast<Widget>();
    return Column(
      children: children,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      textBaseline: textBaseline,
      verticalDirection: verticalDirection,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
    );
  }
}

class ICenter implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in Center";
    }
    double? heightFactor =
        parseDouble(namedArguments[const Symbol('heightFactor')]);
    double? widthFactor =
        parseDouble(namedArguments[const Symbol('widthFactor')]);
    return Center(
      child: child as Widget,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
    );
  }
}

class IWrap implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    List<Widget> children = [];
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed != null) {
      children = (childrenParsed as List).cast<Widget>();
    }
    double spacing = parseDouble(namedArguments[const Symbol('spacing')]) ?? 0;
    double runSpacing =
        parseDouble(namedArguments[const Symbol('runSpacing')]) ?? 0;
    WrapAlignment alignment = WrapAlignment.start;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as WrapAlignment;
    }
    WrapAlignment runAlignment = WrapAlignment.start;
    var runAlignmentParsed = namedArguments[const Symbol('runAlignment')];
    if (runAlignmentParsed != null) {
      runAlignment = runAlignmentParsed as WrapAlignment;
    }
    Axis direction = Axis.horizontal;
    var directionParsed = namedArguments[const Symbol('direction')];
    if (directionParsed != null) {
      direction = directionParsed as Axis;
    }
    TextDirection? textDirection;
    var textDirectionParsed = namedArguments[const Symbol('textDirection')];
    if (textDirectionParsed != null) {
      textDirection = textDirectionParsed as TextDirection;
    }
    VerticalDirection verticalDirection = VerticalDirection.down;
    var verticalDirectionParsed =
        namedArguments[const Symbol('verticalDirection')];
    if (verticalDirectionParsed != null) {
      verticalDirection = verticalDirectionParsed as VerticalDirection;
    }
    WrapCrossAlignment crossAlignment = WrapCrossAlignment.start;
    var crossAlignmentParsed = namedArguments[const Symbol('crossAlignment')];
    if (crossAlignmentParsed != null) {
      crossAlignment = crossAlignmentParsed as WrapCrossAlignment;
    }
    return Wrap(
      direction: direction,
      children: children,
      spacing: spacing,
      textDirection: textDirection,
      crossAxisAlignment: crossAlignment,
      verticalDirection: verticalDirection,
      runSpacing: runSpacing,
      alignment: alignment,
      runAlignment: runAlignment,
    );
  }
}

class IAlign implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Alignment alignment = Alignment.center;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as Alignment;
    }
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    double? heightFactor =
        parseDouble(namedArguments[const Symbol('heightFactor')]);
    double? widthFactor =
        parseDouble(namedArguments[const Symbol('widthFactor')]);
    return Align(
      child: child,
      alignment: alignment,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
    );
  }
}

class IStack implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    List<Widget> children = [];
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed != null) {
      children = (childrenParsed as List).cast<Widget>();
    }
    TextDirection? textDirection;
    var textDirectionParsed = namedArguments[const Symbol('textDirection')];
    if (textDirectionParsed != null) {
      textDirection = textDirectionParsed as TextDirection;
    }
    StackFit fit = StackFit.loose;
    var fitParsed = namedArguments[const Symbol('fit')];
    if (fitParsed != null) {
      fit = fitParsed as StackFit;
    }
    AlignmentGeometry alignment = AlignmentDirectional.topStart;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    Clip clipBehavior = Clip.hardEdge;
    var clipBehaviorParsed = namedArguments[const Symbol('clipBehavior')];
    if (clipBehaviorParsed != null) {
      clipBehavior = clipBehaviorParsed as Clip;
    }
    return Stack(
      children: children,
      alignment: alignment,
      clipBehavior: clipBehavior,
      textDirection: textDirection,
      fit: fit,
    );
  }
}

class IPositioned implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? left = parseDouble(namedArguments[const Symbol('left')]);
    double? top = parseDouble(namedArguments[const Symbol('top')]);
    double? right = parseDouble(namedArguments[const Symbol('right')]);
    double? bottom = parseDouble(namedArguments[const Symbol('bottom')]);
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child is required";
    }
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: child as Widget,
    );
  }
}

class IConstrainedBox implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParse = namedArguments[const Symbol('child')];
    if (childParse != null) {
      child = childParse as Widget;
    }
    var constraints = namedArguments[const Symbol('constraints')];
    if (constraints == null) {
      throw "constraints is required";
    }
    return ConstrainedBox(
      child: child,
      constraints: constraints as BoxConstraints,
    );
  }
}
