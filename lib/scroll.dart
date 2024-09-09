import 'package:dax/dax.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class IListView implements LoxFlutterFunction, LoxGetCallable {
  final builder = ListViewBuilder();
  final separated = ListViewSeparated();
  @override
  Object? get(Token name) {
    if (name.lexeme == "builder") {
      return builder;
    } else if (name.lexeme == "separated") {
      return separated;
    }
    throw "Unknown property: ${name.lexeme}";
  }

  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    List<Widget> children = [];
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed != null) {
      children = (childrenParsed as List).cast<Widget>();
    }
    Axis scrollDirection = Axis.vertical;
    var scrollDirectionParsed = namedArguments[const Symbol('scrollDirection')];
    if (scrollDirectionParsed != null) {
      scrollDirection = scrollDirectionParsed as Axis;
    }
    bool reverse = false;
    var reverseParsed = namedArguments[const Symbol('reverse')];
    if (reverseParsed != null) {
      reverse = reverseParsed as bool;
    }
    bool? primary;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as bool;
    }
    bool shrinkWrap = false;
    var shrinkWrapParsed = namedArguments[const Symbol('shrinkWrap')];
    if (shrinkWrapParsed != null) {
      shrinkWrap = shrinkWrapParsed as bool;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    double? itemExtent =
        parseDouble(namedArguments[const Symbol('itemExtent')]);
    double? cacheExtent =
        parseDouble(namedArguments[const Symbol('cacheExtent')]);
    Widget? prototypeItem;
    var prototypeItemParsed = namedArguments[const Symbol('prototypeItem')];
    if (prototypeItemParsed != null) {
      prototypeItem = prototypeItemParsed as Widget;
    }
    return ListView(
        primary: primary,
        reverse: reverse,
        padding: padding,
        itemExtent: itemExtent,
        cacheExtent: cacheExtent,
        shrinkWrap: shrinkWrap,
        prototypeItem: prototypeItem,
        scrollDirection: scrollDirection,
        children: children);
  }
}

class ListViewBuilder implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? itemExtent =
        parseDouble(namedArguments[const Symbol('itemExtent')]);
    bool reverse = false;
    var reverseParsed = namedArguments[const Symbol('reverse')];
    if (reverseParsed != null) {
      reverse = reverseParsed as bool;
    }
    int? itemCount;
    var itemCountParsed = namedArguments[const Symbol('itemCount')];
    if (itemCountParsed != null) {
      itemCount = itemCountParsed as int;
    }
    Widget? prototypeItem;
    var prototypeItemParsed = namedArguments[const Symbol('prototypeItem')];
    if (prototypeItemParsed != null) {
      prototypeItem = prototypeItemParsed as Widget;
    }
    bool shrinkWrap = false;
    var shrinkWrapParsed = namedArguments[const Symbol('shrinkWrap')];
    if (shrinkWrapParsed != null) {
      shrinkWrap = shrinkWrapParsed as bool;
    }
    bool? primary;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as bool;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    var itemBuilder = namedArguments[const Symbol('itemBuilder')];
    if (itemBuilder == null) {
      throw "itemBuilder required in ListView.builder";
    }
    Axis scrollDirection = Axis.vertical;
    var scrollDirectionParsed = namedArguments[const Symbol('scrollDirection')];
    if (scrollDirectionParsed != null) {
      scrollDirection = scrollDirectionParsed as Axis;
    }
    double? cacheExtent = parseDouble(namedArguments[const Symbol('cacheExtent')]);
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemExtent: itemExtent,
      prototypeItem: prototypeItem,
      reverse: reverse,
      primary: primary,
      cacheExtent: cacheExtent,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      padding: padding,
      itemBuilder: (BuildContext context, int index) {
        return (itemBuilder as LoxCallable)
            .call(interpreter, [context, index], {}) as Widget;
      },
    );
  }
}

class ListViewSeparated implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    bool reverse = false;
    var reverseParsed = namedArguments[const Symbol('reverse')];
    if (reverseParsed != null) {
      reverse = reverseParsed as bool;
    }
    var itemCount = namedArguments[const Symbol('itemCount')];
    if (itemCount == null) {
      throw "itemCount required in ListView.separated";
    }
    bool shrinkWrap = false;
    var shrinkWrapParsed = namedArguments[const Symbol('shrinkWrap')];
    if (shrinkWrapParsed != null) {
      shrinkWrap = shrinkWrapParsed as bool;
    }
    bool? primary;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as bool;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    var itemBuilder = namedArguments[const Symbol('itemBuilder')];
    if (itemBuilder == null) {
      throw "itemBuilder required in ListView.builder";
    }
    var separatorBuilder = namedArguments[const Symbol('separatorBuilder')];
    if (separatorBuilder == null) {
      throw "separatorBuilder required in ListView.separated";
    }
    Axis scrollDirection = Axis.vertical;
    var scrollDirectionParsed = namedArguments[const Symbol('scrollDirection')];
    if (scrollDirectionParsed != null) {
      scrollDirection = scrollDirectionParsed as Axis;
    }
    double? cacheExtent = parseDouble(namedArguments[const Symbol('cacheExtent')]);
    return ListView.separated(
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        padding: padding,
        shrinkWrap: shrinkWrap,
        itemCount: itemCount as int,
        cacheExtent: cacheExtent,
        itemBuilder: (BuildContext context, int index) {
          return (itemBuilder as LoxCallable)
              .call(interpreter, [context, index], {}) as Widget;
        },
        separatorBuilder: (BuildContext context, int index) {
          return (separatorBuilder as LoxCallable)
              .call(interpreter, [context, index], {}) as Widget;
        });
  }
}

class ISingleChildScrollView implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    bool reverse = false;
    var reverseParsed = namedArguments[const Symbol('reverse')];
    if (reverseParsed != null) {
      reverse = reverseParsed as bool;
    }
    bool primary = true;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as bool;
    }
    Axis scrollDirection = Axis.vertical;
    var scrollDirectionParsed = namedArguments[const Symbol('scrollDirection')];
    if (scrollDirectionParsed != null) {
      scrollDirection = scrollDirectionParsed as Axis;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      child: child,
    );
  }
}

class ITabBar implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    List<Widget> tabs = [];
    var tabsParsed = namedArguments[const Symbol('tabs')];
    if (tabsParsed != null) {
      tabs = (tabsParsed as List).cast<Widget>();
    }
    bool isScrollable = false;
    var isScrollableParsed = namedArguments[const Symbol('isScrollable')];
    if (isScrollableParsed != null) {
      isScrollable = isScrollableParsed as bool;
    }
    EdgeInsetsGeometry? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    Color? labelColor;
    var labelColorParsed = namedArguments[const Symbol('labelColor')];
    if (labelColorParsed != null) {
      labelColor = labelColorParsed as Color;
    }
    Color? unselectedLabelColor;
    var unselectedLabelColorParsed =
        namedArguments[const Symbol('unselectedLabelColor')];
    if (unselectedLabelColorParsed != null) {
      unselectedLabelColor = unselectedLabelColorParsed as Color;
    }
    TextStyle? labelStyle;
    var labelStyleParsed = namedArguments[const Symbol('labelStyle')];
    if (labelStyleParsed != null) {
      labelStyle = labelStyleParsed as TextStyle;
    }
    TextStyle? unselectedLabelStyle;
    var unselectedLabelStyleParsed =
        namedArguments[const Symbol('unselectedLabelStyle')];
    if (unselectedLabelStyleParsed != null) {
      unselectedLabelStyle = unselectedLabelStyleParsed as TextStyle;
    }
    EdgeInsetsGeometry? labelPadding;
    var labelPaddingParsed = namedArguments[const Symbol('padding')];
    if (labelPaddingParsed != null) {
      labelPadding = labelPaddingParsed as EdgeInsetsGeometry;
    }
    Color? indicatorColor;
    var indicatorColorParsed = namedArguments[const Symbol('indicatorColor')];
    if (indicatorColorParsed != null) {
      indicatorColor = indicatorColorParsed as Color;
    }
    double indicatorWeight =
        parseDouble(namedArguments[const Symbol('indicatorWeight')]) ?? 2.0;
    TabBarIndicatorSize? indicatorSize;
    var indicatorSizeParsed = namedArguments[const Symbol('indicatorSize')];
    if (indicatorSizeParsed != null) {
      indicatorSize = indicatorSizeParsed as TabBarIndicatorSize;
    }
    EdgeInsetsGeometry indicatorPadding = EdgeInsets.zero;
    var indicatorPaddingParsed =
        namedArguments[const Symbol('indicatorPadding')];
    if (indicatorPaddingParsed != null) {
      indicatorPadding = indicatorPaddingParsed as EdgeInsetsGeometry;
    }
    Function(int)? onTap;
    var onTapParsed = namedArguments[const Symbol('onTap')];
    if (onTapParsed != null) {
      onTap = (int i) {
        (onTapParsed as LoxFunction).call(interpreter, [i], {});
      };
    }
    bool automaticIndicatorColorAdjustment = true;
    var automaticIndicatorColorAdjustmentParsed =
        namedArguments[const Symbol('automaticIndicatorColorAdjustment')];
    if (automaticIndicatorColorAdjustmentParsed != null) {
      automaticIndicatorColorAdjustment =
          automaticIndicatorColorAdjustmentParsed as bool;
    }
    Decoration? indicator;
    var indicatorParsed = namedArguments[const Symbol('indicator')];
    if (indicatorParsed != null) {
      indicator = indicatorParsed as Decoration;
    }
    return TabBar(
      tabs: tabs,
      onTap: onTap,
      padding: padding,
      indicator: indicator,
      labelPadding: labelPadding,
      labelColor: labelColor,
      labelStyle: labelStyle,
      unselectedLabelColor: unselectedLabelColor,
      unselectedLabelStyle: unselectedLabelStyle,
      automaticIndicatorColorAdjustment: automaticIndicatorColorAdjustment,
      indicatorColor: indicatorColor,
      indicatorWeight: indicatorWeight,
      indicatorPadding: indicatorPadding,
      isScrollable: isScrollable,
      indicatorSize: indicatorSize,
    );
  }
}

class ITab implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    String? text;
    var textParsed = namedArguments[const Symbol('text')];
    if (textParsed != null) {
      text = textParsed as String;
    }
    Widget? icon;
    var iconParsed = namedArguments[const Symbol('icon')];
    if (iconParsed != null) {
      icon = iconParsed as Widget;
    }
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    EdgeInsetsGeometry iconMargin = const EdgeInsets.only(bottom: 10);
    var iconMarginParsed = namedArguments[const Symbol('iconMargin')];
    if (iconMarginParsed != null) {
      iconMargin = iconMarginParsed as EdgeInsetsGeometry;
    }
    return Tab(
      text: text,
      icon: icon,
      height: height,
      child: child,
      iconMargin: iconMargin,
    );
  }
}

class IDefaultTabController implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var length = namedArguments[const Symbol('length')];
    if (length == null) {
      throw "length required in DefaultTabController";
    }
    int initialIndex = 0;
    var initialIndexParsed = namedArguments[const Symbol('initialIndex')];
    if (initialIndexParsed != null) {
      initialIndex = initialIndexParsed as int;
    }
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in DefaultTabController";
    }
    return DefaultTabController(
      length: length as int,
      initialIndex: initialIndex,
      child: child as Widget,
    );
  }
}

class ITabBarView implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var children = namedArguments[const Symbol('children')];
    if (children == null) {
      throw "children required in TabBarView";
    }
    DragStartBehavior dragStartBehavior = DragStartBehavior.start;
    var dragStartBehaviorParsed =
        namedArguments[const Symbol('dragStartBehavior')];
    if (dragStartBehaviorParsed != null) {
      dragStartBehavior = dragStartBehaviorParsed as DragStartBehavior;
    }
    return TabBarView(
      children: children as List<Widget>,
      dragStartBehavior: dragStartBehavior,
    );
  }
}
