import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

const arrowSize = 30.0;
const titleColor = Colors.deepOrange;
const titleFontSize = 20.0;
const headerFontSize = 18.0;
const gridFontSize = 16.0;
const currentMonthDayColor = Colors.black;
const otherMonthDayColor = Colors.grey;
const selectedDayColor = Colors.white;
const selectedDayBgColor = Color(0xffff9900);
const todayColor = Colors.orange;

int mSize(y, m) {
  bool leap = (y % 4 == 0 && y % 100 != 0) || (y % 400 == 0);
  return m == 2 ? (leap ? 29 : 28) : ([4, 6, 9, 11].contains(m) ? 30 : 31);
}

DateTime addMonths(DateTime date, int offset) {
  int y = date.year;
  int m = date.month;
  int mA = y * 12 + m + offset;

  y = mA ~/ 12;
  m = mA % 12;
  return DateTime(y, m);
}

class Cal {
  int dCnt = 0, lastMSize = 0, pad = 0, cnt = 0;
  late DateTime date;

  Cal(DateTime date) {
    int y = date.year;
    int m = date.month;
    int dCnt = mSize(y, m);
    DateTime ms = DateTime(y, m, 1);
    int pad = ms.weekday;
    int cnt = dCnt + pad;
    cnt = cnt + (cnt % 7 > 0 ? 7 - cnt % 7 : 0);
    DateTime lastM = addMonths(date, -1);
    int lastMSize = mSize(lastM.year, lastM.month);

    this.dCnt = dCnt;
    this.lastMSize = lastMSize;
    this.pad = pad;
    this.cnt = cnt;
  }

  List getGrid() {
    int cnt = this.cnt;
    int dCnt = this.dCnt;
    int pad = this.pad;
    int lastMSize = this.lastMSize;
    List rows = [];
    for (int i = 0; i < cnt; i++) {
      List row;
      if (rows.isNotEmpty) {
        row = rows[rows.length - 1];
        if (row.length >= 7) {
          row = [];
          rows.add(row);
        }
      } else {
        row = [];
        rows.add(row);
      }

      int v, mOffset;
      if (i < pad) {
        v = lastMSize - (pad - i - 1);
        mOffset = -1;
      } else {
        v = (i - pad) + 1;
        if (v > dCnt) {
          v = v - dCnt;
          mOffset = 1;
        } else {
          mOffset = 0;
        }
      }

      row.add([v, mOffset]);
    }
    return rows;
  }
}

class DatePicker extends StatefulWidget {
  final String date;
  final Function onDateChange;
  final String prefix;
  final bool autoHide;
  const DatePicker({
    Key? key,
    required this.date,
    required this.onDateChange,
    this.autoHide = true,
    this.prefix = '',
  }) : super(key: key);

  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  late DateTime date;
  late DateTime dateEdit;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void onMonthAdd(offset, BuildContext context) {
    jump(offset, dateEdit.day, false, false, context);
  }

  void jump(
      int offset, int _d, bool collapse, bool submit, BuildContext context) {
    DateTime _date = addMonths(dateEdit, offset);
    int mCnt = mSize(_date.year, _date.month);
    if (_d > mCnt) {
      _d = mCnt;
    }
    DateTime dateNew = DateTime(
        _date.year, _date.month, _d, date.hour, date.minute, date.second);
    setState(() {
      dateEdit = dateNew;
    });
    if (submit) {
      setState(() {
        date = dateNew;
      });
      if (widget.onDateChange is Function) {
        widget.onDateChange(dateNew);
      }
    }
    if (collapse && widget.autoHide) {
      timer = Timer(
          const Duration(microseconds: 300), () => Navigator.of(context).pop());
    }
  }

  void onCellTap(offset, _d, context) {
    jump(offset, _d, true, true, context);
  }

  @override
  void initState() {
    super.initState();
    var d = DateTime.parse(widget.date);
    date = d;
    dateEdit = d;
  }

  Widget _expandText(txt) {
    return Expanded(
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: headerFontSize, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget grid() {
    var today = DateTime.now();
    int todayD = today.day;
    int todayYm = today.year * 12 + today.month;
    int y = dateEdit.year;
    int m = dateEdit.month;
    int d = dateEdit.day;
    int sy = date.year;
    int sm = date.month;

    Cal di = Cal(dateEdit);
    var rows = di.getGrid();
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: rows.map<Widget>((l) {
          return Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: l.map<Widget>((v) {
                var v0 = v[0];
                var v1 = v[1];
                Color color;
                if (v1 == 0) {
                  if (d == v0 && y == sy && m == sm) {
                    color = selectedDayColor;
                  } else if (todayD == v0 && todayYm == y * 12 + m) {
                    color = todayColor;
                  } else {
                    color = currentMonthDayColor;
                  }
                } else {
                  color = otherMonthDayColor;
                }
                return Expanded(
                    child: Container(
                  color: (v1 == 0 && y == sy && m == sm && d == v0)
                      ? selectedDayBgColor
                      : null,
                  child: TextButton(
                      onPressed: () => onCellTap(v1, v0, context),
                      child: Center(
                        child: Text('${v[0]}',
                            softWrap: false,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: gridFontSize, color: color)),
                      )),
                ));
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget header = Row(
      children: [
        Expanded(
          child: IconButton(
              icon: const Icon(
                Icons.arrow_left,
                size: arrowSize,
              ),
              onPressed: () => onMonthAdd(-1, context)),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              DateFormat('yyyy-MM-dd').format(dateEdit),
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: titleFontSize, color: titleColor),
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_right,
              size: arrowSize,
            ),
            onPressed: () => onMonthAdd(1, context),
          ),
        )
      ],
    );

    Widget wHead = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _expandText('日'),
        _expandText('一'),
        _expandText('二'),
        _expandText('三'),
        _expandText('四'),
        _expandText('五'),
        _expandText('六'),
      ],
    );

    return Column(
      children: [header, wHead, grid()],
    );
  }
}
