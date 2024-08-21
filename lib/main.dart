import 'package:flutter/material.dart';
import 'package:dax/dax.dart';
import 'package:flutter/services.dart';
import 'package:usecases/base.dart';
import 'package:usecases/icon.dart';
import 'package:usecases/api.dart';
import 'package:usecases/common.dart';
import 'package:usecases/basic.dart';
import 'package:usecases/decoration.dart';
import 'package:usecases/edgeinsets.dart';
import 'package:usecases/layout.dart';
import 'package:usecases/scroll.dart';
import 'package:usecases/container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              elevation: 3,
              centerTitle: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87)),
      home: const MyHomePage(title: 'Dax Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loaded = false;
  final Interpreter interpreter = Interpreter();
  late Widget renderedWidget;


  @override
  void initState() {
    super.initState();
    registerGlobalFunctions();
    Scanner scanner = Scanner('''
  var i = 0;
  var arr = [{"x":1}, {"x":2}];
  var radius = 5;
  var isChecked = true;
  var selectedIndex = 0;
  var textEditingController = TextEditingController();
  var textEditingController1 = TextEditingController();
  var loaded = false;
  var valueLoaded;
  fun increase(){
    setState((){
     i = i + 1;
    });
  }

  fun switchRadius() {
    setState((){
      radius = radius + 3;
    });
  }

  fun item(i,) {
    return Text("位置: \${i["x"]}", 
      style: TextStyle(
        color: Colors.blue, 
        fontSize: 20
      )
    );
  }

  fun getData() {
    var result = [];
  }

  fun mp(i) {
    return i.x;
  }

  fun getItems() {
    var i = 0;
    var items = [];
    while(i < 20) {
      items.add(i) ;
      i = i + 1;
    }
    return items; 
  }

  fun loadNext(value) {
    print "value is \${value}";
    setState((){
      valueLoaded = value;
      loaded = true;
    });
  }

  fun loadData() {
    var url = "https://i-lambda.gzuni.com/sbox/com.test/fn/fn";
    Api.get(url, debug: false).then(loadNext);
  }

  fun initState() {
    loadData();
  }

  fun build() {
    return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: Text("title"),
        bottom: TabBar(
          labelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
          tabs: [
            Tab(text: "Home"),
            Tab(text: "User"),
            Tab(text: "More"),
          ] 
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.cyan),
            onPressed: switchRadius
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: (){} 
          )
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(backgroundColor: Colors.red, icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(backgroundColor: Colors.red, icon: Icon(Icons.business), label: "Business"),
          BottomNavigationBarItem(backgroundColor: Colors.red, icon: Icon(Icons.school), label: "School"),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (i){
          print "click \${i}";
          setState((){
            selectedIndex = i;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          mini: true,
          onPressed: (){
            print "click";
          }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text("Hello world!", 
            style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)
          ),
          Column(
            children: arr.map(item)
          ),
          Text("You are my hero: " + str(i)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
              child:Text("btn1"), 
              onPressed: (){
                print getDeviceWidth();
              } 
            ),
            OutlinedButton(
              child:Text("btn2"), 
              style: OutlinedButton.styleFrom(
                primary: Colors.red, 
                shape: CircleBorder(),
                side: BorderSide(width: 1.0, color: Colors.red) ),
              onPressed: (){
                showSnackBar(SnackBar(
                  width: 100,
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  content: Text("snackbar")));
              } 
            ), 
            OutlinedButton(
              child:Text("btn3"), 
              onPressed: (){
                showModalBottomSheet(
                  context: context, 
                  isDismissible: false,
                  builder: (context){
                  return Container(
                    child: Column(
                      children: [
                        Text("Sheet"),
                        TextButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.pop(context);
                          }
                        ) 
                      ]
                    ),
                    height: 100,
                  );
                });
              } 
            ), 
             OutlinedButton(
              child:Text("btn4"), 
              onPressed: (){
                showDialog(
                  context: context, 
                  barrierDismissible: false,
                  builder: (context){
                  return AlertDialog(
                    title:  Text("Basic dialog title"),
                    content: Text("This is my content"),
                    actions: [
                      TextButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.pop(context);
                        }
                      )
                    ] 
                  );
                });
              } 
            ), 
            ElevatedButton(
              child:Text("btn5"), 
              onPressed: increase
            )]
          ),
          TextButton(
            child:Text("switch radius"), 
            onPressed: () {
              setState((){
                radius = radius + 3;
              });
            } 
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                width: 2,
                color: Colors.blue
              ),
              gradient: LinearGradient(
                colors: [Color(0xff66bb6a), Color(0xff43a047)],
                begin: Alignment.centerLeft,
                end: Alignment(1,1)
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff66bb6a),
                  offset: Offset(2, 2),
                  blurRadius: 5.0,
                  spreadRadius: 1.0
                )
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(radius))
            ),
            transform: Matrix4.rotationZ(0.2),
            child: Text("This is a container", 
              style: TextStyle(
                fontSize: 20, 
                color: Color(0xff66bb6a)
              )
            )
          ),
          Wrap(
            spacing: 10,
            children: [
              Align(child: Text("Hello world!")),
              Image(
                height: 60,
                image: NetworkImage("https://pics6.baidu.com/feed/a8ec8a13632762d0a458dd54b4ab71f4503dc648.jpeg@f_auto?token=4246c989393b6ad6b32441a482158ae8")
              ),
              Image(
                height: 60,
                image: NetworkImage("https://pics6.baidu.com/feed/a8ec8a13632762d0a458dd54b4ab71f4503dc648.jpeg@f_auto?token=4246c989393b6ad6b32441a482158ae8")
              ),
              Image(
                height: 60,
                image: NetworkImage("https://pics6.baidu.com/feed/a8ec8a13632762d0a458dd54b4ab71f4503dc648.jpeg@f_auto?token=4246c989393b6ad6b32441a482158ae8")
              ),
            ]
          ),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.blue
              ) 
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Transform.rotate(
                      angle: 1.2,
                      child: Text("Hello world!")
                    )
                  )
                )
              ] 
            ),
          ),
          TextField(
            maxLines: 1,
            controller: textEditingController,
            style: TextStyle(fontSize: 20),
            onChanged: (value) {
              print value;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(1),
              prefixIcon: Icon(Icons.star),
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Colors.cyan),
                onPressed: (){
                  textEditingController.text = "";
                } 
              ),
              enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(1),
                 borderSide: BorderSide(
                    color: Colors.blue
                 )
              ),
              focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10),
                 borderSide: BorderSide(
                    color: Colors.red
                 )
              )
            )),

          Row(
            children: [
              CircularProgressIndicator(color: Colors.red),
              !loaded ? CupertinoActivityIndicator(): Text("\${valueLoaded["data"]}"),
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState((){
                    isChecked = value;
                  });
                }
              )
            ]
          ),
          Row(
            children: [
              Expanded(
                child: Container(height: 20, color: Colors.red)
              ),
              Expanded(
                flex:2,
                child: Container(height: 20, color: Colors.green)
              )
            ]
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) {
                if(index % 2 == 0) 
                  return Divider(color: Colors.red);
                 else 
                  return Divider(color: Colors.green);
              },
              itemBuilder: (context, index) {
                return Text("item \${index}");
              }
            )
          )

        ]
      )
    )
    );
  }

  build(); 

''');

    List<Token> tokens = scanner.scanTokens();
    Parser parser = Parser(tokens);
    List<Stmt> statements = parser.parse();
    Resolver resolver = Resolver(interpreter);
    resolver.resolve(statements);
    interpreter.interpret(statements);
    interpreter.invokeFunction('initState');
    renderedWidget = interpreter.getRenderedWidget() as Widget;
  }

  void updateUI() {
    final renderResult = interpreter.invokeFunction('build');
    setState(() {
      renderedWidget = renderResult as Widget;
    });
  }

  void registerGlobalFunctions() {
    interpreter.registerGlobal("context", context);
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
    interpreter.registerGlobal("BeveledRectangleBorder", IBeveledRectangleBorder());
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
    interpreter.registerGlobal("ContinuousRectangleBorder", IContinuousRectangleBorder());
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
    interpreter.registerGlobal("RoundedRectangleBorder", IRoundedRectangleBorder());
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
