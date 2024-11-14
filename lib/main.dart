import 'package:dax/runtime_error.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dax/dax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'base.dart';
import 'icon.dart';
import 'common.dart';
import 'basic.dart';
import 'decoration.dart';
import 'enum.dart';
import 'layout.dart';
import 'scroll.dart';
import 'container.dart';
import 'popup.dart';
import 'webview.dart';
import 'http.dart';
import 'imagepicker.dart';
import 'shared_preference.dart';

bool _isApiRegistered = false;

class ErrorPage extends StatelessWidget {
  final String errMsg;
  final bgColor = const Color(0xff0278d7);
  const ErrorPage({Key? key, required this.errMsg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
        title: const Text("出错啦!"),
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

class DaxStatelessWidget extends StatelessWidget {
  const DaxStatelessWidget(
      {Key? key,
      required this.klass,
      required this.interpreter,
      required this.arguments,
      required this.namedArguments})
      : super(key: key);
  final LoxClass klass;
  final Interpreter interpreter;
  final List<Object?> arguments;
  final Map<Symbol, Object?> namedArguments;

  @override
  Widget build(BuildContext context) {
    LoxFunction? method = klass.findMethod('build');
    if (method == null) {
      return Container();
    }
    LoxInstance instance = LoxInstance(klass);
    LoxFunction? initializer = klass.findMethod(klass.name); // init
    if (initializer != null) {
      initializer.bind(instance).call(interpreter, arguments, namedArguments);
    }
    return method.bind(instance).call(interpreter, [], {}) as Widget;
  }
}

class DaxStatefulWidget extends StatefulWidget {
  const DaxStatefulWidget(
      {Key? key,
      required this.klass,
      required this.interpreter,
      required this.arguments,
      required this.namedArguments})
      : super(key: key);
  final LoxClass klass;
  final Interpreter interpreter;
  final List<Object?> arguments;
  final Map<Symbol, Object?> namedArguments;
  @override
  State<DaxStatefulWidget> createState() => _DaxStatefulWidgetState();
}

class _DaxStatefulWidgetState extends State<DaxStatefulWidget>
    with AutomaticKeepAliveClientMixin {
  Widget? renderedWidget;
  LoxFunction? buildMethod;
  Interpreter interpreter = Interpreter();
  LoxInstance? instance;
  _DaxStatefulWidgetState();

  @override
  void didUpdateWidget(DaxStatefulWidget old) {
    super.didUpdateWidget(old);
    if (widget.arguments.toString() != old.arguments.toString() ||
        widget.namedArguments.values.toString() !=
            old.namedArguments.values.toString()) {
      find(widget.klass.name)
          ?.call(interpreter, widget.arguments, widget.namedArguments);
      updateUI();
    }
  }

  LoxFunction? find(String functionName) {
    return widget.klass.findMethod(functionName)?.bind(instance!);
  }

  @override
  void dispose() {
    super.dispose();
    find('dispose')?.call(interpreter, [], {});
  }

  @override
  void initState() {
    super.initState();
    LoxFunction? method = widget.klass.findMethod('build');
    if (method == null) {
      return;
    }
    instance = LoxInstance(widget.klass);
    instance!.setField(
        'setState',
        GenericLoxCallable(() => 1, (Interpreter interpreter,
            List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
          (arguments.first as LoxFunction).call(interpreter, [], {});
          updateUI();
        }));
    buildMethod = method.bind(instance!);
    interpreter.environment = buildMethod!.closure;
    interpreter.locals = widget.interpreter.locals;
    interpreter.globals = Environment(widget.interpreter.globals);
    find(widget.klass.name)
        ?.call(interpreter, widget.arguments, widget.namedArguments);
    // interpreter.registerLocal("context", context);
    // interpreter.registerLocal(
    //     "setState",
    //     GenericLoxCallable(() => 1, (Interpreter interpreter,
    //         List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
    //       (arguments.first as LoxFunction).call(interpreter, [], {});
    //       updateUI();
    //     }));
    find('initState')?.call(interpreter, [], {});
    renderedWidget = buildMethod!.call(interpreter, [], {}) as Widget;
  }

  void updateUI() {
    if (!mounted) return;
    var renderResult = buildMethod!.call(interpreter, [], {});
    setState(() {
      renderedWidget = renderResult as Widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return renderedWidget ?? Container();
  }

  @override
  bool get wantKeepAlive =>
      widget.klass.findMethod('wantKeepAlive')?.call(interpreter, [], {})
          as bool? ??
      false;
}

class NewLoxReader extends LoxReader {
  final String url;
  NewLoxReader(this.url) : super(url);
  @override
  Future<String> read() async {
    if (pathOrUrl.startsWith("http")) {
      var prefs = await SharedPreferences.getInstance();
      Map<String, String> headers = {
        'If-Modified-Since': prefs.getString(pathOrUrl + '_Last-Modified') ?? ''
      };
      var jwt = prefs.getString("jwt") ?? prefs.getString("idtoken") ?? '';
      var sid = prefs.getString("sid") ?? '';
      var q = sid.isEmpty ? '' : '?sid=$sid';
      headers.addAll({'Authorization': 'Bearer $jwt'});
      var response = await http.get(Uri.parse(pathOrUrl + q), headers: headers);
      if (response.statusCode > 299) {
        if (response.statusCode == 304) {
          return prefs.getString(pathOrUrl) ?? '';
        }
        return "fun build(){return Center(child: Text(\"${response.body}\"));}";
      }
      if (response.headers['last-modified'] != null) {
        prefs.setString(pathOrUrl, response.body);
        prefs.setString(
            pathOrUrl + '_Last-Modified', response.headers['last-modified']!);
      }
      return response.body;
    }
    return Future.value(
        "fun build(){return Center(child: Text(\"invalid url\"));}");
  }
}

mixin Logger<T extends StatefulWidget> on State<T> {
  String url =
      'https://www-as.gzuni.com/apps/locomobile/sbox/gzapp-new/fn/fn51_1';
  String? pageId;
  void saveLogWhenInitializing() {
    if (pageId == null || pageId!.isEmpty) return;
    Api.post(url, body: {'pageId': pageId}).then((result) {
      logger.d('save : $result');
    });
  }

  @override
  void initState() {
    saveLogWhenInitializing();
    super.initState();
  }
}

class DaxPage extends StatefulWidget {
  const DaxPage({Key? key, required this.args}) : super(key: key);
  final Map<String, dynamic> args;
  @override
  State<DaxPage> createState() => _DaxPageState();
}

class _DaxPageState extends State<DaxPage> with Logger {
  Widget? renderedWidget;
  bool hasInitialized = false;
  bool loaded = false;
  Interpreter interpreter = Interpreter();

  void run() async {
    NewLoxReader? reader;
    if (widget.args.containsKey('url')) {
      reader = NewLoxReader(widget.args['url']);
    }
    Scanner scanner =
        Scanner(widget.args['snap'] ?? '', reader: reader, loadedFiles: []);
    try {
      List<Token> tokens = await scanner.scanTokens();
      setState(() {
        loaded = true;
      });
      Parser parser = Parser(tokens);
      List<Stmt> statements = parser.parse();
      Resolver resolver = Resolver(interpreter);
      resolver.resolve(statements);
      interpreter.interpret(statements);
      interpreter.invokeFunction('initState');
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

  @override
  void dispose() {
    super.dispose();
    interpreter.invokeFunction('dispose');
  }

  void registerContext() {
    interpreter.registerLocal("context", context);
    interpreter.registerLocal(
        "setState",
        GenericLoxCallable(() => 1, (Interpreter interpreter,
            List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
          (arguments.first as LoxFunction).call(interpreter, [], {});
          updateUI();
        }));
  }

  @override
  void initState() {
    if (widget.args.containsKey('url')) {
      pageId = Uri.parse(widget.args['url']).path;
    }
    if (widget.args.containsKey('logger')) {
      url = widget.args['logger'];
    }
    super.initState();
    if (!_isApiRegistered) {
      _registerGlobalFunctions();
      _isApiRegistered = true;
    }
    registerContext();
    interpreter.registerLocal('Navigator', {
      "canPop": (Object? context) {
        return Navigator.canPop(context as BuildContext);
      },
      "pop": (Object? context) {
        Navigator.pop(context as BuildContext);
      },
      "push": (Object? context, Object? route) async {
        await Navigator.push(context as BuildContext, route as Route);
        interpreter.registerLocal("context", context);
      },
      "pushNamed": (Object? context, Object? routeName,
          {Object? arguments}) async {
        await Navigator.pushNamed(context as BuildContext, routeName as String,
            arguments: arguments);
        interpreter.registerLocal("context", context);
      },
      "pushReplacement": (Object? context, Object? route) async {
        await Navigator.pushReplacement(
            context as BuildContext, route as Route);
        interpreter.registerLocal("context", context);
      },
    });
    run();
  }

  void updateUI() {
    if (!mounted) return;
    final renderResult = interpreter.invokeFunction('build');
    setState(() {
      renderedWidget = renderResult as Widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) return const Scaffold();
    if (!hasInitialized) {
      hasInitialized = true;
      if (renderedWidget != null) return renderedWidget!;
      try {
        var widget = interpreter.invokeFunction('build');
        if (widget != null) return widget as Widget;
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

void _registerGlobalFunctions() {
  top.define("StatefulWidget", LoxClass("StatefulWidget", null, {}));
  top.define("StatelessWidget", LoxClass("StatelessWidget", null, {}));
  top.define("DaxStatefulWidget", IDaxStatefulWidget());
  top.define("DaxStatelessWidget", IDaxStatelessWidget());
  top.define("Api", apiMap);
  top.define("Axis", axisMap);
  top.define("AxisDirection", axisDirectionMap);
  top.define("base64", base64Map);
  top.define("BlendMode", blendModeMap);
  top.define("BoxFit", boxFitMap);
  top.define("BoxShape", boxShapeMap);
  top.define("BorderRadius", borderRadiusMap);
  top.define("BorderStyle", borderStyleMap);
  top.define("Clip", clipBehaviorMap);
  top.define("Clipboard", clipboardMap);
  top.define("ConnectionState", connectionStateMap);
  top.define("CrossAxisAlignment", crossAxisAlignmentMap);
  top.define("DismissDirection", dismissDirectionMap);
  top.define("double", doubleMap);
  top.define("DragStartBehavior", dragStartBehaviorMap);
  top.define("EdgeInsets", edgeInsetsMap);
  top.define("FilterQuality", filterQualityMap);
  top.define("FontStyle", fontStyleMap);
  top.define("http", httpMap);
  top.define("Icons", iconsMap);
  top.define("ImageRepeat", imageRepeatMap);
  top.define("ImageSource", imageSourceMap);
  top.define("int", intMap);
  top.define("kIsWeb", kIsWeb);
  top.define("JavascriptMode", javascriptModeMap);
  top.define("json", jsonMap);
  top.define("LaunchMode", launchModeMap);
  top.define("ListTileControlAffinity", listTileControlAffinityMap);
  top.define("LocationPermission", locationPermissionMap);
  top.define("MainAxisAlignment", mainAxisAlignmentMap);
  top.define("MainAxisSize", mainAxisSizeMap);
  top.define("math", mathMap);
  top.define("OpenFile", openFileMap);
  top.define("path", pathMap);
  if (!kIsWeb) {
    top.define("Platform", platformMap);
  }
  top.define("Radius", radiusMap);
  top.define("SnackBarBehavior", snackBarBehaviorMap);
  top.define("StackFit", stackFitMap);
  top.define("TabBarIndicatorSize", tabBarIndicatorSizeMap);
  top.define("TableCellVerticalAlignment", tableCellVerticalAlignmentMap);
  top.define("TextAlign", textAlignMap);
  top.define("TextBaseline", textBaselineMap);
  top.define("TextCapitalization", textCapitalizationMap);
  top.define("TextDecorationStyle", textDecorationStyleMap);
  top.define("TextInputAction", textInputActionMap);
  top.define("TextDirection", textDirectionMap);
  top.define("TextOverflow", textOverflowMap);
  top.define("TileMode", tileModeMap);
  top.define("VerticalDirection", verticalDirectionMap);
  top.define("WrapAlignment", wrapAlignmentMap);
  top.define("WrapCrossAlignment", wrapCrossAlignmentMap);
  ////  regist global functions and classes
  top.define("AlertDialog", IAlertDialog());
  top.define("Align", IAlign());
  top.define("Alignment", IAlignment());
  top.define("AlignmentDirectional", IAlignmentDirectional());
  top.define("AppBar", IAppBar());
  top.define("AssetImage", IAssetImage());
  top.define("BackButton", IBackButton());
  top.define("BeveledRectangleBorder", IBeveledRectangleBorder());
  top.define("Border", IBorder());
  top.define("BorderSide", IBorderSide());
  top.define("BottomNavigationBar", IBottomNavigationBar());
  top.define("BottomNavigationBarItem", IBottomNavigationBarItem());
  top.define("BoxDecoration", IBoxDecoration());
  top.define("BoxConstraints", IBoxConstraints());
  top.define("BoxShadow", IBoxShadow());
  top.define("Center", ICenter());
  top.define("ChartBar", IChartBar());
  top.define("ChartLine", IChartLine());
  top.define("ChartPie", IChartPie());
  top.define("Checkbox", ICheckbox());
  top.define("CircleBorder", ICircleBorder());
  top.define("CircularProgressIndicator", ICircularProgressIndicator());
  top.define("ClipboardData", IClipboardData());
  top.define("ClipOval", IClipOval());
  top.define("ClipRRect", IClipRRect());
  top.define("ClipRect", IClipRect());
  top.define("Color", IColor());
  top.define("Colors", IColors());
  top.define("Column", IColumn());
  top.define("ConstrainedBox", IConstrainedBox());
  top.define("Container", IContainer());
  top.define("ContinuousRectangleBorder", IContinuousRectangleBorder());
  top.define("CupertinoActivityIndicator", ICupertinoActivityIndicator());
  top.define("CustomFloatingActionButtonLocation",
      ICustomFloatingActionButtonLocation());
  top.define("DateFormat", IDateFormat());
  top.define("DatePicker", IDatePicker());
  top.define("DateTime", IDateTime());
  top.define("DecorationImage", IDecorationImage());
  top.define("DefaultTabController", IDefaultTabController());
  top.define("DefaultTextStyle", IDefaultTextStyle());
  top.define("Divider", IDivider());
  top.define("Drawer", IDrawer());
  top.define("DropdownButton", IDropdownButton());
  top.define("DropdownMenuItem", IDropdownMenuItem());
  top.define("Duration", IDuration());
  top.define("ElevatedButton", IElevatedButton());
  top.define("Expanded", IExpanded());
  top.define("ExpansionTile", IExpansionTile());
  top.define("File", IFile());
  top.define("FittedBox", IFittedBox());
  top.define("FixedColumnWidth", IFixedColumnWidth());
  top.define("FlexColumnWidth", IFlexColumnWidth());
  top.define("FloatingActionButton", IFloatingActionButton());
  top.define("FloatingActionButtonLocation", IFloatingActionButtonLocation());
  top.define("FocusNode", IFocusNode());
  top.define("FontWeight", IFontWeight());
  top.define("Future", IFuture());
  top.define(
      "getApplicationDocumentsDirectory", IgetApplicationDocumentsDirectory());
  top.define("getDownloadsDirectory", IgetDownloadsDirectory());
  top.define("getTemporaryDirectory", IgetTemporaryDirectory());
  top.define("Geolocator", IGeolocator());
  top.define("GestureDetector", IGestureDetector());
  top.define("Icon", IIcon());
  top.define("IconButton", IIconButton());
  top.define("Image", IImage());
  top.define("ImagePicker", IImagePicker());
  top.define("InputDecoration", IInputDecoration());
  top.define("IntrinsicColumnWidth", IIntrinsicColumnWidth());
  top.define("IntrinsicHeight", IIntrinsicHeight());
  top.define("JavascriptChannel", IJavascriptChannel());
  top.define("launchUrl", ILaunchUrl());
  top.define("LinearGradient", ILinearGradient());
  top.define("ListTile", IListTile());
  top.define("ListView", IListView());
  top.define("Material", IMaterial());
  top.define("MaterialPageRoute", IMaterialPageRoute());
  top.define("Matrix4", IMatrix4());
  top.define("MediaQuery", IMediaQuery());
  top.define("NetworkImage", INetworkImage());
  top.define("Offset", IOffset());
  top.define("OutlinedButton", IOutlinedButton());
  top.define("OutlineInputBorder", IOutlineInputBorder());
  top.define("PackageInfo", IPackageInfo());
  top.define("Padding", IPadding());
  top.define("PageController", IPageController());
  top.define("PageView", IPageView());
  top.define("PopupMenuButton", IPopupMenuButton());
  top.define("PopupMenuFilter", IPopupMenuFilter());
  top.define("PopupMenuDivider", IPopupMenuDivider());
  top.define("PopupMenuItem", IPopupMenuItem());
  top.define("PopupMenuWrap", IPopupMenuWrap());
  top.define("Positioned", IPositioned());
  top.define("PreferredSize", IPreferredSize());
  top.define("Radio", IRadio());
  top.define("RegExp", IRegExp());
  top.define("Row", IRow());
  top.define("RoundedRectangleBorder", IRoundedRectangleBorder());
  top.define("SafeArea", ISafeArea());
  top.define("Scaffold", IScaffold());
  top.define("ScaffoldMessenger", IScaffoldMessenger());
  top.define("Shadow", IShadow());
  top.define("SharedPreferences", ISharedPreferences());
  top.define("SimpleDialog", ISimpleDialog());
  top.define("SingleChildScrollView", ISingleChildScrollView());
  top.define("Size", ISize());
  top.define("SizedBox", ISizedBox());
  top.define("Slider", ISlider());
  top.define("SnackBar", ISnackBar());
  top.define("SnackBarAction", ISnackBarAction());
  top.define("Stack", IStack());
  top.define("StadiumBorder", IStadiumBorder());
  top.define("Stream", IStream());
  top.define("StreamBuilder", IStreamBuilder());
  top.define("StreamController", IStreamController());
  top.define("Switch", ISwitch());
  top.define("showDialog", IShowDialog());
  top.define("showModalBottomSheet", IShowModalBottomSheet());
  top.define("showSnackBar", ISnackBarShow()); // deprecated
  top.define("Tab", ITab());
  top.define("TabBar", ITabBar());
  top.define("TabBarView", ITabBarView());
  top.define("Table", ITable());
  top.define("TableCell", ITableCell());
  top.define("TableBorder", ITableBorder());
  top.define("TableRow", ITableRow());
  top.define("Text", IText());
  top.define("TextAlignVertical", ITextAlignVertical());
  top.define("TextButton", ITextButton());
  top.define("TextEditingController", ITextEditingController());
  top.define("TextField", ITextField());
  top.define("TextInputType", ITextInputType());
  top.define("TextStyle", ITextStyle());
  top.define("Timer", ITimer());
  top.define("Transform", ITransform());
  top.define("Uri", IUri());
  top.define("UnderlineInputBorder", IUnderlineInputBorder());
  top.define("UniqueKey", IUniqueKey());
  top.define("ValueNotifier", IValueNotifier());
  top.define("ValueKey", IValueKey());
  top.define("ValueListenableBuilder", IValueListenableBuilder());
  top.define("VerticalDivider", IVerticalDivider());
  top.define("WebView", IWebView());
  top.define("Wrap", IWrap());
}
