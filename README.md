# flutter_dax

这是一个基于[dax](https://i-git.gzuni.com/xiecp/dax) 解析器的flutter组件。


## 安装

在pubspec.yaml文件添加
```
dax_flutter:  
    git:
      url: git@i-git.gzuni.com:xiecp/dax_flutter.git
      ref: master
```

## 使用

```
import 'package:dax_flutter/main.dart';
var codeSnap = ```
var i = 1;
fun build() {
  return Scaffold(
    appBar: AppBar(
      title: Text("title")
    ),
    body: Column(
      children: [
        Text("count : ${i}"),
        TextButton(
         child: Text("click"),
           onPressed: (){
             setState((){
              i = i+1;
             });
          }
        )
      ]
    )
  );
} ```;

Navigator.push(context, MaterialPageRoute( builder: (context) => DaxPage(codeSnap)));
```

# 基本组件库
目前组件库基于flutter2.5开发，覆盖大部分常用组件和配置，使用方法完全兼容flutter

## 1. 全局对象

* Api
```
Api.get(String url, {params})
Api.post(String url, {params})
Api.jwt
Api.version
Api.platform
Api.versionNumber
```
* AxisDirection
* base64
```
base64.encode(List<int> input)
base64.decode(String input)
```
* BlendMode
* BoxFit
* BorderRadius
```
BorderRadius.circular(double radius)
BorderRadius.zero
BorderRadius.all(Radius radius)
BorderRadius.only({
  Radius topLeft = Radius.zero,
  Radius topRight = Radius.zero,
  Radius bottomLeft = Radius.zero,
  Radius bottomRight = Radius.zero,
})
BorderRadius.vertical({Radius top = Radius.zero, Radius bottom = Radius.zero})
BorderRadius.horizontal({Radius left = Radius.zero, Radius right = Radius.zero})
```
* BorderStyle
* Colors
* CrossAxisAlignment
* EdgeInsets
```
EdgeInsets.all(double value)
EdgeInsets.only({double? top, double? right, double? bottom, double? left})
EdgeInsets.fromLTRB(double left, double top, double right, double bottom)
EdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0})
```
* FontWeight
* Icons
* ImageRepeat
* ImageSource
* JavascriptMode
* json
```
json.encode(Object? value)
json.decode(String source)
```
* LaunchMode
* ListTileControlAffinity
* LocationPermission
* MainAxisAlignment
* MainAxisSize
* math
```
math.max(num a, num b)
math.min(num a, num b)
math.randInt(int max) // [0, max)
math.randDouble() // [0.0, 1.0)
math.randBool() // true or false
math.sin(num x)
math.asin(num x)
math.cos(num x)
math.acos(num x)
math.tan(num x)
math.atan(num x)
math.atan2(num x, num y)
math.sqrt(num x)
math.exp(num x)
math.log(num x)
math.pow(num x, num y)
...
```
* Matrix4
* Navigator
```
Navigator.pop(BuildContext context)
Navigator.push(BuildContext context, Route<dynamic> route)
Navigator.pushNamed(BuildContext context, String routeName, {Object? arguments})
Navigator.pushReplacement(BuildContext context, Route<dynamic> route)
```
* path
```
path.basename(String path)
path.basenameWithoutExtension(String path)
path.dirname(String path)
path.join(
  String part1, [
  String? part2,
  String? part3,
  String? part4,
  String? part5,
  String? part6,
  String? part7,
  String? part8,
])
path.absolute(String path)
path.joinAll(Iterable<String> paths)
path.normalize(String path)
path.relative(String path, {String? from})
path.split(String path)
path.extension(String path)
path.isAbsolute(String path)
path.isRelative(String path)
```
* Platform
```
Platform.isAndroid
Platform.isIOS
Platform.isFuchsia
Platform.isMacOS
Platform.isWindows
Platform.isLinux
```
* Radius
```
Radius.circular(double radius)
Radius.elliptical(double x, double y)
Radius.zero
```
* SnackBarBehavior
* StackFit
* TabBarIndicatorSize
* TextAlign
* TextInputType
* TextDirection
* WrapAlignment

## 2. 组件及其用法

###  AlertDialog
```
AlertDialog({
  Widget? title,
  EdgeInsetsGeometry? titlePadding,
  TextStyle? titleTextStyle,
  Widget? content,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
  TextStyle? contentTextStyle,
  List<Widget>? actions,
  EdgeInsetsGeometry actionsPadding = EdgeInsets.zero,
  MainAxisAlignment? actionsAlignment,
  VerticalDirection? actionsOverflowDirection,
  double? actionsOverflowButtonSpacing,
  EdgeInsetsGeometry? buttonPadding,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  bool scrollable = false,
})
```
###  Align
```
Align({
  AlignmentGeometry alignment = Alignment.center,
  double? widthFactor,
  double? heightFactor,
  Widget? child,
})
```
###  Alignment
```
Alignment.bottomCenter
Alignment.bottomLeft
Alignment.bottomRight
Alignment.center
Alignment.centerLeft
Alignment.centerRight
Alignment.topCenter
Alignment.topLeft
Alignment.topRight
Alignment(double dx, double dy)
```
### AlignmentDirectional
```
AlignmentDirectional.topStart;
AlignmentDirectional.topCenter;
AlignmentDirectional.topEnd;
AlignmentDirectional.centerStart;
AlignmentDirectional.center;
AlignmentDirectional.centerEnd;
AlignmentDirectional.bottomStart;
AlignmentDirectional.bottomCenter;
AlignmentDirectional.bottomEnd;
AlignmentDirectional(double start, double y);
```
### AppBar
```
AppBar({
  Widget? leading,
  Widget? title,
  List<Widget>? actions,
  Widget? flexibleSpace,
  PreferredSizeWidget? bottom,
  double? elevation,
  Color? shadowColor,
  ShapeBorder? shape,
  Color? backgroundColor,
  Color? foregroundColor,
  bool primary = true,
  bool? centerTitle,
  double? titleSpacing,
  double toolbarOpacity = 1.0,
  double bottomOpacity = 1.0,
  double? toolbarHeight,
  double? leadingWidth,
  TextStyle? toolbarTextStyle,
  TextStyle? titleTextStyle,
})
```
###  AssetImage
```
AssetImage(String assetName)
```
###  BeveledRectangleBorder
```
BeveledRectangleBorder({BorderSide side = BorderSide.none, BorderRadiusGeometry borderRadius = BorderRadius.zero})
```
###  Border
```
Border({
  BorderSide top = BorderSide.none,
  BorderSide right = BorderSide.none,
  BorderSide bottom = BorderSide.none,
  BorderSide left = BorderSide.none,
})
或
Border.all({
  Color color = const Color(0xFF000000),
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
});
Border.fromBorderSide(BorderSide side);
Boder.symmetric({BorderSide vertical = BorderSide.none, BorderSide horizontal = BorderSide.none});
```
###  BorderSide
```
BorderSide({
  Color color = const Color(0xFF000000),
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
})
```
###  BottomNavigationBar
```
BottomNavigationBar({
  required List<BottomNavigationBarItem> items,
  void Function(int)? onTap,
  int currentIndex = 0,
  double? elevation,
  BottomNavigationBarType? type,
  Color? fixedColor,
  Color? backgroundColor,
  double iconSize = 24.0,
  Color? selectedItemColor,
  Color? unselectedItemColor,
  double selectedFontSize = 14.0,
  double unselectedFontSize = 12.0,
  TextStyle? selectedLabelStyle,
  TextStyle? unselectedLabelStyle,
  bool? showSelectedLabels,
  bool? showUnselectedLabels,
})
```
###  BottomNavigationBarItem
```
BottomNavigationBarItem({
  required Widget icon,
  Widget? title,
  String? label,
  Widget? activeIcon,
  Color? backgroundColor,
  String? tooltip,
})
```
###  BoxDecoration
```
BoxDecoration({
  Color? color,
  DecorationImage? image,
  BoxBorder? border,
  BorderRadiusGeometry? borderRadius,
  List<BoxShadow>? boxShadow,
  Gradient? gradient,
  BlendMode? backgroundBlendMode,
  BoxShape shape = BoxShape.rectangle,
})
```
### BoxConstraints
```
BoxConstraints({
  double minWidth = 0.0,
  double maxWidth = double.infinity,
  double minHeight = 0.0,
  double maxHeight = double.infinity,
})
或
BoxConstraints.loose(Size size)
BoxConstraints.tight(Size size)
BoxConstraints.expand({double? width, double? height})
```
###  BoxShadow
```
BoxShadow({
  Color color = const Color(0xFF000000),
  Offset offset = Offset.zero,
  double blurRadius = 0.0,
  double spreadRadius = 0.0,
})
```
### Center
```
Center({
  double? widthFactor,
  double? heightFactor,
  Widget? child,
})
```
###  Checkbox
```
Checkbox({
  required bool? value,
  required void Function(bool?)? onChanged,
  Color? activeColor,
  Color? checkColor,
  Color? focusColor,
  double? splashRadius,
  bool autofocus = false,
  OutlinedBorder? shape,
  BorderSide? side,
})
```
###  CircleBorder
```
CircleBorder({BorderSide side = BorderSide.none})
```
###  CircularProgressIndicator
```
CircularProgressIndicator({
  double? value,
  Color? backgroundColor,
  Color? color,
  double strokeWidth = 4.0,
})
```
###  ClipOval
```
ClipOval({
  Clip clipBehavior = Clip.antiAlias,
  Widget? child,
})
```
###  ClipPRect
```
ClipRRect({
  BorderRadius? borderRadius = BorderRadius.zero,
  Clip clipBehavior = Clip.antiAlias,
  Widget? child,
})
```
###  ClipRect
```
ClipRect({
  Clip clipBehavior = Clip.hardEdge,
  Widget? child,
})
```
###  Color
```
Color(int value) 
```
###  Colors
```
Colors.black
Colors.white
Colors.red
...
```
###  Column
```
Column({
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  TextDirection? textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
  TextBaseline? textBaseline,
  List<Widget> children = const <Widget>[],
})
```
### ConstrainedBox
```
ConstrainedBox({
  required BoxConstraints constraints,
  Widget? child,
})
```
###  Container
```
Container({
  AlignmentGeometry? alignment,
  EdgeInsetsGeometry? padding,
  Color? color,
  Decoration? decoration,
  Decoration? foregroundDecoration,
  double? width,
  double? height,
  BoxConstraints? constraints,
  EdgeInsetsGeometry? margin,
  Matrix4? transform,
  AlignmentGeometry? transformAlignment,
  Widget? child,
  Clip clipBehavior = Clip.none,
})
```
###  ContinuousRectangleBorder
```
ContinuousRectangleBorder ContinuousRectangleBorder({BorderSide side = BorderSide.none, BorderRadiusGeometry borderRadius = BorderRadius.zero})
```
###  CupertinoActivityIndicator
```
CupertinoActivityIndicator({
 . double radius = _kDefaultIndicatorRadius,
})
```
###  DateFormat
```
DateFormat(String pattern)
``` 
###  DatePicker
```
DatePicker({
  required String date,
  required dynamic Function(DateTime) onDateChanged,
  bool autoHide = true,
})
```
###  DateTime
```
DateTime.now();
DateTime(
  int year, [
  int month = 1,
  int day = 1,
  int hour = 0,
  int minute = 0,
  int second = 0,
  int millisecond = 0,
  int microsecond = 0,
]);
DateTime.utc(
  int year, [
  int month = 1,
  int day = 1,
  int hour = 0,
  int minute = 0,
  int second = 0,
  int millisecond = 0,
  int microsecond = 0,
]);
DateTime.parse(String formattedString);
```
###  DecorationImage
```
DecorationImage({
  required ImageProvider<Object> image,
  BoxFit? fit,
  AlignmentGeometry alignment = Alignment.center,
  ImageRepeat repeat = ImageRepeat.noRepeat,
  double scale = 1.0,
})
```
###  DefaultTabController
```
DefaultTabController({
  required int length,
  int initialIndex = 0,
  required Widget child,
})
```
###   DefaultTextStyle
```
DefaultTextStyle({
  required TextStyle style,
  TextAlign? textAlign,
  bool softWrap = true,
  TextOverflow overflow = TextOverflow.clip,
  int? maxLines,
  required Widget child,
})
```
###  Divider
```
Divider({
  double? height,
  double? thickness,
  double? indent,
  double? endIndent,
  Color? color,
})
```
###  DropdownButton
```
DropdownButton({
  required List<DropdownMenuItem<Object>>? items,
  List<Widget> Function(BuildContext)? selectedItemBuilder,
  Object? value,
  void Function(Object?)? onChanged,
  void Function()? onTap,
  int elevation = 8,
  TextStyle? style,
  Widget? underline,
  Widget? icon,
  Color? iconDisabledColor,
  Color? iconEnabledColor,
  double iconSize = 24.0,
  bool isDense = false,
  bool isExpanded = false,
  double? itemHeight = kMinInteractiveDimension,
  Color? focusColor,
  bool autofocus = false,
  Color? dropdownColor,
  double? menuMaxHeight,
  AlignmentGeometry alignment = AlignmentDirectional.centerStart,
  BorderRadius? borderRadius,
})
```
###  DropdownMenuItem
```
DropdownMenuItem({
  void Function()? onTap,
  Object? value,
  bool enabled = true,
  AlignmentGeometry alignment = AlignmentDirectional.centerStart,
  required Widget child,
})
```
###  ElevatedButton
```
ElevatedButton({
  required void Function()? onPressed,
  ButtonStyle? style,
  bool autofocus = false,
  required Widget? child,
})

定义按钮样式，如：
ElevatedButton.styleFrom({
  Color? primary,
  Color? onPrimary,
  Color? shadowColor,
  double? elevation,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
  Size? minimumSize,
  Size? fixedSize,
  Size? maximumSize,
  BorderSide? side,
  OutlinedBorder? shape,
  AlignmentGeometry? alignment,
})	

```
###  Expanded
```
 Expanded({
  int flex = 1,
  required Widget child,
})
```
### ExpansionTile
```
ExpansionTile({
  Widget? leading,
  required Widget title,
  Widget? subtitle,
  void Function(bool)? onExpansionChanged,
  List<Widget> children = const <Widget>[],
  Widget? trailing,
  bool initiallyExpanded = false,
  EdgeInsetsGeometry? tilePadding,
  CrossAxisAlignment? expandedCrossAxisAlignment,
  Alignment? expandedAlignment,
  EdgeInsetsGeometry? childrenPadding,
  Color? backgroundColor,
  Color? collapsedBackgroundColor,
  Color? textColor,
  Color? collapsedTextColor,
  Color? iconColor,
  Color? collapsedIconColor,
  ListTileControlAffinity? controlAffinity,
})
```
###  FittedBox
```
FittedBox({
  BoxFit fit = BoxFit.contain,
  AlignmentGeometry alignment = Alignment.center,
  Widget? child,
})
```

###  FloatingActionButton
```
FloatingActionButton({
  Widget? child,
  String? tooltip,
  Color? foregroundColor,
  Color? backgroundColor,
  Color? focusColor,
  Color? splashColor,
  double? elevation,
  double? focusElevation,
  double? hoverElevation,
  double? highlightElevation,
  double? disabledElevation,
  required void Function()? onPressed,
  bool mini = false,
  ShapeBorder? shape,
  Clip clipBehavior = Clip.none,
  bool autofocus = false,
  bool isExtended = false,
})
```
###  FloatingActionButtonLocation
```
FloatingActionButtonLocation.startTop
FloatingActionButtonLocation.centerDocked
FloatingActionButtonLocation.endFloat
FloatingActionButtonLocation.centerFloat
...
```
###  FontWeight
```
FontWeight.bold
...
```
###  Geolocator
```
Geolocator.checkPermission().then((LocationPermission permission){...})	
Geolocator.requestPermission().then((LocationPermission permission){...})	
Geolocator.getCurrentPosition().then((GeolocatorPosition position){...})	
```
###  GestureDetector
```
GestureDetector({
  Widget? child,
  void Function()? onTap,
  void Function()? onDoubleTap,
  void Function()? onLongPress,
})
```
###  Icon
```
Icon(
  IconData? icon, {
  double? size,
  Color? color,
})
```
###  IconButton
```
IconButton({
  double iconSize = 24.0,
  EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
  AlignmentGeometry alignment = Alignment.center,
  Color? color,
  Color? focusColor,
  Color? hoverColor,
  Color? highlightColor,
  Color? splashColor,
  Color? disabledColor,
  required void Function()? onPressed,
  bool autofocus = false,
  BoxConstraints? constraints,
  required Widget icon,
})	
```
###  Image
```
Image({
  required ImageProvider<Object> image,
  double? width,
  double? height,
  Color? color,
  BlendMode? colorBlendMode,
  BoxFit? fit,
  AlignmentGeometry alignment = Alignment.center,
  ImageRepeat repeat = ImageRepeat.noRepeat,
  bool matchTextDirection = false,
  bool isAntiAlias = false,
  FilterQuality filterQuality = FilterQuality.low,
})
或
Image.network(...)
Image.asset(...)
Image.memory(...)
```
###  ImagePicker
```
	ImagePicker()
```
###  InputDecoration
```
InputDecoration({
  Widget? icon,
  Widget? label,
  String? labelText,
  TextStyle? labelStyle,
  String? helperText,
  TextStyle? helperStyle,
  String? hintText,
  TextStyle? hintStyle,
  TextDirection? hintTextDirection,
  String? errorText,
  TextStyle? errorStyle,
  bool isCollapsed = false,
  bool? isDense,
  EdgeInsetsGeometry? contentPadding,
  Widget? prefixIcon,
  BoxConstraints? prefixIconConstraints,
  Widget? prefix,
  String? prefixText,
  TextStyle? prefixStyle,
  Widget? suffixIcon,
  Widget? suffix,
  String? suffixText,
  TextStyle? suffixStyle,
  BoxConstraints? suffixIconConstraints,
  Widget? counter,
  String? counterText,
  TextStyle? counterStyle,
  bool? filled,
  Color? fillColor,
  Color? focusColor,
  Color? hoverColor,
  InputBorder? errorBorder,
  InputBorder? focusedBorder,
  InputBorder? focusedErrorBorder,
  InputBorder? disabledBorder,
  InputBorder? enabledBorder,
  InputBorder? border,
  bool enabled = true,
  BoxConstraints? constraints,
})
```
###  JavascriptChannel
```
JavascriptChannel({
	required String name, 
	required void Function(JavascriptMessage) onMessageReceived
})
```
###  LinearGradient
```
LinearGradient({
  AlignmentGeometry begin = Alignment.centerLeft,
  AlignmentGeometry end = Alignment.centerRight,
  required List<Color> colors,
  List<double>? stops,
  TileMode tileMode = TileMode.clamp,
})
```
###  ListTile
```
ListTile({
  Widget? leading,
  Widget? title,
  Widget? subtitle,
  Widget? trailing,
  bool isThreeLine = false,
  bool? dense,
  ShapeBorder? shape,
  EdgeInsetsGeometry? contentPadding,
  bool enabled = true,
  void Function()? onTap,
  void Function()? onLongPress,
  bool selected = false,
  Color? focusColor,
  bool autofocus = false,
  Color? tileColor,
  Color? selectedTileColor,
  double? horizontalTitleGap,
  double? minVerticalPadding,
  double? minLeadingWidth,
})
```
###  ListView
```
ListView({
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  bool? primary,
  bool shrinkWrap = false,
  EdgeInsetsGeometry? padding,
  double? itemExtent,
  Widget? prototypeItem,
  double? cacheExtent,
  List<Widget> children = const <Widget>[],
})
也可以支持按需加载
ListView.builder({
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  bool? primary,
  bool shrinkWrap = false,
  EdgeInsetsGeometry? padding,
  double? itemExtent,
  Widget? prototypeItem,
  required Widget Function(BuildContext, int) itemBuilder,
  int? itemCount,
  double? cacheExtent,
})
或
ListView.separated({
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  bool? primary,
  bool shrinkWrap = false,
  EdgeInsetsGeometry? padding,
  required Widget Function(BuildContext, int) itemBuilder,
  required Widget Function(BuildContext, int) separatorBuilder,
  required int itemCount,
  double? cacheExtent,
})
```
###  Matrix4
```
Matrix4(
  double arg0,
  double arg1,
  double arg2,
  double arg3,
  double arg4,
  double arg5,
  double arg6,
  double arg7,
  double arg8,
  double arg9,
  double arg10,
  double arg11,
  double arg12,
  double arg13,
  double arg14,
  double arg15,
)
或
Matrix4.skew(double alpha, double beta);
Matrix4.skewX(double alpha);
Matrix4.skewY(double beta);
Matrix4.translationValues(
  double x,
  double y,
  double z,
);
Matrix4.rotationX(double radians);
Matrix4.rotationY(double radians);
Matrix4.rotationZ(double radians);
Matrix4.diagonal3Values(
  double x,
  double y,
  double z,
);
```
###  NetworkImage
```
NetworkImage(String url, {double scale})
```
###  Offset
```
Offset.zero  
Offset.infinit
Offset(double dx, double dy)
```
###  OutlinedButton
```
OutlinedButton({
  required void Function()? onPressed,
  ButtonStyle? style,
  bool autofocus = false,
  required Widget child,
})

定义按钮样式
OutlinedButton.styleFrom({
  Color? primary,
  Color? backgroundColor,
  Color? shadowColor,
  double? elevation,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
  Size? minimumSize,
  Size? fixedSize,
  Size? maximumSize,
  BorderSide? side,
  OutlinedBorder? shape,
  AlignmentGeometry? alignment,
})
```
###  OutlineInputBorder
```
OutlineInputBorder({
  BorderSide borderSide = const BorderSide(),
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  double gapPadding = 4.0,
})
```
###  Padding
```
Padding({
  required EdgeInsetsGeometry padding,
  Widget? child,
})
```
### PopupMenuButton
```
PopupMenuButton({
  required List<PopupMenuEntry<Object>> Function(BuildContext) itemBuilder,
  Object? initialValue,
  void Function(Object)? onSelected,
  String? tooltip,
  double? elevation,
  EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
  Widget? child,
  Widget? icon,
  double? iconSize,
  Offset offset = Offset.zero,
  bool enabled = true,
  ShapeBorder? shape,
  Color? color,
})
```
## PopupMenuFilter
```
PopupMenuFilter({
  Key? key,
  Object? initValue,
  void Function(Object?)? onSelected,
  double? elevation,
  EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  Widget? icon,
  Offset offset = Offset.zero,
  bool enabled = true,
  ShapeBorder? shape,
  Color? color,
  double? iconSize,
  BorderRadiusGeometry? borderRadius,
  required Widget child,
  required List<PopupMenuEntry<Object>> Function(BuildContext) itemBuilder,
})
```
### PopupMenuDivider
```
PopupMenuDivider({double height = 16.0})
```
### PopupMenuItem
```
PopupMenuItem({
  Object? value,
  void Function()? onTap,
  bool enabled = true,
  double height = kMinInteractiveDimension,
  EdgeInsets? padding,
  TextStyle? textStyle,
  required Widget? child,
})
```
### PopupMenuWrap
```
PopupMenuWrap({required Widget child})
```
###  Positioned
```
Positioned({
  double? left,
  double? top,
  double? right,
  double? bottom,
  double? width,
  double? height,
  required Widget child,
})
```
### Radio
```
Radio({
  required Object value,
  required Object? groupValue,
  required void Function(Object?)? onChanged,
  bool toggleable = false,
  Color? activeColor,
  Color? focusColor,
  double? splashRadius,
  bool autofocus = false,
})
```
###   RegExp
```
RegExp(
  String source, {
  bool multiLine = false,
  bool unicode = false,
  bool caseSensitive = true,
  bool dotAll = false,
})
例如:
var d = RegExp('(\\w+)');
print d.hasMatch('aaa');
var e = d.firstMatch('aaa');
print e[0];
var str = 'Parse my string';
var f = d.allMatches(str);
f.forEach((i){
	print i[0];
});
```
###   Row
```
Row({
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  TextDirection? textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
  TextBaseline? textBaseline,
  List<Widget> children = const <Widget>[],
})
```
###  RoundedRectangleBorder
```
RoundedRectangleBorder({BorderSide side = BorderSide.none, BorderRadiusGeometry borderRadius = BorderRadius.zero})
```
### SafeArea
```
SafeArea({
  bool left = true,
  bool top = true,
  bool right = true,
  bool bottom = true,
  EdgeInsets minimum = EdgeInsets.zero,
  bool maintainBottomViewPadding = false,
  required Widget child,
})
```
###  Scaffold
```
Scaffold({
  PreferredSizeWidget? appBar,
  Widget? body,
  Widget? floatingActionButton,
  FloatingActionButtonLocation? floatingActionButtonLocation,
  List<Widget>? persistentFooterButtons,
  Widget? bottomNavigationBar,
  Widget? bottomSheet,
  Color? backgroundColor,
  bool primary = true,
  bool extendBody = false,
  bool extendBodyBehindAppBar = false,
})
```
###  Shadow
```
Shadow({
  Color color = const Colors.black,
  Offset offset = Offset.zero,
  double blurRadius = 0.0,
})
```
### SimpleDialog
```
SimpleDialog({
  Widget? title,
  EdgeInsetsGeometry titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
  TextStyle? titleTextStyle,
  List<Widget>? children,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
})
```
### SingleChildScrollView
```
SingleChildScrollView({
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  EdgeInsetsGeometry? padding,
  bool? primary,
  Widget? child,
})
```
### Size
```
Size(double width, double height)
或
Size.fromHeight(double height);
Size.fromWidth(double width);
Size.fromRadius(double radius);
Size.square(double dimension);
```
### SizedBox
```
SizedBox({
  double? width,
  double? height,
  Widget? child,
})
```
### Slider
```
Slider({
  required double value,
  required void Function(double)? onChanged,
  double min = 0.0,
  double max = 1.0,
  int? divisions,
  String? label,
  Color? activeColor,
  Color? inactiveColor,
  Color? thumbColor,
  bool autofocus = false,
})
```
###  SnackBar
```
SnackBar({
  required Widget content,
  Color? backgroundColor,
  double? elevation,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  double? width,
  ShapeBorder? shape,
  SnackBarAction? action,
  DismissDirection dismissDirection = DismissDirection.down,
})
```
### SnackBarAction
```
SnackBarAction({
  Color? textColor,
  Color? disabledTextColor,
  required String label,
  required void Function() onPressed,
})
```
###  Stack
```
Stack({
  AlignmentGeometry alignment = AlignmentDirectional.topStart,
  TextDirection? textDirection,
  StackFit fit = StackFit.loose,
  Clip clipBehavior = Clip.hardEdge,
  List<Widget> children = const <Widget>[],
})
```
###  StadiumBorder
```
StadiumBorder({BorderSide side = BorderSide.none})
```
### Switch
```
Switch({
  required bool value,
  required void Function(bool)? onChanged,
  Color? activeColor,
  Color? activeTrackColor,
  Color? inactiveThumbColor,
  Color? inactiveTrackColor,
  double? splashRadius,
  bool autofocus = false,
})

也可以采用iOS风格
Switch.adaptive({
  required bool value,
  required void Function(bool)? onChanged,
  Color? activeColor,
  Color? activeTrackColor,
  Color? inactiveThumbColor,
  Color? inactiveTrackColor,
  double? splashRadius,
  bool autofocus = false,
})
```
###  Tab
```
Tab({
  String? text,
  Widget? icon,
  EdgeInsetsGeometry iconMargin = const EdgeInsets.only(bottom: 10.0),
  double? height,
  Widget? child,
})
```
###  TabBar
```
TabBar({
  required List<Widget> tabs,
  bool isScrollable = false,
  EdgeInsetsGeometry? padding,
  Color? indicatorColor,
  bool automaticIndicatorColorAdjustment = true,
  double indicatorWeight = 2.0,
  EdgeInsetsGeometry indicatorPadding = EdgeInsets.zero,
  Decoration? indicator,
  TabBarIndicatorSize? indicatorSize,
  Color? labelColor,
  TextStyle? labelStyle,
  EdgeInsetsGeometry? labelPadding,
  Color? unselectedLabelColor,
  TextStyle? unselectedLabelStyle,
  void Function(int)? onTap,
})
```
###  TabBarView
```
TabBarView({
  required List<Widget> children,
  DragStartBehavior dragStartBehavior = DragStartBehavior.start,
})
```
###  Text
```
Text(String data, {
  TextStyle? style,
  TextAlign? textAlign,
  TextDirection? textDirection,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  int? maxLines,
})
```
###  TextAlignVertical
```
TextAlignVertical({required double y})
或
TextAlignVertical.bottom
TextAlignVertical.center
TextAlignVertical.top
```
###  TextButton
```
TextButton({
  required void Function()? onPressed,
  ButtonStyle? style,
  bool autofocus = false,
  required Widget child,
})

定义按钮样式：
TextButton.styleFrom({
  Color? primary,
  Color? backgroundColor,
  Color? shadowColor,
  double? elevation,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
  Size? minimumSize,
  Size? fixedSize,
  Size? maximumSize,
  BorderSide? side,
  OutlinedBorder? shape,
  AlignmentGeometry? alignment,
})
```
### TextEditingController
```
```
###  TextEditingController
```
TextEditingController(String? initText)
例子：
var textEditingController = TextEditingController();
textEditingController.text = "text";
也可以创建时指定初始值
var textEditingController = TextEditingController("text");

清除内容
textEditingController.clear();
或
textEditingController.text = "";
```
###  TextField
```
TextField({
  TextEditingController? controller,
  InputDecoration? decoration = const InputDecoration(),
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextStyle? style,
  TextAlign textAlign = TextAlign.start,
  TextAlignVertical? textAlignVertical,
  TextDirection? textDirection,
  bool readOnly = false,
  bool? showCursor,
  bool autofocus = false,
  String obscuringCharacter = '•',
  bool obscureText = false,
  bool autocorrect = true,
  int? maxLines = 1,
  int? minLines,
  bool expands = false,
  int? maxLength,
  void Function(String)? onChanged,
  bool? enabled,
  double cursorWidth = 2.0,
  double? cursorHeight,
  Radius? cursorRadius,
  Color? cursorColor,
})
```
###  TextInputType
```
TextInputType.datetime
TextInputType.text
TextInputType.url
...
```
###  TextStyle
```
TextStyle({
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  List<Shadow>? shadows,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  TextOverflow? overflow,
})
```
###  Transform
```
Transform({
  required Matrix4 transform,
  Offset? origin,
  AlignmentGeometry? alignment,
  FilterQuality? filterQuality,
  Widget? child,
})
或
Transform.rotate({
  required double angle,
  Offset? origin,
  AlignmentGeometry? alignment = Alignment.center,
  FilterQuality? filterQuality,
  Widget? child,
});
Transform.scale({
  required double scale,
  Offset? origin,
  AlignmentGeometry? alignment = Alignment.center,
  FilterQuality? filterQuality,
  Widget? child,
});
Transform.translate({
  required Offset offset,
  FilterQuality? filterQuality,
  Widget? child,
})
```
###  Uri
```
Uri({
  String? scheme,
  String? host,
  int? port,
  String? path,
  String? query,
  Map<String, dynamic>? queryParameters,
  String? fragment,
})
```
###  UnderlineInputBorder
```
UnderlineInputBorder({BorderSide borderSide = const BorderSide(), BorderRadius borderRadius = const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))})
```
###  Wrap
```
Wrap({
  Axis direction = Axis.horizontal,
  WrapAlignment alignment = WrapAlignment.start,
  double spacing = 0.0,
  WrapAlignment runAlignment = WrapAlignment.start,
  double runSpacing = 0.0,
  WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
  TextDirection? textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
  List<Widget> children = const <Widget>[],
})
```
 
## 3. 全局函数
### getViewSize
```
getViewSize(BuildContext context)
例如:
var size = getViewSize(context);
print size.width;
print size.height;
```
###  launchUrl 
```
launchUrl(
  Uri url, {
  LaunchMode mode = LaunchMode.platformDefault,
})
```
### setState
```
setState(() {...});
这个无需多说，刷新页面用
```
### showSnackBar
```
showSackBar(BuildContext context, SnackBar snackBar)
```
### showDialog
```
showDialog({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  bool useSafeArea = true,
  bool useRootNavigator = true,
})
```
### showModalBottomSheet
```
showModalBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  Color? barrierColor,
  bool isDismissible = true,
  ShapeBorder? shape,
  BoxConstraints? constraints,
})
```
