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

# 使用


`import 'package:dax_flutter/main.dart';`

```

	var codeSnap = 
	```
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
	  }
	build(); 
	```

	Navigator.push(context, MaterialPageRoute(
        builder: (context) => DaxPage(codeSnap)
   )

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

## 2. 组件

*  AlertDialog
*  Align
*  Alignment
*  AppBar
*  AssetImage
*  BeveledRectangleBorder
*  BorderSide
*  BottomNavigationBar
*  BottomNavigationBarItem
*  BoxDecoration
*  BoxShadow
*  Checkbox
*  CircleBorder
*  CircularProgressIndicator
*  ClipOval
*  ClipPRect
*  ClipRect
*  Color
*  Column
*  Container
*  ContinuousRectangleBorder
*  CupertinoActivityIndicator
*  DefaultTabController
*  Divider
*  ElevatedButton
*  Expanded
*  FloatingActionButton
*  GestureDetector
*  Icon
*  IconButton
*  Image
*  InputDecoration
*  LinearGradient
*  ListTile
*  ListView
*  NetworkImage
*  Offset
*  OutlinedButton
*  OutlineInputBorder
*  Padding
*  Positioned
*  Row
*  RoundedRectangleBorder
*  Scaffold
*  Size
*  SnackBar
*  SingleChildScrollView
*  TextEditingController
*  Stack
*  StadiumBorder
*  showDialog
*  showModalBottomSheet
*  Tab
*  TabBar
*  TabBarView
*  Text
*  TextButton
*  TextField
*  TextStyle
*  Uri
*  UnderlineInputBorder
*  Wrap
 
