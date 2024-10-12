import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import './chart_model.dart';

typedef TypedHiddenFn<T, R> = R Function(T datum);
typedef HiddenFn<R> = R Function(String? groupCode);
const secondaryMeasureAxisId = 'secondaryMeasureAxisId';

class ChartLine extends StatefulWidget {
  final bool animate;
  final List<charts.TickSpec<String>> staticTicks;
  final List<ChartLineData> lineData;
  final double height;
  final int titleFontSize;
  final double maskFontSize;
  final bool showLegend;
  final bool showChartTitle;
  final bool showAxisLine;
  final Widget? loadingWidget;
  final bool hidePrimaryAxis;
  final bool hideDomainAxis;
  final bool hideSecondaryAxis;
  final double strokeWidth;
  final HiddenFn<bool>? hiddenFn;
  static int staticTickCount = 6;
  const ChartLine(
      {Key? key,
      this.animate = false,
      this.staticTicks = const [],
      this.lineData = const [],
      this.height = 200.0,
      this.titleFontSize = 14,
      this.maskFontSize = 18.0,
      this.showLegend = true,
      this.showChartTitle = true,
      this.showAxisLine = false,
      this.loadingWidget,
      this.strokeWidth = 1.0,
      this.hidePrimaryAxis = false,
      this.hideSecondaryAxis = false,
      this.hiddenFn,
      this.hideDomainAxis = false})
      : super(key: key);

  factory ChartLine.withChartData(List data,
      {bool animate = false,
      double height = 200.0,
      int titleFontSize = 14,
      double maskFontSize = 18.0,
      bool showLegend = true,
      bool showChartTitle = true,
      bool showAxisLine = false,
      Widget? loadingWidget,
      double strokeWidth = 1.0,
      bool hidePrimaryAxis = false,
      TypedHiddenFn<String, bool>? hiddenFn,
      bool hideSecondaryAxis = false,
      bool hideDomainAxis = false}) {
    var lineData =
        data.map<ChartLineData>((e) => ChartLineData.fromJson(e)).toList();
    List<charts.TickSpec<String>> staticTick = _makeStaticTick(lineData);
    return ChartLine(
      staticTicks: staticTick,
      lineData: lineData,
      animate: animate,
      height: height,
      titleFontSize: titleFontSize,
      maskFontSize: maskFontSize,
      showLegend: showLegend,
      showChartTitle: showChartTitle,
      showAxisLine: showAxisLine,
      loadingWidget: loadingWidget,
      hiddenFn:
          hiddenFn == null ? null : (String? groupCode) => hiddenFn(groupCode!),
      strokeWidth: strokeWidth,
      hideDomainAxis: hideDomainAxis,
      hidePrimaryAxis: hidePrimaryAxis,
      hideSecondaryAxis: hideSecondaryAxis,
    );
  }

  static List<int> makeStaticTick(int upper, int len) {
    if (upper <= len) {
      return List<int>.generate(upper, (i) => i + 1);
    }
    var d = upper / len;
    var l = List<int>.generate(len, (i) => i + 1);
    return l.map((v) {
      var _ = v * d;
      return _.round();
    }).toList();
  }

  static List<charts.TickSpec<String>> _makeStaticTick(
      List<ChartLineData> data) {
    List<ChartLineData> temp = [];
    String lastGroup = '';
    for (ChartLineData element in data) {
      if (element.groupCode != lastGroup) {
        if (temp.isNotEmpty) {
          break;
        } else {
          temp.add(element);
        }
        lastGroup = element.groupCode;
      } else {
        temp.add(element);
      }
    }

    /*
    [0:15 0:30 0:45 1:00 ...] -> [0:15 0:45 ...]
     */
    List<int> arr = makeStaticTick(temp.length, staticTickCount);
    return arr
        .map<charts.TickSpec<String>>((e) => charts.TickSpec(temp[e - 1].x))
        .toList();
  }

  @override
  State<ChartLine> createState() => _ChartLineState();
}

charts.Series<LineSeries, T> makeLine<T>(List<LineSeries> lineData,
    bool withColor, String lastGroup, int lastAxis, int lastRender) {
  charts.Series<LineSeries, T> line;
  if (withColor) {
    line = charts.Series<LineSeries, T>(
        id: lastGroup,
        domainFn: (LineSeries row, _) => row.x,
        measureFn: (LineSeries row, _) => row.y,
        colorFn: (LineSeries row, _) => row.color!,
        labelAccessorFn: (LineSeries row, _) => row.yDisplay!,
        dashPatternFn: (LineSeries row, _) {
          return row.dashPattern;
        },
        data: lineData);
  } else {
    line = charts.Series<LineSeries, T>(
        id: lastGroup,
        domainFn: (LineSeries row, _) => row.x,
        measureFn: (LineSeries row, _) => row.y,
        labelAccessorFn: (LineSeries row, _) => row.yDisplay!,
        dashPatternFn: (LineSeries row, _) {
          return row.dashPattern;
        },
        data: lineData);
  }
  line
    ..setAttribute(
        charts.measureAxisIdKey, lastAxis > 0 ? secondaryMeasureAxisId : null)
    ..setAttribute(
        charts.rendererIdKey, lastRender > 0 ? secondaryMeasureAxisId : null);
  return line;
}

class _ChartLineState extends State<ChartLine> {
  String hoverAlign = 'L';
  String primaryUnit = '';
  String secondaryUnit = '';
  int primaryAxisLength = 0;
  bool primaryZeroBound = false;
  bool secondaryZeroBound = false;
  List<String> groups = [];
  final ValueNotifier<int> lineIndex = ValueNotifier<int>(0);
  final ValueNotifier<bool> showMask = ValueNotifier<bool>(false);
  final ValueNotifier<String> hoverContent = ValueNotifier<String>('');

  void _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    final List<Map<String, dynamic>> list = [];

    final seriesData = selectedDatum.first.series.data;
    final axisLength = seriesData.length;

    final idx = seriesData
        .map((i) => i.x)
        .toList()
        .indexOf(selectedDatum.first.datum.x);
    String align = 'L';
    if (axisLength / 2 >= idx) {
      align = 'R';
    }

    if (selectedDatum.isNotEmpty) {
      for (var datumPair in selectedDatum) {
        list.add({
          'group_order': datumPair.datum.groupOrder,
          'content':
              '${datumPair.series.displayName}: ${datumPair.datum.yDisplay ?? datumPair.datum.y ?? ''}'
        });
      }
    }

    var hoverTitle = selectedDatum.first.datum.xDisplay;

    List<String> txt = [];
    if (hoverTitle != null) {
      txt.add(hoverTitle);
    }
    list.sort((a, b) => a['group_order'].compareTo(b['group_order']));
    for (var element in list) {
      txt.add('${element['content']}');
    }
    hoverAlign = align;
    hoverContent.value = txt.join('\n');
    showMask.value = true;
  }

  List<charts.Series<LineSeries, T>> _makeData<T>(
      List<ChartLineData> data, int lineIndex) {
    List<LineSeries> lineData = [];
    String lastGroup = '';
    int lastAxis = 0;
    int lastRender = 0;
    List<charts.Series<LineSeries, T>> lines = [];
    charts.Series<LineSeries, T> line;
    for (ChartLineData element in data) {
      if (element.groupCode != lastGroup) {
        groups.add(element.groupCode);
        if (lineData.isNotEmpty) {
          line = makeLine(
              lineData, element.color != null, lastGroup, lastAxis, lastRender);
          lines.add(line);
          primaryAxisLength = lineData.length;
          lineData = [];
        }

        if (element.yAxis == 0) {
          primaryUnit =
              element.ys.length > lineIndex ? element.ys[lineIndex].unit : '';
        } else {
          secondaryUnit =
              element.ys.length > lineIndex ? element.ys[lineIndex].unit : '';
        }

        lastGroup = element.groupCode;
        lastAxis = element.yAxis;
        lastRender = element.renderId;
      }
      lineData.add(LineSeries<T>.fromChartLineData(element, lineIndex));
    }

    if (lineData.isEmpty) {
      return lines;
    }

    line = makeLine(
        lineData, data.first.color != null, lastGroup, lastAxis, lastRender);
    lines.add(line);

    return lines;
  }

  void _showDialog(List<YData> yd) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: yd
                  .asMap()
                  .entries
                  .map((e) => ListTile(
                        leading: Icon(
                          Icons.check,
                          color: e.key == lineIndex.value
                              ? Colors.redAccent
                              : Colors.white,
                        ),
                        title: Text(
                          e.value.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          if (e.key != lineIndex.value) {
                            lineIndex.value = e.key;
                          }
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ),
          );
        });
  }

  @override
  void initState() {
    String lastGroup = '';
    int lastAxis = 0;
    int lastRender = 0;
    for (ChartLineData element in widget.lineData) {
      if (element.groupCode != lastGroup) {
        lastGroup = element.groupCode;
        lastAxis = element.yAxis;
        lastRender = element.renderId;
        if (lastAxis == 0 && lastRender > 0) {
          primaryZeroBound = true;
        }
        if (lastAxis > 0 && lastRender > 0) {
          secondaryZeroBound = true;
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryFormatter = charts.BasicNumericTickFormatterSpec(
        (num? value) => '$value$primaryUnit');
    final secondaryFormatter = charts.BasicNumericTickFormatterSpec(
        (num? value) => '$value$secondaryUnit');
    final primaryMeasureAxis = charts.NumericAxisSpec(
        renderSpec:
            widget.hidePrimaryAxis ? const charts.NoneRenderSpec() : null,
        tickFormatterSpec: primaryFormatter,
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
            desiredTickCount: 5, zeroBound: primaryZeroBound));
    final secondaryMeasureAxis = charts.NumericAxisSpec(
        renderSpec:
            widget.hideSecondaryAxis ? const charts.NoneRenderSpec() : null,
        tickFormatterSpec: secondaryFormatter,
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
            desiredTickCount: 5, zeroBound: secondaryZeroBound));
    return SizedBox(
        height: widget.height,
        child: ValueListenableBuilder<bool>(
          builder: (BuildContext context, bool show, Widget? child) {
            return Stack(
              children: [
                child!,
                if (widget.lineData.isNotEmpty &&
                    widget.lineData.first.ys.length > 1)
                  Positioned(
                      top: 0,
                      right: 5,
                      child: IconButton(
                          icon: const Icon(Icons.layers),
                          onPressed: () {
                            _showDialog(widget.lineData.first.ys);
                          })),
                if (show)
                  Positioned(
                      top: 5,
                      right: hoverAlign == 'R' ? 5 : null,
                      left: hoverAlign == 'L' ? 5 : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xb3323232),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, top: 5, left: 5, bottom: 5),
                              child: ValueListenableBuilder<String>(
                                builder: (BuildContext _, String content,
                                    Widget? child) {
                                  return Text(
                                    content,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: widget.maskFontSize),
                                  );
                                },
                                valueListenable: hoverContent,
                              ),
                            ),
                            Positioned(
                              child: IconButton(
                                icon: const Icon(Icons.close),
                                color: Colors.redAccent,
                                onPressed: () {
                                  showMask.value = false;
                                },
                              ),
                              right: -10,
                              top: -10,
                            )
                          ],
                        ),
                      )),
              ],
            );
          },
          child: ValueListenableBuilder<int>(
            builder: (BuildContext _, int lineIndex, Widget? child) {
              if (widget.lineData.isEmpty) {
                return Center(
                  child: widget.loadingWidget ?? const Text('加载中...'),
                );
              } else if (LineSeries.regMonth
                  .hasMatch(widget.lineData.first.x)) {
                return charts.TimeSeriesChart(
                  _makeData<DateTime>(widget.lineData, lineIndex),
                  animate: widget.animate,
                  selectionModels: [
                    charts.SelectionModelConfig(
                        type: charts.SelectionModelType.info,
                        changedListener: _onSelectionChanged)
                  ],
                  defaultRenderer: charts.LineRendererConfig(
                      strokeWidthPx: widget.strokeWidth, includeArea: false),
                  customSeriesRenderers: [
                    charts.LineRendererConfig(
                      strokeWidthPx: widget.strokeWidth,
                      customRendererId: secondaryMeasureAxisId,
                      includeArea: true,
                    ),
                  ],
                  domainAxis: charts.DateTimeAxisSpec(
                      showAxisLine: widget.showAxisLine,
                      renderSpec: widget.hideDomainAxis
                          ? const charts.NoneRenderSpec()
                          : null,
                      tickFormatterSpec:
                          const charts.AutoDateTimeTickFormatterSpec(
                              day: charts.TimeFormatterSpec(
                                  format: 'dd', transitionFormat: 'dd'))),
                  primaryMeasureAxis: primaryMeasureAxis,
                  secondaryMeasureAxis: secondaryMeasureAxis,
                  behaviors: [
                    if (widget.showLegend)
                      charts.SeriesLegend(
                          position: charts.BehaviorPosition.bottom,
                          defaultHiddenSeries: widget.hiddenFn != null
                              ? groups
                                  .where((e) => widget.hiddenFn!(e))
                                  .toList()
                              : [],
                          outsideJustification:
                              charts.OutsideJustification.endDrawArea,
                          desiredMaxColumns: 4),
                    if (widget.showChartTitle)
                      charts.ChartTitle(
                          widget.lineData.first.ys[lineIndex].title,
                          behaviorPosition: charts.BehaviorPosition.top,
                          titleStyleSpec: charts.TextStyleSpec(
                              fontSize: widget.titleFontSize),
                          titleOutsideJustification:
                              charts.OutsideJustification.start,
                          innerPadding: 18),
                  ],
                );
              } else if (LineSeries.regDay.hasMatch(widget.lineData.first.x)) {
                return charts.LineChart(
                    _makeData<int>(widget.lineData, lineIndex),
                    animate: widget.animate,
                    selectionModels: [
                      charts.SelectionModelConfig(
                          type: charts.SelectionModelType.info,
                          changedListener: _onSelectionChanged)
                    ],
                    defaultRenderer: charts.LineRendererConfig(
                        strokeWidthPx: widget.strokeWidth),
                    customSeriesRenderers: [
                      charts.LineRendererConfig(
                        strokeWidthPx: widget.strokeWidth,
                        customRendererId: secondaryMeasureAxisId,
                        includeArea: true,
                      ),
                    ],
                    domainAxis: charts.NumericAxisSpec(
                        showAxisLine: widget.showAxisLine,
                        renderSpec: widget.hideDomainAxis
                            ? const charts.NoneRenderSpec()
                            : null,
                        tickProviderSpec:
                            const charts.BasicNumericTickProviderSpec(
                                dataIsInWholeNumbers: true,
                                desiredTickCount: 5,
                                zeroBound: false),
                        tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
                            (num? measure) {
                          if (measure == null) return '';
                          if (measure < primaryAxisLength) {
                            return widget.lineData[measure.toInt()].xDisplay;
                          }
                          return '';
                        })),
                    primaryMeasureAxis: primaryMeasureAxis,
                    secondaryMeasureAxis: secondaryMeasureAxis,
                    behaviors: [
                      if (widget.showLegend)
                        charts.SeriesLegend(
                            position: charts.BehaviorPosition.bottom,
                            defaultHiddenSeries: widget.hiddenFn != null
                                ? groups
                                    .where((e) => widget.hiddenFn!(e))
                                    .toList()
                                : [],
                            outsideJustification:
                                charts.OutsideJustification.endDrawArea,
                            desiredMaxColumns: 4),
                      if (widget.showChartTitle)
                        charts.ChartTitle(
                            widget.lineData.first.ys[lineIndex].title,
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleStyleSpec: charts.TextStyleSpec(
                                fontSize: widget.titleFontSize),
                            titleOutsideJustification:
                                charts.OutsideJustification.start,
                            innerPadding: 18)
                    ]);
              } else {
                return charts.OrdinalComboChart(
                  _makeData<String>(widget.lineData, lineIndex),
                  animate: widget.animate,
                  selectionModels: [
                    charts.SelectionModelConfig(
                        type: charts.SelectionModelType.info,
                        changedListener: _onSelectionChanged)
                  ],
                  defaultRenderer: charts.LineRendererConfig(
                      strokeWidthPx: widget.strokeWidth),
                  customSeriesRenderers: [
                    charts.BarRendererConfig(
                        customRendererId: secondaryMeasureAxisId,
                        groupingType: charts.BarGroupingType.stacked)
                  ],
                  domainAxis: charts.OrdinalAxisSpec(
                      showAxisLine: widget.showAxisLine,
                      renderSpec: widget.hideDomainAxis
                          ? const charts.NoneRenderSpec()
                          : null,
                      tickProviderSpec: charts.StaticOrdinalTickProviderSpec(
                          widget.staticTicks)),
                  primaryMeasureAxis: primaryMeasureAxis,
                  secondaryMeasureAxis: secondaryMeasureAxis,
                  behaviors: [
                    if (widget.showLegend)
                      charts.SeriesLegend(
                        position: charts.BehaviorPosition.bottom,
                        defaultHiddenSeries: widget.hiddenFn != null
                            ? groups.where((e) => widget.hiddenFn!(e)).toList()
                            : [],
                      ),
                    if (widget.showChartTitle)
                      charts.ChartTitle(
                          widget.lineData.first.ys[lineIndex].title,
                          behaviorPosition: charts.BehaviorPosition.top,
                          titleStyleSpec: charts.TextStyleSpec(
                              fontSize: widget.titleFontSize),
                          titleOutsideJustification:
                              charts.OutsideJustification.start,
                          innerPadding: 18)
                  ],
                );
              }
            },
            valueListenable: lineIndex,
          ),
          valueListenable: showMask,
        ));
  }
}

class ChartBar extends StatefulWidget {
  final bool animate;
  final List<ChartLineData> lineData;
  final bool vertical;
  final double height;
  final int titleFontSize;
  final bool showBarLabel;
  final double maskFontSize;
  final bool showLegend;
  final bool showChartTitle;
  final bool showAxisLine;
  final Widget? loadingWidget;
  final String groupType;
  final bool hidePrimaryAxis;
  final bool hideDomainAxis;
  final bool hideSecondaryAxis;

  const ChartBar(
      {Key? key,
      this.animate = false,
      this.lineData = const [],
      this.height = 200.0,
      this.vertical = true,
      this.titleFontSize = 14,
      this.showBarLabel = false,
      this.maskFontSize = 18.0,
      this.showLegend = true,
      this.showChartTitle = true,
      this.showAxisLine = false,
      this.loadingWidget,
      this.groupType = 'grouped',
      this.hidePrimaryAxis = false,
      this.hideSecondaryAxis = false,
      this.hideDomainAxis = false})
      : super(key: key);

  factory ChartBar.withChartData(List data,
      {bool animate = false,
      bool vertical = true,
      double height = 200.0,
      int titleFontSize = 14,
      bool showBarLabel = false,
      double maskFontSize = 18.0,
      bool showLegend = true,
      bool showChartTitle = true,
      bool showAxisLine = false,
      String groupType = 'grouped',
      Widget? loadingWidget,
      bool hidePrimaryAxis = false,
      bool hideSecondaryAxis = false,
      bool hideDomainAxis = false}) {
    var lineData =
        data.map<ChartLineData>((e) => ChartLineData.fromJson(e)).toList();
    return ChartBar(
      lineData: lineData,
      vertical: vertical,
      height: height,
      animate: animate,
      titleFontSize: titleFontSize,
      showBarLabel: showBarLabel,
      maskFontSize: maskFontSize,
      showLegend: showLegend,
      showChartTitle: showChartTitle,
      showAxisLine: showAxisLine,
      loadingWidget: loadingWidget,
      groupType: groupType,
      hidePrimaryAxis: hidePrimaryAxis,
      hideSecondaryAxis: hideSecondaryAxis,
      hideDomainAxis: hideDomainAxis,
    );
  }

  @override
  _ChartBarState createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  String hoverAlign = 'R';
  String primaryUnit = '';
  String secondaryUnit = '';
  int primaryAxisLength = 0;
  final ValueNotifier<int> hintIdx = ValueNotifier<int>(0);
  final ValueNotifier<int> lineIndex = ValueNotifier<int>(0);
  final ValueNotifier<bool> showMask = ValueNotifier<bool>(false);
  final ValueNotifier<String> hoverContent = ValueNotifier<String>('');

  void _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    final List<Map<String, dynamic>> list = [];

    final seriesData = selectedDatum.first.series.data;
    final axisLength = seriesData.length;

    final idx = seriesData
        .map((i) => i.x)
        .toList()
        .indexOf(selectedDatum.first.datum.x);
    String align = 'L';
    if (axisLength / 2 >= idx) {
      align = 'R';
    }

    if (selectedDatum.isNotEmpty) {
      for (var datumPair in selectedDatum) {
        list.add({
          'group_order': datumPair.datum.groupOrder,
          'content':
              '${datumPair.series.displayName}: ${datumPair.datum.yDisplay ?? datumPair.datum.y ?? ''}'
        });
      }
      ;
    }

    var hoverTitle = selectedDatum.first.datum.xDisplay;

    List<String> txt = [];
    if (hoverTitle != null) {
      txt.add(hoverTitle);
    }

    list.sort((a, b) => a['group_order'].compareTo(b['group_order']));
    for (var element in list) {
      txt.add('${element['content']}');
    }
    ;

    hoverAlign = align;
    hintIdx.value = idx;
    hoverContent.value = txt.join('\n');
    showMask.value = true;
  }

  List<charts.Series<LineSeries, T>> _makeData<T>(
      List<ChartLineData> data, int lineIndex) {
    List<LineSeries> lineData = [];
    String lastGroup = '';
    int lastAxis = 0;
    int lastRender = 0;
    List<charts.Series<LineSeries, T>> lines = [];
    charts.Series<LineSeries, T>? line;
    for (ChartLineData element in data) {
      if (element.groupCode != lastGroup) {
        if (lineData.isNotEmpty) {
          line = makeLine(
              lineData, element.color != null, lastGroup, lastAxis, lastRender);
          
          lines.add(line);
          primaryAxisLength = lineData.length;
          lineData = [];
        }

        if (element.yAxis == 0) {
          primaryUnit =
              element.ys.length > lineIndex ? element.ys[lineIndex].unit : '';
        } else {
          secondaryUnit =
              element.ys.length > lineIndex ? element.ys[lineIndex].unit : '';
        }
        lastGroup = element.groupCode;
        lastAxis = element.yAxis;
        lastRender = element.renderId;
      }
      lineData.add(LineSeries<T>.fromChartLineData(element, lineIndex));
    }

    if (lineData.isEmpty) {
      return lines;
    }
    line = makeLine(
        lineData, data.first.color != null, lastGroup, lastAxis, lastRender);
    lines.add(line);
    return lines;
  }

  void _showDialog(List<YData> yd) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: yd
                  .asMap()
                  .entries
                  .map((e) => ListTile(
                        leading: Icon(
                          Icons.check,
                          color: e.key == lineIndex.value
                              ? Colors.redAccent
                              : Colors.white,
                        ),
                        title: Text(
                          e.value.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          if (e.key != lineIndex.value) {
                            lineIndex.value = e.key;
                          }
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final primaryFormatter = charts.BasicNumericTickFormatterSpec(
        (num? value) => '$value$primaryUnit');
    final secondaryFormatter = charts.BasicNumericTickFormatterSpec(
        (num? value) => '$value$secondaryUnit');
    final primaryMeasureAxis = charts.NumericAxisSpec(
        renderSpec:
            widget.hidePrimaryAxis ? const charts.NoneRenderSpec() : null,
        tickFormatterSpec: primaryFormatter,
        tickProviderSpec: const charts.BasicNumericTickProviderSpec(
            desiredTickCount: 3, zeroBound: false));
    final secondaryMeasureAxis = charts.NumericAxisSpec(
        renderSpec:
            widget.hideSecondaryAxis ? const charts.NoneRenderSpec() : null,
        tickFormatterSpec: secondaryFormatter,
        tickProviderSpec: const charts.BasicNumericTickProviderSpec(
            desiredTickCount: 3, zeroBound: false));
    return SizedBox(
        height: widget.height,
        child: ValueListenableBuilder<bool>(
          builder: (BuildContext context, bool show, Widget? child) {
            return Stack(
              children: [
                child!,
                if (widget.lineData.isNotEmpty &&
                    widget.lineData.first.ys.length > 1)
                  Positioned(
                      top: 0,
                      right: 5,
                      child: IconButton(
                          icon: const Icon(Icons.layers),
                          onPressed: () {
                            _showDialog(widget.lineData.first.ys);
                          })),
                if (show)
                  ValueListenableBuilder<int>(
                      valueListenable: hintIdx,
                      builder: (_, int idx, Widget? child) {
                        return Positioned(
                            top: widget.vertical
                                ? 5
                                : (5.0 +
                                    (widget.height / (primaryAxisLength + 2)) *
                                        (min(primaryAxisLength - 1, idx))),
                            right: widget.vertical
                                ? hoverAlign == 'R'
                                    ? 5
                                    : null
                                : 5,
                            left: widget.vertical
                                ? hoverAlign == 'L'
                                    ? 5
                                    : null
                                : null,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xb3323232),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0,
                                        top: 5,
                                        left: 5,
                                        bottom: 5),
                                    child: ValueListenableBuilder<String>(
                                      builder: (BuildContext _, String content,
                                          Widget? child) {
                                        return Text(
                                          content,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: widget.maskFontSize),
                                        );
                                      },
                                      valueListenable: hoverContent,
                                    ),
                                  ),
                                  Positioned(
                                    child: IconButton(
                                      icon: const Icon(Icons.close),
                                      color: Colors.redAccent,
                                      onPressed: () {
                                        showMask.value = false;
                                      },
                                    ),
                                    right: -10,
                                    top: -10,
                                  )
                                ],
                              ),
                            ));
                      }),
              ],
            );
          },
          child: ValueListenableBuilder<int>(
            builder: (BuildContext _, int lineIndex, Widget? child) {
              if (widget.lineData.isEmpty) {
                return Center(
                  child: widget.loadingWidget ?? const Text('加载中...'),
                );
              } else {
                return charts.BarChart(
                  _makeData<String>(widget.lineData, lineIndex),
                  animate: widget.animate,
                  vertical: widget.vertical,
                  barGroupingType: widget.groupType == 'grouped'
                      ? charts.BarGroupingType.grouped
                      : charts.BarGroupingType.stacked,
                  selectionModels: [
                    charts.SelectionModelConfig(
                        type: charts.SelectionModelType.info,
                        changedListener: _onSelectionChanged)
                  ],
                  behaviors: [
                    if (widget.showLegend)
                      charts.SeriesLegend(
                          position: charts.BehaviorPosition.bottom,
                          desiredMaxColumns: 4,
                          outsideJustification:
                              charts.OutsideJustification.startDrawArea),
                    if (widget.showChartTitle)
                      charts.ChartTitle(
                          widget.lineData.first.ys[lineIndex].title,
                          behaviorPosition: charts.BehaviorPosition.top,
                          titleStyleSpec: charts.TextStyleSpec(
                              fontSize: widget.titleFontSize),
                          titleOutsideJustification:
                              charts.OutsideJustification.start,
                          innerPadding: 18)
                  ],
                  barRendererDecorator: widget.showBarLabel
                      ? charts.BarLabelDecorator<String>()
                      : null,
                  domainAxis: charts.OrdinalAxisSpec(
                    showAxisLine: widget.showAxisLine,
                    renderSpec: widget.hideDomainAxis
                        ? const charts.NoneRenderSpec()
                        : null,
                  ),
                  primaryMeasureAxis: primaryMeasureAxis,
                  secondaryMeasureAxis: secondaryMeasureAxis,
                );
              }
            },
            valueListenable: lineIndex,
          ),
          valueListenable: showMask,
        ));
  }
}

class ChartPie extends StatefulWidget {
  final bool animate;
  final List<ChartLineData> lineData;
  final double height;
  final int titleFontSize;
  final int arcWidth;
  final double maskFontSize;
  final bool showLegend;
  final bool showChartTitle;
  final Widget? loadingWidget;

  const ChartPie(
      {Key? key,
      this.animate = false,
      this.lineData = const [],
      this.height = 200.0,
      this.titleFontSize = 14,
      this.arcWidth = 40,
      this.maskFontSize = 18.0,
      this.showLegend = true,
      this.showChartTitle = true,
      this.loadingWidget})
      : super(key: key);

  factory ChartPie.withChartData(List data,
      {bool animate = false,
      double height = 200.0,
      int titleFontSize = 14,
      int arcWidth = 40,
      double maskFontSize = 18.0,
      bool showLegend = true,
      bool showChartTitle = true,
      Widget? loadingWidget}) {
    var lineData =
        data.map<ChartLineData>((e) => ChartLineData.fromJson(e)).toList();
    return ChartPie(
      lineData: lineData,
      height: height,
      animate: animate,
      arcWidth: arcWidth,
      titleFontSize: titleFontSize,
      maskFontSize: maskFontSize,
      showLegend: showLegend,
      showChartTitle: showChartTitle,
      loadingWidget: loadingWidget,
    );
  }

  @override
  _ChartPieState createState() => _ChartPieState();
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class _ChartPieState extends State<ChartPie> {
  String hoverAlign = 'L';
  final ValueNotifier<int> hintIdx = ValueNotifier<int>(0);
  final ValueNotifier<int> lineIndex = ValueNotifier<int>(0);
  final ValueNotifier<bool> showMask = ValueNotifier<bool>(false);
  final ValueNotifier<String> hoverContent = ValueNotifier<String>('');

  void _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    final List<Map<String, dynamic>> list = [];

    final seriesData = selectedDatum.first.series.data;
    final axisLength = seriesData.length;

    final idx = seriesData
        .map((i) => i.x)
        .toList()
        .indexOf(selectedDatum.first.datum.x);
    String align = 'L';
    if (axisLength / 2 >= idx) {
      align = 'R';
    }

    if (selectedDatum.isNotEmpty) {
      for (var datumPair in selectedDatum) {
        list.add({
          'group_order': datumPair.datum.groupOrder,
          'content':
              '${datumPair.series.displayName}: ${datumPair.datum.yDisplay ?? datumPair.datum.y ?? ''}'
        });
      }
    }

    var hoverTitle = selectedDatum.first.datum.xDisplay;

    List<String> txt = [];
    if (hoverTitle != null) {
      txt.add(hoverTitle);
    }

    list.sort((a, b) => a['group_order'].compareTo(b['group_order']));
    for (var element in list) {
      txt.add('${element['content']}');
    }

    hoverAlign = align;
    hintIdx.value = idx;
    hoverContent.value = txt.join('\n');
    showMask.value = true;
  }

  List<charts.Series<LineSeries, T>> _makeData<T>(
      List<ChartLineData> data, int lineIndex) {
    List<LineSeries> lineData = [];
    String lastGroup = '';
    List<charts.Series<LineSeries, T>> lines = [];
    charts.Series<LineSeries, T> line;
    for (ChartLineData element in data) {
      if (element.groupCode != lastGroup) {
        if (lineData.isNotEmpty) {
          line = makeLine(lineData, element.color != null, lastGroup, 0, 0);
          lines.add(line);
          lineData = [];
        }
        lastGroup = element.groupCode;
      }
      lineData.add(LineSeries<T>.fromChartLineData(element, lineIndex));
    }

    if (lineData.isEmpty) {
      return lines;
    }
    line = makeLine(lineData, data.first.color != null, lastGroup, 0, 0);
    lines.add(line);
    return lines;
  }

  void _showDialog(List<YData> yd) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: yd
                  .asMap()
                  .entries
                  .map((e) => ListTile(
                        leading: Icon(
                          Icons.check,
                          color: e.key == lineIndex.value
                              ? Colors.redAccent
                              : Colors.white,
                        ),
                        title: Text(
                          e.value.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          if (e.key != lineIndex.value) {
                            lineIndex.value = e.key;
                          }
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        child: Stack(
          children: [
            ValueListenableBuilder<int>(
              builder: (BuildContext _, int lineIndex, Widget? child) {
                if (widget.lineData.isEmpty) {
                  return Center(
                    child: widget.loadingWidget ?? const Text('加载中...'),
                  );
                } else if (LineSeries.regMonth
                    .hasMatch(widget.lineData.first.x)) {
                  return charts.PieChart<DateTime>(
                    //https://github.com/google/charts/issues/688
                    _makeData<DateTime>(widget.lineData, lineIndex),
                    animate: widget.animate,
                    defaultRenderer: charts.ArcRendererConfig(
                        arcWidth: widget.arcWidth,
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.outside)
                        ]),
                    selectionModels: [
                      charts.SelectionModelConfig(
                          type: charts.SelectionModelType.info,
                          changedListener: _onSelectionChanged)
                    ],
                    behaviors: [
                      if (widget.showLegend)
                        charts.DatumLegend(
                            position: charts.BehaviorPosition.bottom,
                            horizontalFirst: true,
                            desiredMaxColumns: 4,
                            outsideJustification:
                                charts.OutsideJustification.start),
                      if (widget.showChartTitle)
                        charts.ChartTitle(
                            widget.lineData.first.ys[lineIndex].title,
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleStyleSpec: charts.TextStyleSpec(
                                fontSize: widget.titleFontSize),
                            titleOutsideJustification:
                                charts.OutsideJustification.start,
                            innerPadding: 18)
                    ],
                  );
                } else if (LineSeries.regDay
                    .hasMatch(widget.lineData.first.x)) {
                  return charts.PieChart<int>(
                    _makeData<int>(widget.lineData, lineIndex),
                    animate: widget.animate,
                    defaultRenderer: charts.ArcRendererConfig(
                        arcWidth: widget.arcWidth,
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.outside)
                        ]),
                    selectionModels: [
                      charts.SelectionModelConfig(
                          type: charts.SelectionModelType.info,
                          changedListener: _onSelectionChanged)
                    ],
                    behaviors: [
                      if (widget.showLegend)
                        charts.DatumLegend(
                            position: charts.BehaviorPosition.bottom,
                            horizontalFirst: true,
                            desiredMaxColumns: 4,
                            outsideJustification:
                                charts.OutsideJustification.start),
                      if (widget.showChartTitle)
                        charts.ChartTitle(
                            widget.lineData.first.ys[lineIndex].title,
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleStyleSpec: charts.TextStyleSpec(
                                fontSize: widget.titleFontSize),
                            titleOutsideJustification:
                                charts.OutsideJustification.start,
                            innerPadding: 18)
                    ],
                  );
                } else {
                  return charts.PieChart<String>(
                    _makeData<String>(widget.lineData, lineIndex),
                    animate: widget.animate,
                    defaultRenderer: charts.ArcRendererConfig(
                        arcWidth: widget.arcWidth,
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.outside)
                        ]),
                    selectionModels: [
                      charts.SelectionModelConfig(
                          type: charts.SelectionModelType.info,
                          changedListener: _onSelectionChanged)
                    ],
                    behaviors: [
                      if (widget.showLegend)
                        charts.DatumLegend(
                            position: charts.BehaviorPosition.bottom,
                            horizontalFirst: true,
                            desiredMaxColumns: 3,
                            outsideJustification:
                                charts.OutsideJustification.start),
                      if (widget.showChartTitle)
                        charts.ChartTitle(
                            widget.lineData.first.ys[lineIndex].title,
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleStyleSpec: charts.TextStyleSpec(
                                fontSize: widget.titleFontSize),
                            titleOutsideJustification:
                                charts.OutsideJustification.start,
                            innerPadding: 18)
                    ],
                  );
                }
              },
              valueListenable: lineIndex,
            ),
            ValueListenableBuilder(
              builder: (_, bool show, Widget? child) {
                if (!show) return Container();
                return Positioned(
                    top: 5,
                    right: hoverAlign == 'R' ? 5 : null,
                    left: hoverAlign == 'L' ? 5 : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xb3323232),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0, top: 5, left: 5, bottom: 5),
                            child: ValueListenableBuilder<String>(
                              builder: (BuildContext _, String content,
                                  Widget? child) {
                                return Text(
                                  content,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: widget.maskFontSize),
                                );
                              },
                              valueListenable: hoverContent,
                            ),
                          ),
                          Positioned(
                            child: GestureDetector(
                                onTap: () {
                                  showMask.value = false;
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.redAccent,
                                )),
                            right: 0,
                            top: 3,
                          )
                        ],
                      ),
                    ));
              },
              valueListenable: showMask,
            ),
            if (widget.lineData.isNotEmpty &&
                widget.lineData.first.ys.length > 1)
              Positioned(
                  top: 0,
                  right: 5,
                  child: IconButton(
                      icon: const Icon(Icons.layers),
                      onPressed: () {
                        _showDialog(widget.lineData.first.ys);
                      })),
          ],
        ));
  }
}
