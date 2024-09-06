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
* AxisDirection
* Border
* BoxFit
* BorderRadius
* BorderStyle
* Colors
* CrossAxisAlignment
* EdgeInsets
* FontWeight
* Icons
* MainAxisAlignment
* Matrix4
* Navigator
* Radius
* SnackBarBehavior
* StackFit
* TabBarIndicatorSize
* TextAlign
* TextInputType
* TextDirection
* WrapAlignment

## 2. 组件及其用法

*  AlertDialog
*  Align
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
*  AppBar
###  AssetImage
```
AssetImage(String assetName)
```
*  BeveledRectangleBorder
*  BorderSide
*  BottomNavigationBar
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
*  BoxDecoration
*  BoxShadow
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
*  CircleBorder
*  CircularProgressIndicator
*  ClipOval
*  ClipPRect
*  ClipRect
###  Color
```
Color(int value) 
```
*  Column
*  Container

###  CircularProgressIndicator

```
CircularProgressIndicator({
  double? value,
  Color? backgroundColor,
  Color? color,
  double strokeWidth = 4.0,
})
```
*  ContinuousRectangleBorder
###  CupertinoActivityIndicator
```
CupertinoActivityIndicator({
 . double radius = _kDefaultIndicatorRadius,
})
```
*  DefaultTabController
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
*  Expanded
*  FloatingActionButton
*  GestureDetector
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
```
*  InputDecoration
*  LinearGradient
*  ListTile
*  ListView
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
*  OutlineInputBorder
*  Padding
*  Positioned
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
*  Row
*  RoundedRectangleBorder
*  Scaffold
###  Size
```
Size(double dx,double dy)
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
*  SnackBar
*  SingleChildScrollView
###  TextEditingController
```
var textEditingController = TextEditingController();
textEditingController.text = "text";
也可以创建时指定初始值
var textEditingController = TextEditingController("text");

清除内容
textEditingController.clear();
或
textEditingController.text = "";
```
*  Stack
*  StadiumBorder
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
*  Tab
*  TabBar
*  TabBarView
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
*  TextStyle
###  Uri
```
Uri({
  String? scheme,
  String? host,
  String? port,
  String? path,
  String? query,
  String? queryParameters,
  String? fragment,
})
```
*  UnderlineInputBorder
*  Wrap
 
## 3. 全局函数

### DateFormat
```
String dateStr = DateFormat("yyyy-MM-dd").format(DateTime.now())
```
### DateTime
```
DateTime(
  int year, [
  int month = 1,
  int day = 1,
  int hour = 0,
  int minute = 0,
  int second = 0,
  int millisecond = 0,
  int microsecond = 0,
])

DateTime.now();
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

### setState
```
setState(() {...});
这个无需多说，刷新页面用
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
### RegExp
```
RegExp(
  String source, {
  bool multiLine = false,
  bool caseSensitive = true,
  bool unicode = false,
  bool dotAll = false,
})

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