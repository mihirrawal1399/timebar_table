library timebar_table;

import 'package:flutter/material.dart';
import 'package:timebar_table/src/data_section.dart';

import 'src/table_column.dart';
import 'src/time_row.dart';

class TimeBarTable extends StatelessWidget {
  ///start time for the time range header
  final DateTime tableStartTime;

  ///end time for the time range header
  final DateTime tableEndTime;

  ///time intervals which interates from [tableStartTime] to [tableEndTime]
  final Duration timeInterval;

  ///width of the each [timeInterval]
  final double intervalWidth;

  ///no. of rows will be dependent on no. of keys of [tableDataList],
  ///and each row can have any list of [BarData] for given key.
  final Map<Widget, List<BarData?>?> tableDataList;

  const TimeBarTable({
    Key? key,
    required this.tableStartTime,
    required this.tableEndTime,
    required this.timeInterval,
    required this.intervalWidth,
    required this.tableDataList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: use slivers to implement custom scroll views making the main axises persistent scrollable.
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //the header row of the TimeBarTable which shows the time slots from [tableStartTime] to [tableEndTime] by [timeInterval]
              TimeRow(
                tableStartTime: tableStartTime,
                tableEndTime: tableEndTime,
                timeInterval: timeInterval,
                intervalWidth: intervalWidth,
              ),
              const DataSection(),
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 0,
          child: TableColumn(
            widgets: tableDataList.keys.toList(),
          ),
        ),
      ],
    );
  }
}

class BarData {
  final Duration dataDuration;
  final DateTime dataStartTime;
  final Widget? dataWidget;

  const BarData({
    required this.dataDuration,
    required this.dataStartTime,
    this.dataWidget,
  });
}
