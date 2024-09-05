import 'package:dax/runtime_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dax/dax.dart';
import 'base.dart';
import 'icon.dart';
import 'common.dart';
import 'basic.dart';
import 'decoration.dart';
import 'edgeinsets.dart';
import 'layout.dart';
import 'scroll.dart';
import 'container.dart';
import 'popup.dart';

bool isApiRegistered = false;

class LoadingPage extends StatelessWidget {
  final String msg;
  const LoadingPage({Key? key, required this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading')),
      body: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  final String errMsg;
  const ErrorPage({Key? key, required this.errMsg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bgColor = const Color(0xff0278d7);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
        title: const Text("Error happened"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ":(",
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            Text(
              errMsg,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class DaxPage extends StatefulWidget {
  const DaxPage(this.codeSnap, {Key? key}) : super(key: key);
  final String codeSnap;

  @override
  State<DaxPage> createState() => _DaxPageState();
}

class _DaxPageState extends State<DaxPage> {
  Widget? renderedWidget;
  Interpreter interpreter = Interpreter();
  bool hasInitialized = false;
  @override
  void initState() {
    super.initState();
    if (!isApiRegistered) {
      registerGlobalFunctions();
      isApiRegistered = true;
    }
    interpreter.registerLocal("context", context);
    interpreter.registerLocal(
        "getDeviceWidth",
        GenericLoxCallable(() => 0, (Interpreter interpreter,
            List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
          return MediaQuery.of(context).size.width;
        }));
    interpreter.registerLocal(
        "showSnackBar",
        GenericLoxCallable(() => 1, (Interpreter interpreter,
            List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
          ScaffoldMessenger.of(context)
              .showSnackBar(arguments.first as SnackBar);
        }));
    interpreter.registerLocal(
        "setState",
        GenericLoxCallable(() => 1, (Interpreter interpreter,
            List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
          (arguments.first as LoxFunction).call(interpreter, [], {});
          updateUI();
        }));
    Scanner scanner = Scanner(widget.codeSnap);
    try {
      List<Token> tokens = scanner.scanTokens();
      Parser parser = Parser(tokens);
      List<Stmt> statements = parser.parse();
      Resolver resolver = Resolver(interpreter);
      resolver.resolve(statements);
      interpreter.interpret(statements);
      interpreter.invokeFunction('initState');
      // var renderedResult = interpreter.getRenderedWidget();
      // if (renderedResult != null) {
      //   renderedWidget = renderedResult as Widget;
      // }
    } on Exception catch (e) {
      if (e is ParseError) {
        renderedWidget = ErrorPage(errMsg: e.message);
      } else if (e is RuntimeError) {
        renderedWidget = ErrorPage(errMsg: e.message);
      } else {
        renderedWidget = ErrorPage(errMsg: e.toString());
      }
    }
  }

  void updateUI() {
    if (!mounted) return;
    final renderResult = interpreter.invokeFunction('build');
    setState(() {
      renderedWidget = renderResult as Widget;
    });
  }

  void registerGlobalFunctions() {
    interpreter.registerGlobal("AlignmentDirectional", alignmentDirectionalMap);
    interpreter.registerGlobal("Api", apiMap);
    interpreter.registerGlobal("Axis", axisMap);
    interpreter.registerGlobal("AxisDirection", axisDirectionMap);
    interpreter.registerGlobal("Border", borderMap);
    interpreter.registerGlobal("BoxFit", boxFitMap);
    interpreter.registerGlobal("BorderRadius", borderRadiusMap);
    interpreter.registerGlobal("BorderStyle", borderStyleMap);
    interpreter.registerGlobal("Colors", colorMap);
    interpreter.registerGlobal("CrossAxisAlignment", crossAxisAlignmentMap);
    interpreter.registerGlobal("EdgeInsets", edgeInsetsMap);
    interpreter.registerGlobal("FontWeight", fontWeightMap);
    interpreter.registerGlobal("Icons", iconMap);
    interpreter.registerGlobal("json", jsonMap);
    interpreter.registerGlobal(
        "ListTileControlAffinity", listTileControlAffinityMap);
    interpreter.registerGlobal("MainAxisAlignment", mainAxisAlignmentMap);
    interpreter.registerGlobal("Math", mathMap);
    interpreter.registerGlobal("Matrix4", matrix4Map);
    interpreter.registerGlobal("Navigator", navigatorMap);
    interpreter.registerGlobal("Radius", radiusMap);
    interpreter.registerGlobal("SnackBarBehavior", snackBarBehaviorMap);
    interpreter.registerGlobal("StackFit", stackFitMap);
    interpreter.registerGlobal("TabBarIndicatorSize", tabBarIndicatorSizeMap);
    interpreter.registerGlobal("TextAlign", textAlignMap);
    interpreter.registerGlobal("TextInputType", textInputTypeMap);
    interpreter.registerGlobal("TextDirection", textDirectionMap);
    interpreter.registerGlobal("Transform", transformMap);
    interpreter.registerGlobal("WrapAlignment", wrapAlignmentMap);

    interpreter.registerGlobal("AlertDialog", IAlertDialog());
    interpreter.registerGlobal("Align", IAlign());
    interpreter.registerGlobal("Alignment", IAlignment());
    interpreter.registerGlobal("AppBar", IAppBar());
    interpreter.registerGlobal("AssetImage", IAssetImage());
    interpreter.registerGlobal(
        "BeveledRectangleBorder", IBeveledRectangleBorder());
    interpreter.registerGlobal("BorderSide", IBorderSide());
    interpreter.registerGlobal("BottomNavigationBar", IBottomNavigationBar());
    interpreter.registerGlobal(
        "BottomNavigationBarItem", IBottomNavigationBarItem());
    interpreter.registerGlobal("BoxDecoration", IBoxDecoration());
    interpreter.registerGlobal("BoxConstraints", IBoxConstraints());
    interpreter.registerGlobal("BoxShadow", IBoxShadow());
    interpreter.registerGlobal("Center", ICenter());
    interpreter.registerGlobal("Checkbox", ICheckbox());
    interpreter.registerGlobal("CircleBorder", ICircleBorder());
    interpreter.registerGlobal(
        "CircularProgressIndicator", ICircularProgressIndicator());
    interpreter.registerGlobal("ClipOval", IClipOval());
    interpreter.registerGlobal("ClipRRect", IClipRRect());
    interpreter.registerGlobal("ClipRect", IClipRect());
    interpreter.registerGlobal("Color", IColor());
    interpreter.registerGlobal("Column", IColumn());
    interpreter.registerGlobal("ConstrainedBox", IConstrainedBox());
    interpreter.registerGlobal("Container", IContainer());
    interpreter.registerGlobal(
        "ContinuousRectangleBorder", IContinuousRectangleBorder());
    interpreter.registerGlobal(
        "CupertinoActivityIndicator", ICupertinoActivityIndicator());
    interpreter.registerGlobal("DateFormat", IDateFormat());
    interpreter.registerGlobal("DateTime", IDateTime());
    interpreter.registerGlobal("DatePicker", IDatePicker());
    interpreter.registerGlobal("DefaultTabController", IDefaultTabController());
    interpreter.registerGlobal("DefaultTextStyle", IDefaultTextStyle());
    interpreter.registerGlobal("Divider", IDivider());
    interpreter.registerGlobal("DropdownButton", IDropdownButton());
    interpreter.registerGlobal("DropdownAnimated", IDropdownAnimated());
    interpreter.registerGlobal("DropdownMenuItem", IDropdownMenuItem());
    interpreter.registerGlobal("ElevatedButton", IElevatedButton());
    interpreter.registerGlobal("Expanded", IExpanded());
    interpreter.registerGlobal("ExpansionTile", IExpansionTile());
    interpreter.registerGlobal("FloatingActionButton", IFloatingActionButton());
    interpreter.registerGlobal("GestureDetector", IGestureDetector());
    interpreter.registerGlobal("Icon", IIcon());
    interpreter.registerGlobal("IconButton", IIconButton());
    interpreter.registerGlobal("Image", IImage());
    interpreter.registerGlobal("InputDecoration", IInputDecoration());
    interpreter.registerGlobal("LinearGradient", ILinearGradient());
    interpreter.registerGlobal("ListTile", IListTile());
    interpreter.registerGlobal("ListView", IListView());
    interpreter.registerGlobal("NetworkImage", INetworkImage());
    interpreter.registerGlobal("Offset", IOffset());
    interpreter.registerGlobal("OutlinedButton", IOutlinedButton());
    interpreter.registerGlobal("OutlineInputBorder", IOutlineInputBorder());
    interpreter.registerGlobal("Padding", IPadding());
    interpreter.registerGlobal("PopupMenuButton", IPopupMenuButton());
    interpreter.registerGlobal("PopupMenuDivider", IPopupMenuDivider());
    interpreter.registerGlobal("PopupMenuItem", IPopupMenuItem());
    interpreter.registerGlobal("PopupMenuWrap", IPopupMenuWrap());
    interpreter.registerGlobal("Positioned", IPositioned());
    interpreter.registerGlobal("Radio", IRadio());
    interpreter.registerGlobal("RegExp", IRegExp());
    interpreter.registerGlobal("Row", IRow());
    interpreter.registerGlobal(
        "RoundedRectangleBorder", IRoundedRectangleBorder());
    interpreter.registerGlobal("SafeArea", ISafeArea());
    interpreter.registerGlobal("Scaffold", IScaffold());
    interpreter.registerGlobal("SimpleDialog", ISimpleDialog());
    interpreter.registerGlobal("Size", ISize());
    interpreter.registerGlobal("SizedBox", ISizedBox());
    interpreter.registerGlobal("Slider", ISlider());
    interpreter.registerGlobal("SnackBar", ISnackBar());
    interpreter.registerGlobal(
        "SingleChildScrollView", ISingleChildScrollView());
    interpreter.registerGlobal(
        "TextEditingController", ITextEditingController());
    interpreter.registerGlobal("Stack", IStack());
    interpreter.registerGlobal("StadiumBorder", IStadiumBorder());
    interpreter.registerGlobal("Switch", ISwitch());
    interpreter.registerGlobal("showDialog", IShowDialog());
    interpreter.registerGlobal("showModalBottomSheet", IShowModalBottomSheet());
    interpreter.registerGlobal("Tab", ITab());
    interpreter.registerGlobal("TabBar", ITabBar());
    interpreter.registerGlobal("TabBarView", ITabBarView());
    interpreter.registerGlobal("Text", IText());
    interpreter.registerGlobal("TextButton", ITextButton());
    interpreter.registerGlobal("TextField", ITextField());
    interpreter.registerGlobal("TextStyle", ITextStyle());
    interpreter.registerGlobal("Uri", IUri());
    interpreter.registerGlobal("UnderlineInputBorder", IUnderlineInputBorder());
    interpreter.registerGlobal("Wrap", IWrap());
  }

  @override
  Widget build(BuildContext context) {
    if (!hasInitialized) {
      hasInitialized = true;
      if (renderedWidget != null) return renderedWidget!;
      try {
        var r = interpreter.invokeFunction('build');
        if (r != null) return r as Widget;
        return const ErrorPage(
          errMsg: "No build function found",
        );
      } on RuntimeError catch (e) {
        return ErrorPage(errMsg: e.message);
      } catch (e) {
        return ErrorPage(
          errMsg: e.toString(),
        );
      }
    }
    return renderedWidget!;
  }
}
