import 'package:flutter/material.dart';
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

const codeSnap = '''
  fun build() {
  return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.cyan),
            onPressed: (){} 
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: (){} 
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          mini: true,
          onPressed: (){
            print "click";
          }
      ),
      body: Column()
    );
  }

build();
''';

final Interpreter interpreter = Interpreter();
bool isApiRegistered = false;

class DaxPage extends StatefulWidget {
  const DaxPage(this.codeSnap, {Key? key}) : super(key: key);
  final String codeSnap;

  @override
  State<DaxPage> createState() => _DaxPageState();
}

class _DaxPageState extends State<DaxPage> {
  late Widget renderedWidget;

  @override
  void initState() {
    super.initState();
    if (!isApiRegistered) {
      registerGlobalFunctions();
      isApiRegistered = true;
    }
    interpreter.registerGlobal("context", context);
    Scanner scanner = Scanner(widget.codeSnap);

    List<Token> tokens = scanner.scanTokens();
    Parser parser = Parser(tokens);
    List<Stmt> statements = [];
    try {
      statements = parser.parse();
    } catch (e) {
      print("error happend $e");
    }
    if (hadError) {
      return;
    }
    Resolver resolver = Resolver(interpreter);
    resolver.resolve(statements);
    if (hadError) {
      return;
    }
    interpreter.interpret(statements);
    interpreter.invokeFunction('initState');
    renderedWidget = interpreter.getRenderedWidget() as Widget;
  }

  void updateUI() {
    if (!mounted) return;
    final renderResult = interpreter.invokeFunction('build');
    setState(() {
      renderedWidget = renderResult as Widget;
    });
  }

  void registerGlobalFunctions() {
    interpreter.registerGlobal("Api", apiMap);
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
    interpreter.registerGlobal("MainAxisAlignment", mainAxisAlignmentMap);
    interpreter.registerGlobal("Matrix4", matrix4Map);
    interpreter.registerGlobal("Navigator", navigatorMap);
    interpreter.registerGlobal("Radius", radiusMap);
    interpreter.registerGlobal("SnackBarBehavior", snackBarBehaviorMap);
    interpreter.registerGlobal("StackFix", stackFitMap);
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
    interpreter.registerGlobal("BoxShadow", IBoxShadow());
    interpreter.registerGlobal("Checkbox", ICheckbox());
    interpreter.registerGlobal("CircleBorder", ICircleBorder());
    interpreter.registerGlobal(
        "CircularProgressIndicator", ICircularProgressIndicator());
    interpreter.registerGlobal("ClipOval", IClipOval());
    interpreter.registerGlobal("ClipRRect", IClipRRect());
    interpreter.registerGlobal("ClipRect", IClipRect());
    interpreter.registerGlobal("Color", IColor());
    interpreter.registerGlobal("Column", IColumn());
    interpreter.registerGlobal("Container", IContainer());
    interpreter.registerGlobal(
        "ContinuousRectangleBorder", IContinuousRectangleBorder());
    interpreter.registerGlobal(
        "CupertinoActivityIndicator", ICupertinoActivityIndicator());
    interpreter.registerGlobal("DefaultTabController", IDefaultTabController());
    interpreter.registerGlobal("Divider", IDivider());
    interpreter.registerGlobal("ElevatedButton", IElevatedButton());
    interpreter.registerGlobal("Expanded", IExpanded());
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
    interpreter.registerGlobal("Positioned", IPositioned());
    interpreter.registerGlobal("Row", IRow());
    interpreter.registerGlobal(
        "RoundedRectangleBorder", IRoundedRectangleBorder());
    interpreter.registerGlobal("Scaffold", IScaffold());
    interpreter.registerGlobal("Size", ISize());
    interpreter.registerGlobal("SnackBar", ISnackBar());
    interpreter.registerGlobal(
        "SingleChildScrollView", ISingleChildScrollView());
    interpreter.registerGlobal(
        "TextEditingController", ITextEditingController());
    interpreter.registerGlobal("Stack", IStack());
    interpreter.registerGlobal("StadiumBorder", IStadiumBorder());
    interpreter.registerGlobal("showDialog", IShowDialog());
    interpreter.registerGlobal("showModalBottomSheet", IShowModalBottomSheet());
    interpreter.registerGlobal("Tab", ITab());
    interpreter.registerGlobal("TabBar", ITabBar());
    interpreter.registerGlobal("TabBarView", ITabBarView());
    interpreter.registerGlobal("Text", IText());
    interpreter.registerGlobal("TextButton", ITextButton());
    interpreter.registerGlobal("TextField", ITextField());
    interpreter.registerGlobal("TextStyle", ITextStyle());
    interpreter.registerGlobal("UnderlineInputBorder", IUnderlineInputBorder());
    interpreter.registerGlobal("Wrap", IWrap());
    interpreter.registerGlobal(
        "getDeviceWidth",
        GenericLoxCallable(() => 0, (Interpreter interpreter,
            List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
          return MediaQuery.of(context).size.width;
        }));
    interpreter.registerGlobal(
        "showSnackBar",
        GenericLoxCallable(() => 1, (Interpreter interpreter,
            List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
          ScaffoldMessenger.of(context)
              .showSnackBar(arguments.first as SnackBar);
        }));
    interpreter.registerGlobal(
        "setState",
        GenericLoxCallable(() => 1, (Interpreter interpreter,
            List<Object?> arguments, Map<Symbol, Object?> namedArguments) {
          (arguments.first as LoxFunction).call(interpreter, [], {});
          updateUI();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return renderedWidget;
  }
}
