import 'package:dax/dax.dart';
import 'package:flutter/material.dart';
import 'package:usecases/utils.dart';

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
    List<Widget> children = (childrenParsed as List).cast<Widget>();
    return Row(
        children: children,
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
    List<Widget> children = (childrenParsed as List).cast<Widget>();
    return Column(
      children: children,
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
    return Wrap(
      children: children,
      spacing: spacing,
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
    return Stack(
      children: children,
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