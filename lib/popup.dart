import "package:flutter/material.dart";
import 'package:dax/dax.dart';
import 'utils.dart';

const Duration _kMenuDuration = Duration(milliseconds: 300);
const double _kMenuScreenPadding = 0.0;
const double _kMenuVerticalPadding = 8.0;

class IDropdownAnimated implements LoxFlutterFunction {
  @override
  Object? call(Interpreter interpreter, List<Object?> arguments,
      Map<Symbol, Object?> namedArguments) {
    var child = namedArguments[const Symbol('child')];
    if (child == null) {
      throw "child required in DropdownFullWidth.";
    }
    var itemBuilder = namedArguments[const Symbol('itemBuilder')];
    if (itemBuilder == null) {
      throw "itemBuilder required in ListView.builder";
    }
    EdgeInsetsGeometry padding = const EdgeInsets.all(8);
    var paddingParse = namedArguments[const Symbol('padding')];
    if (paddingParse != null) {
      padding = paddingParse as EdgeInsetsGeometry;
    }
    double? elevation = parseDouble(namedArguments[const Symbol('elevation')]);
    bool enabled = true;
    var enabledParse = namedArguments[const Symbol('enabled')];
    if (enabledParse != null) {
      enabled = enabledParse as bool;
    }
    Widget? icon;
    var iconParse = namedArguments[const Symbol('icon')];
    if (iconParse != null) {
      icon = iconParse as Widget;
    }
    double? iconSize = parseDouble(namedArguments[const Symbol('iconSize')]);
    BorderRadius? borderRadius;
    var borderRadiusParse = namedArguments[const Symbol('borderRadius')];
    if (borderRadiusParse != null) {
      borderRadius = borderRadiusParse as BorderRadius;
    }
    Offset offset = Offset.zero;
    var offsetParse = namedArguments[const Symbol('offset')];
    if (offsetParse != null) {
      offset = offsetParse as Offset;
    }
    Color? color;
    var colorParse = namedArguments[const Symbol('color')];
    if (colorParse != null) {
      color = colorParse as Color;
    }
    Object? initValue = namedArguments[const Symbol('initValue')];
    Function(Object?)? onSelected;
    var onSelectedParse = namedArguments[const Symbol('onSelected')];
    if (onSelectedParse != null) {
      onSelected = (v) {
        (onSelectedParse as LoxFunction).call(interpreter, [v], {});
      };
    }
    ShapeBorder? shape;
    var shapeParse = namedArguments[const Symbol('shape')];
    if (shapeParse != null) {
      shape = shapeParse as ShapeBorder;
    }
    return DropdownFullWidth(
      child: child as Widget,
      initValue: initValue,
      elevation: elevation,
      offset: offset,
      icon: icon,
      onSelected: onSelected,
      shape: shape,
      color: color,
      iconSize: iconSize,
      enabled: enabled,
      borderRadius: borderRadius,
      padding: padding,
      itemBuilder: (BuildContext context) {
        return ((itemBuilder as LoxCallable).call(interpreter, [context], {})
                as List)
            .cast<PopupMenuEntry<Object>>();
      },
    );
  }
}

class _FullPopupMenu extends StatelessWidget {
  final _FullPopupRoute route;
  const _FullPopupMenu({Key? key, required this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double unit = 1.0 / (route.items.length + 1.5);
    final List<Widget> children = [];
    final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
    for (int i = 0; i < route.items.length; i++) {
      final double start = (i + 1) * unit;
      final double end = (start + 1.5 * unit).clamp(0.0, 1.0);
      final opacity = CurvedAnimation(
          parent: route.animation!, curve: Interval(start, end));
      Widget item = route.items[i];
      if (route.initValue != null &&
          route.items[i].represents(route.initValue)) {
        item = Container(
          color: Theme.of(context).highlightColor,
          child: item,
        );
      }
      children.add(FadeTransition(opacity: opacity, child: item));
    }
    final CurveTween opacity = CurveTween(curve: const Interval(0.0, 1 / 3.0));
    final CurveTween width = CurveTween(curve: Interval(0.0, unit));
    final CurveTween height =
        CurveTween(curve: Interval(0.0, unit * route.items.length));
    return AnimatedBuilder(
        animation: route.animation!,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: opacity.evaluate(route.animation!),
            child: Material(
              shape: route.shape ?? popupMenuTheme.shape,
              color: route.color ?? popupMenuTheme.color,
              elevation: route.elevation ?? 8,
              type: MaterialType.card,
              child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  widthFactor: width.evaluate(route.animation!),
                  heightFactor: height.evaluate(route.animation!),
                  child: child),
            ),
          );
        },
        child: SingleChildScrollView(child: ListBody(children: children)));
  }
}

class DropdownFullWidth extends StatefulWidget {
  final Widget child;
  final Object? initValue;
  final void Function(Object?)? onSelected;
  final double? elevation;
  final List<PopupMenuEntry<Object>> Function(BuildContext context) itemBuilder;
  final EdgeInsetsGeometry padding;
  final Widget? icon;
  final Offset offset;
  final bool enabled;
  final ShapeBorder? shape;
  final Color? color;
  final double? iconSize;
  final BorderRadiusGeometry? borderRadius;

  const DropdownFullWidth(
      {Key? key,
      this.initValue,
      this.onSelected,
      this.elevation,
      this.padding = const EdgeInsets.all(8),
      this.icon,
      this.offset = Offset.zero,
      this.enabled = true,
      this.shape,
      this.color,
      this.iconSize,
      this.borderRadius,
      required this.child,
      required this.itemBuilder})
      : super(key: key);

  @override
  State<DropdownFullWidth> createState() => _DropdownFullWidthState();
}

class _DropdownFullWidthState extends State<DropdownFullWidth>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController animationController;
  late CurvedAnimation easeOutAnimation;
  final borderColorTween =
      ColorTween(begin: Colors.black12, end: const Color(0xfff1f1f1));
  final bgColorTween =
      ColorTween(begin: Colors.white, end: const Color(0xfff1f1f1));
  final iconTurns = Tween<double>(begin: 0.0, end: 0.5);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    easeOutAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    super.initState();
  }

  void showDropdownMenu() {
    if (isExpanded) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
    isExpanded = !isExpanded;
    final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(widget.offset, ancestor: overlay),
        button.localToGlobal(
            button.size.bottomRight(Offset.zero) + widget.offset,
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    final List<PopupMenuEntry<Object>> items = widget.itemBuilder(context);
    if (items.isNotEmpty) {
      showMenu(
        context: context,
        elevation: widget.elevation,
        items: items,
        initValue: widget.initValue,
        shape: widget.shape ?? popupMenuTheme.shape,
        color: widget.color ?? popupMenuTheme.color,
        position: position,
      ).then((value) {
        animationController.reverse();
        isExpanded = !isExpanded;
        if (!mounted) return null;
        if (value == null) return null;
        if (widget.onSelected != null) {
          widget.onSelected!(value);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled ? showDropdownMenu : null,
      child: AnimatedBuilder(
        animation: easeOutAnimation,
        builder: (context, child) {
          return Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                  borderRadius: widget.borderRadius,
                  color: bgColorTween.evaluate(easeOutAnimation),
                  border: Border.all(
                      color: borderColorTween.evaluate(easeOutAnimation)!)),
              child: Row(
                children: [
                  child!,
                  RotationTransition(
                    turns: iconTurns.animate(easeOutAnimation),
                    child: widget.icon ??
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: widget.iconSize ?? 14,
                        ),
                  )
                ],
              ));
        },
        child: widget.child,
      ),
    );
  }
}

class _FullPopupRoute<T> extends PopupRoute<T> {
  final List<PopupMenuEntry<Object>> items;
  final RelativeRect position;
  final double? elevation;
  final T? initValue;
  final ShapeBorder? shape;
  final Color? color;

  _FullPopupRoute(
      {required this.items,
      required this.position,
      this.initValue,
      this.shape,
      this.color,
      this.elevation});
  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => _kMenuDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    int? selectedItemIndex;
    if (initValue != null) {
      for (int index = 0;
          selectedItemIndex == null && index < items.length;
          index += 1) {
        if (items[index].represents(initValue)) selectedItemIndex = index;
      }
    }
    final mediaQuery = MediaQuery.of(context);
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        removeLeft: true,
        removeRight: true,
        child: Builder(
          builder: (context) {
            return CustomSingleChildLayout(
                delegate: _PopupPositionDelegate(
                  position,
                  mediaQuery.padding,
                  [],
                  selectedItemIndex,
                  Directionality.of(context),
                ),
                child: _FullPopupMenu(
                  route: this,
                ));
          },
        ));
  }
}

class _PopupPositionDelegate extends SingleChildLayoutDelegate {
  final RelativeRect position;
  final TextDirection textDirection;
  EdgeInsets padding;
  List<Size?> itemSizes;
  final int? selectedItemIndex;

  _PopupPositionDelegate(this.position, this.padding, this.itemSizes,
      this.selectedItemIndex, this.textDirection);

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(
        constraints.biggest - Offset(0, padding.top + kToolbarHeight) as Size);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: The size of the overlay.
    // childSize: The size of the menu, when fully open, as determined by
    // getConstraintsForChild.

    final double buttonHeight = size.height - position.top - position.bottom;
    // Find the ideal vertical position.
    double y = position.top;
    if (selectedItemIndex != null && itemSizes.isNotEmpty) {
      double selectedItemOffset = _kMenuVerticalPadding;
      for (int index = 0; index < selectedItemIndex!; index += 1) {
        selectedItemOffset += itemSizes[index]!.height;
      }
      selectedItemOffset += itemSizes[selectedItemIndex!]!.height / 2;
      y = y + buttonHeight / 2.0 - selectedItemOffset;
    }

    // Find the ideal horizontal position.
    double x;
    if (position.left > position.right) {
      // Menu button is closer to the right edge, so grow to the left, aligned to the right edge.
      x = size.width - position.right - childSize.width;
    } else if (position.left < position.right) {
      // Menu button is closer to the left edge, so grow to the right, aligned to the left edge.
      x = position.left;
    } else {
      // Menu button is equidistant from both edges, so grow in reading direction.
      switch (textDirection) {
        case TextDirection.rtl:
          x = size.width - position.right - childSize.width;
          break;
        case TextDirection.ltr:
          x = position.left;
          break;
      }
    }

    // Avoid going outside an area defined as the rectangle 8.0 pixels from the
    // edge of the screen in every direction.
    if (x < _kMenuScreenPadding + padding.left) {
      x = _kMenuScreenPadding + padding.left;
    } else if (x + childSize.width >
        size.width - _kMenuScreenPadding - padding.right) {
      x = size.width - childSize.width - _kMenuScreenPadding - padding.right;
    }
    if (y < _kMenuScreenPadding + padding.top) {
      y = _kMenuScreenPadding + padding.top;
    } else if (y + childSize.height >
        size.height - _kMenuScreenPadding - padding.bottom) {
      y = size.height - padding.bottom - _kMenuScreenPadding - childSize.height;
    }

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupPositionDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}

Future<Object?> showMenu(
    {required BuildContext context,
    required RelativeRect position,
    List<PopupMenuEntry<Object>> items = const [],
    Object? initValue,
    double? elevation,
    ShapeBorder? shape,
    Color? color,
    bool useRootNavigator = false}) {
  return Navigator.push(
      context,
      _FullPopupRoute<Object>(
        position: position,
        elevation: elevation,
        initValue: initValue,
        shape: shape,
        color: color,
        items: items,
      ));
}
