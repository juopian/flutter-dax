import 'package:dax/dax.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class IScaffold implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? body;
    var bodyParsed = namedArguments[const Symbol('body')];
    if (bodyParsed != null) {
      body = bodyParsed as Widget;
    }
    PreferredSizeWidget? appBar;
    var appBarParsed = namedArguments[const Symbol('appBar')];
    if (appBarParsed != null) {
      appBar = appBarParsed as PreferredSizeWidget;
    }
    Widget? floatingActionButton;
    var floatingActionButtonParsed =
        namedArguments[const Symbol('floatingActionButton')];
    if (floatingActionButtonParsed != null) {
      floatingActionButton = floatingActionButtonParsed as Widget;
    }
    Widget? bottomNavigationBar;
    var bottomNavigationBarParsed =
        namedArguments[const Symbol('bottomNavigationBar')];
    if (bottomNavigationBarParsed != null) {
      bottomNavigationBar = bottomNavigationBarParsed as Widget;
    }
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}

class IBottomNavigationBar implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    List<BottomNavigationBarItem> items = [];
    var itemsParsed = namedArguments[const Symbol('items')];
    if (itemsParsed != null) {
      items = (itemsParsed as List).cast<BottomNavigationBarItem>();
    }
    int currentIndex = 0;
    var currentIndexParsed = namedArguments[const Symbol('currentIndex')];
    if (currentIndexParsed != null) {
      currentIndex = currentIndexParsed as int;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    double iconSize =
        parseDouble(namedArguments[const Symbol('fontSize')]) ?? 22.0;
    Color? selectedItemColor;
    var selectedItemColorParsed =
        namedArguments[const Symbol('selectedItemColor')];
    if (selectedItemColorParsed != null) {
      selectedItemColor = selectedItemColorParsed as Color;
    }
    Color? unselectedItemColor;
    var unselectedItemColorParsed =
        namedArguments[const Symbol('unselectedItemColor')];
    if (unselectedItemColorParsed != null) {
      unselectedItemColor = unselectedItemColorParsed as Color;
    }
    double selectedFontSize =
        parseDouble(namedArguments[const Symbol('selectedFontSize')]) ?? 14.0;
    double unselectedFontSize =
        parseDouble(namedArguments[const Symbol('unselectedFontSize')]) ?? 12.0;
    bool? showSelectedLabels;
    var showSelectedLabelsParsed =
        namedArguments[const Symbol('showSelectedLabels')];
    if (showSelectedLabelsParsed != null) {
      showSelectedLabels = showSelectedLabelsParsed as bool;
    }
    bool? showUnselectedLabels;
    var showUnselectedLabelsParsed =
        namedArguments[const Symbol('showUnselectedLabels')];
    if (showUnselectedLabelsParsed != null) {
      showUnselectedLabels = showUnselectedLabelsParsed as bool;
    }
    Function(int)? onTap;
    var onTapParsed = namedArguments[const Symbol('onTap')];
    if (onTapParsed != null) {
      onTap = (int i) {
        (onTapParsed as LoxFunction).call(interpreter, [i], {});
      };
    }
    Color? fixedColor;
    var fixedColorParsed = namedArguments[const Symbol('fixedColor')];
    if (fixedColorParsed != null) {
      fixedColor = fixedColorParsed as Color;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    TextStyle? selectedLabelStyle;
    var selectedLabelStyleParsed =
        namedArguments[const Symbol('selectedLabelStyle')];
    if (selectedLabelStyleParsed != null) {
      selectedLabelStyle = selectedLabelStyleParsed as TextStyle;
    }
    TextStyle? unselectedLabelStyle;
    var unselectedLabelStyleParsed =
        namedArguments[const Symbol('unselectedLabelStyle')];
    if (unselectedLabelStyleParsed != null) {
      unselectedLabelStyle = unselectedLabelStyleParsed as TextStyle;
    }
    return BottomNavigationBar(
      items: items,
      onTap: onTap,
      iconSize: iconSize,
      elevation: elevation,
      fixedColor: fixedColor,
      backgroundColor: backgroundColor,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      selectedFontSize: selectedFontSize,
      unselectedFontSize: unselectedFontSize,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      currentIndex: currentIndex,
    );
  }
}

class IAppBar implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? title;
    var titleParsed = namedArguments[const Symbol('title')];
    if (titleParsed != null) {
      title = titleParsed as Widget;
    }
    List<Widget> actions = [];
    var actionsParsed = namedArguments[const Symbol('actions')];
    if (actionsParsed != null) {
      actions = (actionsParsed as List).cast<Widget>();
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    Color? foregroundColor;
    var foregroundColorParsed = namedArguments[const Symbol('forgroundColor')];
    if (foregroundColorParsed != null) {
      foregroundColor = foregroundColorParsed as Color;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    bool? centerTitle;
    var centerTitleParsed = namedArguments[const Symbol('centerTitle')];
    if (centerTitleParsed != null) {
      centerTitle = centerTitleParsed as bool;
    }
    PreferredSizeWidget? bottom;
    var bottomParsed = namedArguments[const Symbol('bottom')];
    if (bottomParsed != null) {
      bottom = bottomParsed as PreferredSizeWidget;
    }
    return AppBar(
      title: title,
      actions: actions,
      bottom: bottom,
      elevation: elevation,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }
}

class IContainer implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    EdgeInsetsGeometry? margin;
    EdgeInsetsGeometry? padding;
    Decoration? decoration;
    Color? color;
    Widget? child;
    var marginParsed = namedArguments[const Symbol('margin')];
    if (marginParsed != null) {
      margin = marginParsed as EdgeInsetsGeometry;
    }
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    var decorationParsed = namedArguments[const Symbol('decoration')];
    if (decorationParsed != null) {
      decoration = decorationParsed as Decoration;
    }
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    Matrix4? transform;
    var transformParsed = namedArguments[const Symbol('transform')];
    if (transformParsed != null) {
      transform = transformParsed as Matrix4;
    }
    BoxConstraints? constraints;
    var constraintsParsed = namedArguments[const Symbol('constraints')];
    if (constraintsParsed != null) {
      constraints = constraintsParsed as BoxConstraints;
    }
    return Container(
        margin: margin,
        padding: padding,
        constraints: constraints,
        decoration: decoration,
        transform: transform,
        child: child,
        color: color,
        height: height,
        width: width);
  }
}

class IBoxConstraints implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double minWidth =
        parseDouble(namedArguments[const Symbol('minWidth')]) ?? 0;
    double maxWidth = parseDouble(namedArguments[const Symbol('maxWidth')]) ??
        double.infinity;
    double minHeight =
        parseDouble(namedArguments[const Symbol('minHeight')]) ?? 0;
    double maxHeight = parseDouble(namedArguments[const Symbol('maxHeight')]) ??
        double.infinity;
    return BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}

class IPadding implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var padding = namedArguments[const Symbol('padding')];
    if (padding == null) {
      throw "padding required in Padding";
    }
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    return Padding(
      padding: padding as EdgeInsetsGeometry,
      child: child,
    );
  }
}

class IClipOval implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    return ClipOval(
      child: child,
    );
  }
}

class IClipRRect implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    BorderRadius? borderRadius;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }
    return ClipRRect(
      child: child,
      borderRadius: borderRadius,
    );
  }
}

class IClipRect implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    return ClipRect(
      child: child,
    );
  }
}

class IListTile implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? leading;
    var leadingParsed = namedArguments[const Symbol('leading')];
    if (leadingParsed != null) {
      leading = leadingParsed as Widget;
    }
    Widget? title;
    var titleParsed = namedArguments[const Symbol('title')];
    if (titleParsed != null) {
      title = titleParsed as Widget;
    }
    Widget? subtitle;
    var subtitleParsed = namedArguments[const Symbol('subtitle')];
    if (subtitleParsed != null) {
      subtitle = subtitleParsed as Widget;
    }
    Widget? trailing;
    var trailingParsed = namedArguments[const Symbol('trailing')];
    if (trailingParsed != null) {
      trailing = trailingParsed as Widget;
    }
    bool? dense;
    var denseParsed = namedArguments[const Symbol('dense')];
    if (denseParsed != null) {
      dense = denseParsed as bool;
    }
    bool selected = false;
    var selectedParsed = namedArguments[const Symbol('selected')];
    if (selectedParsed != null) {
      selected = selectedParsed as bool;
    }
    Function()? onTap;
    var onTapParsed = namedArguments[const Symbol('onTap')];
    if (onTapParsed != null) {
      onTap = () {
        (onTapParsed as LoxFunction).call(interpreter, [], {});
      };
    }
    Function()? onLongPress;
    var onLongPressParsed = namedArguments[const Symbol('onLongPress')];
    if (onLongPressParsed != null) {
      onLongPress = () {
        (onLongPressParsed as LoxFunction).call(interpreter, [], {});
      };
    }
    EdgeInsetsGeometry? contentPadding;
    var contentPaddingParsed = namedArguments[const Symbol('contentPadding')];
    if (contentPaddingParsed != null) {
      contentPadding = contentPaddingParsed as EdgeInsetsGeometry;
    }
    return ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        dense: dense,
        selected: selected,
        onTap: onTap,
        onLongPress: onLongPress,
        contentPadding: contentPadding);
  }
}

class IFloatingActionButton implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    var onPressed = namedArguments[const Symbol('onPressed')];
    if (onPressed == null) {
      throw "onPressed required in ElevatedButton";
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    Color? forgroundColor;
    var forgroundColorParsed = namedArguments[const Symbol('forgroundColor')];
    if (forgroundColorParsed != null) {
      forgroundColor = forgroundColorParsed as Color;
    }
    bool mini = false;
    var miniParsed = namedArguments[const Symbol('mini')];
    if (miniParsed != null) {
      mini = miniParsed as bool;
    }
    bool isExtended = false;
    var isExtendedParsed = namedArguments[const Symbol('isExtend')];
    if (isExtendedParsed != null) {
      isExtended = isExtendedParsed as bool;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      foregroundColor: forgroundColor,
      child: child,
      mini: mini,
      elevation: elevation,
      isExtended: isExtended,
      onPressed: () {
        (onPressed as LoxFunction).call(interpreter, [], {});
      },
    );
  }
}

class ISizedBox implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}

class IExpansionTile implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var title = namedArguments[const Symbol('title')];
    if (title == null) {
      throw "title required in ExpansionTile";
    }
    List<Widget> children = [];
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed != null) {
      children = (childrenParsed as List).cast<Widget>();
    }
    Widget? leading;
    var leadingParsed = namedArguments[const Symbol('leading')];
    if (leadingParsed != null) {
      leading = leadingParsed as Widget;
    }
    Widget? trailing;
    var trailingParsed = namedArguments[const Symbol('trailing')];
    if (trailingParsed != null) {
      trailing = trailingParsed as Widget;
    }
    bool initiallyExpanded = false;
    var initiallyExpandedParsed =
        namedArguments[const Symbol('initiallyExpanded')];
    if (initiallyExpandedParsed != null) {
      initiallyExpanded = initiallyExpandedParsed as bool;
    }
    EdgeInsetsGeometry? tilePadding;
    var tilePaddingParsed = namedArguments[const Symbol('titlePadding')];
    if (tilePaddingParsed != null) {
      tilePadding = tilePaddingParsed as EdgeInsetsGeometry;
    }
    EdgeInsetsGeometry? childrenPadding;
    var childrenPaddingParsed = namedArguments[const Symbol('childrenPadding')];
    if (childrenPaddingParsed != null) {
      childrenPadding = childrenPaddingParsed as EdgeInsetsGeometry;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    Color? collapsedBackgroundColor;
    var collapsedBackgroundColorParsed =
        namedArguments[const Symbol('collapsedBackgroundColor')];
    if (collapsedBackgroundColorParsed != null) {
      collapsedBackgroundColor = collapsedBackgroundColorParsed as Color;
    }
    Color? textColor;
    var textColorParsed = namedArguments[const Symbol('textColor')];
    if (textColorParsed != null) {
      textColor = textColorParsed as Color;
    }
    Color? collapsedTextColor;
    var collapsedTextColorParsed =
        namedArguments[const Symbol('collapsedTextColor')];
    if (collapsedTextColorParsed != null) {
      collapsedTextColor = collapsedTextColorParsed as Color;
    }
    Color? iconColor;
    var iconColorParsed = namedArguments[const Symbol('iconColor')];
    if (iconColorParsed != null) {
      iconColor = iconColorParsed as Color;
    }
    Color? collapsedIconColor;
    var collapsedIconColorParsed =
        namedArguments[const Symbol('collapsedIconColor')];
    if (collapsedIconColorParsed != null) {
      collapsedIconColor = collapsedIconColorParsed as Color;
    }
    Function(bool)? onExpansionChanged;
    var onExpansionChangedParsed =
        namedArguments[const Symbol('onExpansionChanged')];
    if (onExpansionChangedParsed != null) {
      onExpansionChanged = (bool b) {
        (onExpansionChangedParsed as LoxFunction).call(interpreter, [b], {});
      };
    }
    ListTileControlAffinity? controlAffinity;
    var controlAffinityParsed = namedArguments[const Symbol('controlAffinity')];
    if (controlAffinityParsed != null) {
      controlAffinity = controlAffinityParsed as ListTileControlAffinity;
    }
    return ExpansionTile(
      title: title as Widget,
      leading: leading,
      controlAffinity: controlAffinity,
      trailing: trailing,
      children: children,
      onExpansionChanged: onExpansionChanged,
      tilePadding: tilePadding,
      childrenPadding: childrenPadding,
      initiallyExpanded: initiallyExpanded,
      backgroundColor: backgroundColor,
      collapsedBackgroundColor: collapsedBackgroundColor,
      textColor: textColor,
      collapsedTextColor: collapsedTextColor,
      iconColor: iconColor,
      collapsedIconColor: collapsedIconColor,
    );
  }
}

class IPopupMenuButton implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    Widget? icon;
    var iconParsed = namedArguments[const Symbol('icon')];
    if (iconParsed != null) {
      icon = iconParsed as Widget;
    }
    var itemBuilder = namedArguments[const Symbol('itemBuilder')];
    if (itemBuilder == null) {
      throw "itemBuilder required in ListView.builder";
    }
    Function(Object)? onSelected;
    var onSelectedParsed = namedArguments[const Symbol('onSelected')];
    if (onSelectedParsed != null) {
      onSelected = (Object b) {
        (onSelectedParsed as LoxFunction).call(interpreter, [b], {});
      };
    }
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    Offset offset = const Offset(0, 0);
    var offsetParsed = namedArguments[const Symbol('offset')];
    if (offsetParsed != null) {
      offset = offsetParsed as Offset;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    double? iconSize = parseDouble(namedArguments[const Symbol('iconSize')]);
    bool enabled = true;
    var enabledParsed = namedArguments[const Symbol('enabled')];
    if (enabledParsed != null) {
      enabled = enabledParsed as bool;
    }
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0);
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsetsGeometry;
    }
    Object? initialValue;
    var initialValueParsed = namedArguments[const Symbol('initialValue')];
    if (initialValueParsed != null) {
      initialValue = initialValueParsed;
    }
    return PopupMenuButton(
        child: child,
        icon: icon,
        offset: offset,
        initialValue: initialValue,
        padding: padding,
        enabled: enabled,
        itemBuilder: (BuildContext context) {
          return ((itemBuilder as LoxCallable).call(interpreter, [context], {})
                  as List)
              .cast<PopupMenuEntry<Object>>();
        },
        onSelected: onSelected,
        color: color,
        iconSize: iconSize,
        elevation: elevation);
  }
}

class IPopupMenuDivider implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return const PopupMenuDivider();
  }
}

class IPopupMenuItem implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var value = namedArguments[const Symbol('value')];
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    Function()? onTap;
    var onTapParsed = namedArguments[const Symbol('onTap')];
    if (onTapParsed != null) {
      onTap = () {
        (onTapParsed as LoxFunction).call(interpreter, [], {});
      };
    }
    EdgeInsets? padding;
    var paddingParsed = namedArguments[const Symbol('padding')];
    if (paddingParsed != null) {
      padding = paddingParsed as EdgeInsets;
    }
    return PopupMenuItem(
      value: value,
      child: child,
      onTap: onTap,
      padding: padding,
    );
  }
}

class IPopupMenuWrapView implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in PopupMenuWrapView";
    }
    return PopupMenuWrapView(child: child as Widget);
  }
}

class PopupMenuWrapView extends PopupMenuEntry<Never>{
  final Widget child;
  const PopupMenuWrapView({Key? key, required this.child,}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PopupMenuWrapViewState();
  }

  @override
  bool represents(void value) {
    return false;
  }

  @override
  double get height => throw UnimplementedError();
}

class PopupMenuWrapViewState extends State<PopupMenuWrapView> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
