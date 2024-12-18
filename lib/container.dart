import 'package:dax/dax.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class IScaffold implements DaxCallable {
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
    FloatingActionButtonLocation? floatingActionButtonLocation;
    var floatingActionButtonLocationParsed =
        namedArguments[const Symbol('floatingActionButtonLocation')];
    if (floatingActionButtonLocationParsed != null) {
      floatingActionButtonLocation =
          floatingActionButtonLocationParsed as FloatingActionButtonLocation;
    }
    Widget? bottomSheet;
    var bottomSheetParsed = namedArguments[const Symbol('bottomSheet')];
    if (bottomSheetParsed != null) {
      bottomSheet = bottomSheetParsed as Widget;
    }
    Color? backgroundColor;
    var backgroundColorParsed = namedArguments[const Symbol('backgroundColor')];
    if (backgroundColorParsed != null) {
      backgroundColor = backgroundColorParsed as Color;
    }
    bool primary = true;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as bool;
    }
    bool extendBody = false;
    var extendBodyParsed = namedArguments[const Symbol('extendBody')];
    if (extendBodyParsed != null) {
      extendBody = extendBodyParsed as bool;
    }
    bool extendBodyBehindAppBar = false;
    var extendBodyBehindAppBarParsed =
        namedArguments[const Symbol('extendBodyBehindAppBar')];
    if (extendBodyBehindAppBarParsed != null) {
      extendBodyBehindAppBar = extendBodyBehindAppBarParsed as bool;
    }
    List<Widget>? persistentFooterButtons;
    var persistentFooterButtonsParsed =
        namedArguments[const Symbol('persistentFooterButtons')];
    if (persistentFooterButtonsParsed != null) {
      persistentFooterButtons =
          (persistentFooterButtonsParsed as List).cast<Widget>();
    }
    bool? resizeToAvoidBottomInset;
    var resizeToAvoidBottomInsetParsed =
        namedArguments[const Symbol('resizeToAvoidBottomInset')];
    if (resizeToAvoidBottomInsetParsed != null) {
      resizeToAvoidBottomInset = resizeToAvoidBottomInsetParsed as bool;
    }
    Widget? drawer;
    var drawerParsed = namedArguments[const Symbol('drawer')];
    if (drawerParsed != null) {
      drawer = drawerParsed as Widget;
    }
    Widget? endDrawer;
    var endDrawerParsed = namedArguments[const Symbol('endDrawer')];
    if (endDrawerParsed != null) {
      endDrawer = endDrawerParsed as Widget;
    }
    double? drawerEdgeDragWidth =
        parseDouble(namedArguments[const Symbol('drawerEdgeDragWidth')]);
    return Scaffold(
      appBar: appBar,
      body: body,
      drawer: drawer,
      endDrawer: endDrawer,
      primary: primary,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      persistentFooterButtons: persistentFooterButtons,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}

class IPageView implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    List<Widget> children = const [];
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed != null) {
      children = (childrenParsed as List).cast<Widget>();
    }
    Axis scrollDirection = Axis.horizontal;
    var scrollDirectionParsed = namedArguments[const Symbol('scrollDirection')];
    if (scrollDirectionParsed != null) {
      scrollDirection = scrollDirectionParsed as Axis;
    }
    bool reverse = false;
    var reverseParsed = namedArguments[const Symbol('reverse')];
    if (reverseParsed != null) {
      reverse = reverseParsed as bool;
    }
    PageController? controller;
    var controllerParsed = namedArguments[const Symbol('controller')];
    if (controllerParsed != null) {
      controller = controllerParsed as PageController;
    }
    Function(int)? onPageChanged;
    var onPageChangedParsed = namedArguments[const Symbol('onPageChanged')];
    if (onPageChangedParsed != null) {
      onPageChanged = (i) {
        (onPageChangedParsed as LoxFunction).call(interpreter, [i], {});
      };
    }
    DragStartBehavior dragStartBehavior = DragStartBehavior.start;
    var dragStartBehaviorParsed =
        namedArguments[const Symbol('dragStartBehavior')];
    if (dragStartBehaviorParsed != null) {
      dragStartBehavior = dragStartBehaviorParsed as DragStartBehavior;
    }

    return PageView(
      children: children,
      scrollDirection: scrollDirection,
      reverse: reverse,
      onPageChanged: onPageChanged,
      dragStartBehavior: dragStartBehavior,
      controller: controller,
    );
  }
}

class IMaterial implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Color? color;
    var colorParsed = namedArguments[const Symbol('color')];
    if (colorParsed != null) {
      color = colorParsed as Color;
    }
    Color? shadowColor;
    var shadowColorParsed = namedArguments[const Symbol('shadowColor')];
    if (shadowColorParsed != null) {
      shadowColor = shadowColorParsed as Color;
    }
    TextStyle? textStyle;
    var textStyleParsed = namedArguments[const Symbol('textStyle')];
    if (textStyleParsed != null) {
      textStyle = textStyleParsed as TextStyle;
    }
    BorderRadiusGeometry? borderRadius;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadiusGeometry;
    }
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    double elevation =
        parseDouble(namedArguments[const Symbol('elevation')]) ?? 0;
    return Material(
        color: color,
        shadowColor: shadowColor,
        textStyle: textStyle,
        elevation: elevation,
        borderRadius: borderRadius,
        shape: shape,
        child: child);
  }
}

class IDrawer implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    double elevation =
        parseDouble(namedArguments[const Symbol('elevation')]) ?? 16.0;
    return Drawer(
      child: child,
      elevation: elevation,
    );
  }
}

class IBottomNavigationBar implements DaxCallable {
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
      currentIndex: currentIndex,
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
    );
  }
}

class IAppBar implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? title;
    var titleParsed = namedArguments[const Symbol('title')];
    if (titleParsed != null) {
      title = titleParsed as Widget;
    }
    List<Widget>? actions;
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
    Widget? leading;
    var leadingParsed = namedArguments[const Symbol('leading')];
    if (leadingParsed != null) {
      leading = leadingParsed as Widget;
    }
    Widget? flexibleSpace;
    var flexibleSpaceParsed = namedArguments[const Symbol('flexibleSpace')];
    if (flexibleSpaceParsed != null) {
      flexibleSpace = flexibleSpaceParsed as Widget;
    }
    Color? shadowColor;
    var shadowColorParsed = namedArguments[const Symbol('shadowColor')];
    if (shadowColorParsed != null) {
      shadowColor = shadowColorParsed as Color;
    }
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    bool primary = true;
    var primaryParsed = namedArguments[const Symbol('primary')];
    if (primaryParsed != null) {
      primary = primaryParsed as bool;
    }
    double? titleSpacing =
        parseDouble(namedArguments[const Symbol('titleSpacing')]);
    double toolbarOptionsOpacity = 1.0;
    var toolbarOptionsOpacityParsed =
        namedArguments[const Symbol('toolbarOptionsOpacity')];
    if (toolbarOptionsOpacityParsed != null) {
      toolbarOptionsOpacity = toolbarOptionsOpacityParsed as double;
    }
    double bottomOpacity = 1.0;
    var bottomOpacityParsed = namedArguments[const Symbol('bottomOpacity')];
    if (bottomOpacityParsed != null) {
      bottomOpacity = bottomOpacityParsed as double;
    }
    double? toolbarHeight =
        parseDouble(namedArguments[const Symbol('toolbarHeight')]);
    double? leadingWidth =
        parseDouble(namedArguments[const Symbol('leadingWidth')]);
    TextStyle? titleTextStyle;
    var titleTextStyleParsed = namedArguments[const Symbol('titleTextStyle')];
    if (titleTextStyleParsed != null) {
      titleTextStyle = titleTextStyleParsed as TextStyle;
    }
    TextStyle? toolbarTextStyle;
    var toolbarTextStyleParsed =
        namedArguments[const Symbol('toolbarTextStyle')];
    if (toolbarTextStyleParsed != null) {
      toolbarTextStyle = toolbarTextStyleParsed as TextStyle;
    }
    bool automaticallyImplyLeading = true;
    var automaticallyImplyLeadingParsed =
        namedArguments[const Symbol('automaticallyImplyLeading')];
    if (automaticallyImplyLeadingParsed != null) {
      automaticallyImplyLeading = automaticallyImplyLeadingParsed as bool;
    }
    return AppBar(
      title: title,
      leading: leading,
      actions: actions,
      primary: primary,
      shadowColor: shadowColor,
      flexibleSpace: flexibleSpace,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOptionsOpacity,
      automaticallyImplyLeading: automaticallyImplyLeading,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      titleTextStyle: titleTextStyle,
      toolbarTextStyle: toolbarTextStyle,
      bottom: bottom,
      shape: shape,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
    );
  }
}

class IContainer implements DaxCallable {
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
    AlignmentGeometry? alignment;
    var alignmentParsed = namedArguments[const Symbol('alignment')];
    if (alignmentParsed != null) {
      alignment = alignmentParsed as AlignmentGeometry;
    }
    Decoration? foregroundDecoration;
    var foregroundDecorationParsed =
        namedArguments[const Symbol('foregroundDecoration')];
    if (foregroundDecorationParsed != null) {
      foregroundDecoration = foregroundDecorationParsed as Decoration;
    }
    Clip clipBehavior = Clip.none;
    var clipBehaviorParsed = namedArguments[const Symbol('clipBehavior')];
    if (clipBehaviorParsed != null) {
      clipBehavior = clipBehaviorParsed as Clip;
    }
    AlignmentGeometry? transformAlignment;
    var transformAlignmentParsed =
        namedArguments[const Symbol('transformAlignment')];
    if (transformAlignmentParsed != null) {
      transformAlignment = transformAlignmentParsed as AlignmentGeometry;
    }
    return Container(
        alignment: alignment,
        margin: margin,
        foregroundDecoration: foregroundDecoration,
        padding: padding,
        constraints: constraints,
        decoration: decoration,
        transform: transform,
        transformAlignment: transformAlignment,
        child: child,
        color: color,
        clipBehavior: clipBehavior,
        height: height,
        width: width);
  }
}

class BoxConstraintsLoose implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var size = arguments[0] as Size;
    return BoxConstraints.loose(size);
  }
}

class BoxConstraintsTight implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var size = arguments[0] as Size;
    return BoxConstraints.tight(size);
  }
}

class BoxConstraintsExpand implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double? width = parseDouble(namedArguments[const Symbol('width')]);
    double? height = parseDouble(namedArguments[const Symbol('height')]);
    return BoxConstraints.expand(
      width: width,
      height: height,
    );
  }
}

class ITableRow implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    List<Widget> children = const <Widget>[];
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed != null) {
      children = (childrenParsed as List).cast<Widget>();
    }
    Decoration? decoration;
    var decorationParsed = namedArguments[const Symbol('decoration')];
    if (decorationParsed != null) {
      decoration = decorationParsed as Decoration;
    }
    return TableRow(children: children, decoration: decoration);
  }
}

class IIntrinsicColumnWidth implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    return const IntrinsicColumnWidth();
  }
}

class IFlexColumnWidth implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double value = 1;
    if (arguments.isNotEmpty) {
      value = parseDouble(arguments[0]) ?? 1;
    }
    return FlexColumnWidth(value);
  }
}

class IFixedColumnWidth implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    if (arguments.isEmpty) {
      throw "value required in FixedColumnWidth";
    }
    double value = parseDouble(arguments[0]) ?? 0;
    return FixedColumnWidth(value);
  }
}

class ITableCell implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in TableCell";
    }
    TableCellVerticalAlignment? verticalAlignment;
    var verticalAlignmentParsed =
        namedArguments[const Symbol('verticalAlignment')];
    if (verticalAlignmentParsed != null) {
      verticalAlignment = verticalAlignmentParsed as TableCellVerticalAlignment;
    }

    return TableCell(
      child: child as Widget,
      verticalAlignment: verticalAlignment,
    );
  }
}

class ITable implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    TableBorder? border;
    var borderParsed = namedArguments[const Symbol('border')];
    if (borderParsed != null) {
      border = borderParsed as TableBorder;
    }
    List<TableRow> children = const <TableRow>[];
    var childrenParsed = namedArguments[const Symbol('children')];
    if (childrenParsed != null) {
      children = (childrenParsed as List).cast<TableRow>();
    }
    TextDirection? textDirection;
    var textDirectionParsed = namedArguments[const Symbol('textDirection')];
    if (textDirectionParsed != null) {
      textDirection = textDirectionParsed as TextDirection;
    }
    Map<int, TableColumnWidth> columnWidths = {};
    var columnWidthsParsed = namedArguments[const Symbol('columnWidths')];
    if (columnWidthsParsed != null) {
      var mp = columnWidthsParsed as Map;
      // loop k,v in mp
      for (var entry in mp.entries) {
        columnWidths[entry.key as int] = entry.value as TableColumnWidth;
      }
  
    }
    TableCellVerticalAlignment defaultVerticalAlignment =
        TableCellVerticalAlignment.top;
    var defaultVerticalAlignmentParsed =
        namedArguments[const Symbol('defaultVerticalAlignment')];
    if (defaultVerticalAlignmentParsed != null) {
      defaultVerticalAlignment =
          defaultVerticalAlignmentParsed as TableCellVerticalAlignment;
    }
    return Table(
        border: border,
        columnWidths: columnWidths,
        textDirection: textDirection,
        defaultVerticalAlignment: defaultVerticalAlignment,
        children: children);
  }
}

class IBoxConstraints implements DaxCallable, LoxGetCallable {
  @override
  Object? get(Token name) {
    switch (name.lexeme) {
      case 'loose':
        return BoxConstraintsLoose();
      case 'tight':
        return BoxConstraintsTight();
      case 'expanded':
        return BoxConstraintsExpand();
    }
    throw "Unknown property: ${name.lexeme}";
  }

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

class IPadding implements DaxCallable {
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

class IClipOval implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    Clip clipBehavior = Clip.antiAlias;
    var clipBehaviorParsed = namedArguments[const Symbol('clipBehavior')];
    if (clipBehaviorParsed != null) {
      clipBehavior = clipBehaviorParsed as Clip;
    }
    return ClipOval(
      child: child,
      clipBehavior: clipBehavior,
    );
  }
}

class IClipRRect implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    BorderRadius? borderRadius = BorderRadius.zero;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }
    Clip clipBehavior = Clip.antiAlias;
    var clipBehaviorParsed = namedArguments[const Symbol('clipBehavior')];
    if (clipBehaviorParsed != null) {
      clipBehavior = clipBehaviorParsed as Clip;
    }
    return ClipRRect(
      child: child,
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
    );
  }
}

class IClipRect implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    Widget? child;
    var childParsed = namedArguments[const Symbol('child')];
    if (childParsed != null) {
      child = childParsed as Widget;
    }
    Clip clipBehavior = Clip.hardEdge;
    var clipBehaviorParsed = namedArguments[const Symbol('clipBehavior')];
    if (clipBehaviorParsed != null) {
      clipBehavior = clipBehaviorParsed as Clip;
    }
    return ClipRect(
      child: child,
      clipBehavior: clipBehavior,
    );
  }
}

class IListTile implements DaxCallable {
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
    bool isThreeLine = false;
    var isThreeLineParsed = namedArguments[const Symbol('isThreeLine')];
    if (isThreeLineParsed != null) {
      isThreeLine = isThreeLineParsed as bool;
    }
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    bool enabled = true;
    var enabledParsed = namedArguments[const Symbol('enabled')];
    if (enabledParsed != null) {
      enabled = enabledParsed as bool;
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    Color? focusColor;
    var focusColorParsed = namedArguments[const Symbol('focusColor')];
    if (focusColorParsed != null) {
      focusColor = focusColorParsed as Color;
    }
    Color? tileColor;
    var tileColorParsed = namedArguments[const Symbol('tileColor')];
    if (tileColorParsed != null) {
      tileColor = tileColorParsed as Color;
    }
    Color? selectedTileColor;
    var selectedTileColorParsed =
        namedArguments[const Symbol('selectedTileColor')];
    if (selectedTileColorParsed != null) {
      selectedTileColor = selectedTileColorParsed as Color;
    }
    double? horizontalTitleGap =
        parseDouble(namedArguments[const Symbol('horizontalTitleGap')]);
    double? minVerticalPadding =
        parseDouble(namedArguments[const Symbol('minVerticalPadding')]);
    double? minLeadingWidth =
        parseDouble(namedArguments[const Symbol('minLeadingWidth')]);
    return ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        isThreeLine: isThreeLine,
        enabled: enabled,
        dense: dense,
        shape: shape,
        selected: selected,
        onTap: onTap,
        tileColor: tileColor,
        selectedTileColor: selectedTileColor,
        horizontalTitleGap: horizontalTitleGap,
        minVerticalPadding: minVerticalPadding,
        minLeadingWidth: minLeadingWidth,
        autofocus: autofocus,
        focusColor: focusColor,
        onLongPress: onLongPress,
        contentPadding: contentPadding);
  }
}

class IFloatingActionButton implements DaxCallable {
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
    Color? focusColor;
    var focusColorParsed = namedArguments[const Symbol('focusColor')];
    if (focusColorParsed != null) {
      focusColor = focusColorParsed as Color;
    }
    Color? splashColor;
    var splashColorParsed = namedArguments[const Symbol('splashColor')];
    if (splashColorParsed != null) {
      splashColor = splashColorParsed as Color;
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
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
    String? tooltip;
    var tooltipParsed = namedArguments[const Symbol('tooltip')];
    if (tooltipParsed != null) {
      tooltip = tooltipParsed as String;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    double? focusElevation =
        parseDouble(namedArguments[const Symbol('focusElevation')]);
    double? highlightElevation =
        parseDouble(namedArguments[const Symbol('highlightElevation')]);
    double? disabledElevation =
        parseDouble(namedArguments[const Symbol('disabledElevation')]);
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    Clip clipBehavior = Clip.none;
    var clipBehaviorParsed = namedArguments[const Symbol('clipBehavior')];
    if (clipBehaviorParsed != null) {
      clipBehavior = clipBehaviorParsed as Clip;
    }
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      foregroundColor: forgroundColor,
      splashColor: splashColor,
      focusColor: focusColor,
      autofocus: autofocus,
      child: child,
      mini: mini,
      tooltip: tooltip,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      focusElevation: focusElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      isExtended: isExtended,
      onPressed: () {
        (onPressed as LoxFunction).call(interpreter, [], {});
      },
    );
  }
}

class ISizedBox implements DaxCallable {
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

class IExpansionTile implements DaxCallable {
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
    Alignment? expandedAlignment;
    var expandedAlignmentParsed =
        namedArguments[const Symbol('expandedAlignment')];
    if (expandedAlignmentParsed != null) {
      expandedAlignment = expandedAlignmentParsed as Alignment;
    }
    CrossAxisAlignment? expandedCrossAxisAlignment;
    var expandedCrossAxisAlignmentParsed =
        namedArguments[const Symbol('collapsedAlignment')];
    if (expandedCrossAxisAlignmentParsed != null) {
      expandedCrossAxisAlignment =
          expandedCrossAxisAlignmentParsed as CrossAxisAlignment;
    }
    return ExpansionTile(
      title: title as Widget,
      leading: leading,
      controlAffinity: controlAffinity,
      trailing: trailing,
      children: children,
      expandedAlignment: expandedAlignment,
      expandedCrossAxisAlignment: expandedCrossAxisAlignment,
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

class IPopupMenuButton implements DaxCallable {
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
    String? tooltip;
    var tooltipParsed = namedArguments[const Symbol('tooltip')];
    if (tooltipParsed != null) {
      tooltip = tooltipParsed as String;
    }
    ShapeBorder? shape;
    var shapeParsed = namedArguments[const Symbol('shape')];
    if (shapeParsed != null) {
      shape = shapeParsed as ShapeBorder;
    }
    return PopupMenuButton(
        child: child,
        icon: icon,
        offset: offset,
        enabled: enabled,
        initialValue: initialValue,
        padding: padding,
        shape: shape,
        tooltip: tooltip,
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

class IPopupMenuDivider implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    double height = parseDouble(namedArguments[const Symbol('height')]) ?? 16.0;
    return PopupMenuDivider(height: height);
  }
}

class IPopupMenuItem implements DaxCallable {
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
    TextStyle? style;
    var styleParsed = namedArguments[const Symbol('style')];
    if (styleParsed != null) {
      style = styleParsed as TextStyle;
    }
    bool enabled = true;
    var enabledParsed = namedArguments[const Symbol('enabled')];
    if (enabledParsed != null) {
      enabled = enabledParsed as bool;
    }
    double height = parseDouble(namedArguments[const Symbol('height')]) ?? 48.0;
    return PopupMenuItem(
      value: value,
      enabled: enabled,
      height: height,
      child: child,
      onTap: onTap,
      textStyle: style,
      padding: padding,
    );
  }
}

class IPopupMenuWrap implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in PopupMenuWrapView";
    }
    return PopupMenuWrap(child: child as Widget);
  }
}

class PopupMenuWrap extends PopupMenuEntry<Never> {
  final Widget child;
  const PopupMenuWrap({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PopupMenuWrapState();
  }

  @override
  bool represents(void value) {
    return false;
  }

  @override
  double get height => throw UnimplementedError();
}

class PopupMenuWrapState extends State<PopupMenuWrap> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class IDropdownButton implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var items = namedArguments[const Symbol('items')];
    if (items == null) {
      throw "items required in DropdownButton";
    }
    bool isExpanded = false;
    var isExpandedParse = namedArguments[const Symbol('isExpanded')];
    if (isExpandedParse != null) {
      isExpanded = isExpandedParse as bool;
    }
    bool isDense = false;
    var isDenseParse = namedArguments[const Symbol('isDense')];
    if (isDenseParse != null) {
      isDense = isDenseParse as bool;
    }
    int elevation = 8;
    var elevationParse = namedArguments[const Symbol('elevation')];
    if (elevationParse != null) {
      elevation = elevationParse as int;
    }
    Object? value = namedArguments[const Symbol('value')];
    Function(Object?)? onChanged;
    var onChangedParse = namedArguments[const Symbol('onChanged')];
    if (onChangedParse != null) {
      onChanged = (Object? b) {
        (onChangedParse as LoxFunction).call(interpreter, [b], {});
      };
    }
    Function()? onTap;
    var onTapParse = namedArguments[const Symbol('onTap')];
    if (onTapParse != null) {
      onTap = () {
        (onTapParse as LoxFunction).call(interpreter, [], {});
      };
    }
    Widget? icon;
    var iconParse = namedArguments[const Symbol('icon')];
    if (iconParse != null) {
      icon = iconParse as Widget;
    }
    TextStyle? style;
    var styleParse = namedArguments[const Symbol('style')];
    if (styleParse != null) {
      style = styleParse as TextStyle;
    }
    double? menuMaxHeight =
        parseDouble(namedArguments[const Symbol('menuMaxHeight')]);
    Color? dropdownColor;
    var dropdownColorParse = namedArguments[const Symbol('dropdownColor')];
    if (dropdownColorParse != null) {
      dropdownColor = dropdownColorParse as Color;
    }
    double iconSize =
        parseDouble(namedArguments[const Symbol('iconSize')]) ?? 24.0;
    Widget? underline;
    var underlineParse = namedArguments[const Symbol('underline')];
    if (underlineParse != null) {
      underline = underlineParse as Widget;
    }
    AlignmentGeometry alignment = AlignmentDirectional.centerStart;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    Color? iconDisabledColor;
    var iconDisabledColorParse =
        namedArguments[const Symbol('iconDisabledColor')];
    if (iconDisabledColorParse != null) {
      iconDisabledColor = iconDisabledColorParse as Color;
    }
    Color? iconEnabledColor;
    var iconEnabledColorParse =
        namedArguments[const Symbol('iconEnabledColor')];
    if (iconEnabledColorParse != null) {
      iconEnabledColor = iconEnabledColorParse as Color;
    }
    Color? focusColor;
    var focusColorParsed = namedArguments[const Symbol('focusColor')];
    if (focusColorParsed != null) {
      focusColor = focusColorParsed as Color;
    }
    bool autofocus = false;
    var autofocusParsed = namedArguments[const Symbol('autofocus')];
    if (autofocusParsed != null) {
      autofocus = autofocusParsed as bool;
    }
    BorderRadius? borderRadius;
    var borderRadiusParsed = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParsed != null) {
      borderRadius = borderRadiusParsed as BorderRadius;
    }
    double? itemHeight =
        parseDouble(namedArguments[const Symbol('itemHeight')]);
    return DropdownButton(
        value: value,
        icon: icon,
        itemHeight: itemHeight,
        alignment: alignment,
        iconSize: iconSize,
        iconDisabledColor: iconDisabledColor,
        borderRadius: borderRadius,
        iconEnabledColor: iconEnabledColor,
        underline: underline,
        focusColor: focusColor,
        autofocus: autofocus,
        dropdownColor: dropdownColor,
        style: style,
        menuMaxHeight: menuMaxHeight,
        onChanged: onChanged,
        onTap: onTap,
        isDense: isDense,
        isExpanded: isExpanded,
        elevation: elevation,
        items: (items as List).cast<DropdownMenuItem<Object>>());
  }
}

class IDropdownMenuItem implements DaxCallable {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var value = namedArguments[const Symbol('value')];
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in DropdownMenuItem";
    }
    bool enabled = true;
    var enabledParse = namedArguments[const Symbol('enabled')];
    if (enabledParse != null) {
      enabled = enabledParse as bool;
    }
    AlignmentGeometry alignment = AlignmentDirectional.centerStart;
    var alignmentParse = namedArguments[const Symbol('alignment')];
    if (alignmentParse != null) {
      alignment = alignmentParse as AlignmentGeometry;
    }
    Function()? onTap;
    var onTapParse = namedArguments[const Symbol('onTap')];
    if (onTapParse != null) {
      onTap = () {
        (onTapParse as LoxFunction).call(interpreter, [], {});
      };
    }
    return DropdownMenuItem(
      value: value,
      child: child as Widget,
      enabled: enabled,
      onTap: onTap,
      alignment: alignment,
    );
  }
}
