import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/common.dart' show Color;
import 'dart:convert';

class LineSeries<T> {
  final T x;
  final double? y;
  final int groupOrder;
  final String groupCode;
  final String xDisplay;
  final String? yDisplay;
  final List<int>? dashPattern;
  final Color? color;
  final Color? fillColor;
  final String unit;
  static final regMonth = RegExp(r'^\d{4}-?\d{2}-?\d{2}$');
  static final regDay = RegExp(r'^\d+$');
  LineSeries(
      {required this.x,
      required this.y,
      required this.xDisplay,
      required this.yDisplay,
      required this.groupOrder,
      required this.groupCode,
      this.dashPattern = const [],
      this.color,
      this.fillColor,
      this.unit = ''});

  factory LineSeries.test(ChartLineData d, int lineIndex) {
    return LineSeries(
        groupOrder: d.groupOrder,
        groupCode: d.groupCode,
        x: d.x as T,
        xDisplay: d.xDisplay,
        y: d.ys.isNotEmpty ? (d.ys[lineIndex].y) : d.y,
        unit: d.ys.isNotEmpty ? d.ys[lineIndex].unit : '',
        color: d.color,
        fillColor: d.fillColor,
        dashPattern: d.dashPattern,
        yDisplay: d.yDisplay ?? d.ys[lineIndex].yDisplay);
  }

  factory LineSeries.fromChartLineData(ChartLineData d, int lineIndex) {
    switch (T.toString()) {
      case 'DateTime':
        return LineSeries(
            groupOrder: d.groupOrder,
            groupCode: d.groupCode,
            x: DateTime.parse(d.x) as T,
            xDisplay: d.xDisplay,
            y: d.y ?? (d.ys.isNotEmpty ? d.ys[lineIndex].y : null),
            unit: d.ys.isNotEmpty ? d.ys[lineIndex].unit : '',
            color: d.color,
            fillColor: d.fillColor,
            dashPattern: d.dashPattern,
            yDisplay: d.yDisplay ??
                (d.ys.isNotEmpty ? d.ys[lineIndex].yDisplay : null));
      case 'int':
        return LineSeries(
            groupOrder: d.groupOrder,
            groupCode: d.groupCode,
            x: int.parse(d.x) as T,
            xDisplay: d.xDisplay,
            y: d.y ?? (d.ys.isNotEmpty ? d.ys[lineIndex].y : null),
            unit: d.ys.isNotEmpty ? d.ys[lineIndex].unit : '',
            color: d.color,
            fillColor: d.fillColor,
            dashPattern: d.dashPattern,
            yDisplay: d.yDisplay ??
                (d.ys.isNotEmpty ? d.ys[lineIndex].yDisplay : null));
      default:
        return LineSeries(
            groupOrder: d.groupOrder,
            groupCode: d.groupCode,
            x: d.x as T,
            xDisplay: d.xDisplay,
            y: d.y ?? (d.ys.isNotEmpty ? d.ys[lineIndex].y : null),
            unit: d.ys.isNotEmpty ? d.ys[lineIndex].unit : '',
            color: d.color,
            fillColor: d.fillColor,
            dashPattern: d.dashPattern,
            yDisplay: d.yDisplay ??
                (d.ys.isNotEmpty ? d.ys[lineIndex].yDisplay : null));
    }
  }
}

class YData {
  String title;
  String unit;
  double? y;
  String yDisplay;

  YData({this.title = '', this.unit = '', this.y, this.yDisplay = ''});

  static String? _toString(double? d) {
    if (d == null) return null;
    return '$d';
  }

  static double? _fromString(String? s) {
    if (s == null || s == '' || s == '-') return null;
    return double.parse(s);
  }

  factory YData.fromJson(Map<String, dynamic> json) {
    var r = YData(
      title: json['TITLE'] ?? '',
      unit: json['UNIT'] ?? '',
      yDisplay: json['Y_DISPLAY'] ?? '',
      y: _fromString(json['Y']),
    );
    return r;
  }

  Map<String, dynamic> toJson() {
    return {
      "TITLE": title,
      "UNIT": unit,
      "Y": _toString(y),
      "Y_DISPLAY": yDisplay,
    };
  }
}

class ChartLineData {
  String groupCode;
  int groupOrder;
  String x;
  double? y;
  Color? color;
  Color? fillColor;
  List<YData> ys;
  String xDisplay;
  String? yDisplay;
  List<int>? dashPattern;
  int orderId;
  int yAxis;
  String? yAxisName;
  int renderId;

  ChartLineData(
      {this.groupCode = '',
      this.groupOrder = 0,
      required this.x,
      this.y,
      this.ys = const [],
      this.xDisplay = '',
      this.yDisplay,
      this.dashPattern = const [],
      this.orderId = 0,
      this.yAxis = 0,
      this.yAxisName,
      this.color,
      this.fillColor,
      this.renderId = 0});

  static int _fromDynamic(dynamic d) {
    if (d == null) return 0;
    if (d.runtimeType == String) {
      return int.parse(d);
    } else if (d is num) {
      return d.toInt();
    }
    return d;
  }

  static double? _parseDouble(dynamic d) {
    if (d == null) return null;
    if (d is String) {
      if (d == '' || d == '-') return 0;
      return double.parse(d);
    } else if (d is num) {
      return d.toDouble();
    }
    return null;
  }

  static String? _toDynamic(int i) {
    if (i == 0) return null;
    return '$i';
  }

  static List<YData> _fromJsonList(String? s) {
    if (s == null) return [];
    List l = json.decode(s);
    var r = l.map((e) => YData.fromJson(e)).toList();
    return r;
  }

  static List<int> _parseDashPattern(String? s) {
    if (s == null) return [];
    List l = json.decode(s);
    return l.map((e) => int.parse('$e')).toList();
  }

  static String? _toJsonList(List<YData> l) {
    if (l.isEmpty) return null;
    return json.encode(l.map((e) => e.toJson()).toList());
  }

  static Color? _parseColor(String? s) {
    if (s == null) return null;
    switch (s) {
      case 'blue':
        return charts.MaterialPalette.blue.shadeDefault;
      case 'red':
        return charts.MaterialPalette.red.shadeDefault;
      case 'yellow':
        return charts.MaterialPalette.yellow.shadeDefault;
      case 'green':
        return charts.MaterialPalette.green.shadeDefault;
      case 'purple':
        return charts.MaterialPalette.purple.shadeDefault;
      case 'cyan':
        return charts.MaterialPalette.cyan.shadeDefault;
      case 'deepOrange':
        return charts.MaterialPalette.deepOrange.shadeDefault;
      case 'lime':
        return charts.MaterialPalette.lime.shadeDefault;
      case 'indigo':
        return charts.MaterialPalette.indigo.shadeDefault;
      case 'pink':
        return charts.MaterialPalette.pink.shadeDefault;
      case 'teal':
        return charts.MaterialPalette.teal.shadeDefault;
      case 'grey':
        return charts.MaterialPalette.gray.shadeDefault;
      default:
        return charts.MaterialPalette.blue.shadeDefault;
    }
  }

  static String? _colorToString(Color? c) {
    if (c == charts.MaterialPalette.blue.shadeDefault) {
      return 'blue';
    } else if (c == charts.MaterialPalette.red.shadeDefault) {
      return 'red';
    } else if (c == charts.MaterialPalette.yellow.shadeDefault) {
      return 'yellow';
    } else if (c == charts.MaterialPalette.green.shadeDefault) {
      return 'green';
    } else if (c == charts.MaterialPalette.purple.shadeDefault) {
      return 'purple';
    } else if (c == charts.MaterialPalette.cyan.shadeDefault) {
      return 'cyan';
    } else if (c == charts.MaterialPalette.deepOrange.shadeDefault) {
      return 'deepOrange';
    } else if (c == charts.MaterialPalette.lime.shadeDefault) {
      return 'lime';
    } else if (c == charts.MaterialPalette.indigo.shadeDefault) {
      return 'indigo';
    } else if (c == charts.MaterialPalette.pink.shadeDefault) {
      return 'pink';
    } else if (c == charts.MaterialPalette.teal.shadeDefault) {
      return 'teal';
    } else {
      return null;
    }
  }

  factory ChartLineData.fromJson(Map<String, dynamic> _json) {
    var r = ChartLineData(
        groupCode: _json['group_code'] as String,
        groupOrder: _json['group_order'] as int,
        dashPattern: _parseDashPattern(_json['dash_pattern']),
        x: _json['x'].toString(),
        y: _parseDouble(_json['y']),
        ys: _fromJsonList(_json['ys']),
        xDisplay: _json['x_display'] ?? _json['x'].toString(),
        yDisplay: _json['y_display'],
        yAxis: _json['y_axis'] as int,
        yAxisName: _json['y_axis_name'],
        color: _parseColor(_json['color']),
        fillColor: _parseColor(_json['fill_color']),
        orderId: _fromDynamic(_json['order_id']),
        renderId: _fromDynamic(_json['render_id']));
    return r;
  }

  Map<String, dynamic> toJson() {
    return {
      'group_code': groupCode,
      'group_order': groupOrder,
      'x': x,
      'y': y,
      'dash_pattern': json.encode(dashPattern),
      'color': _colorToString(color),
      'fill_color': _colorToString(fillColor),
      'ys': _toJsonList(ys),
      'x_display': xDisplay,
      'y_display': yDisplay,
      'order_id': _toDynamic(orderId),
      'y_axis': yAxis,
      'y_axis_name': yAxisName,
      'render_id': renderId
    };
  }
}
