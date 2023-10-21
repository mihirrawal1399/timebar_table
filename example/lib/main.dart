import 'package:flutter/material.dart';
import 'package:timebar_table/timebar_table.dart';

final DateTime tableStartTime =
    DateTime(2023, 9, 30, 8, 0); // Replace with your start time
final DateTime tableEndTime =
    DateTime(2023, 9, 30, 16, 0); // Replace with your end time
final Duration timeInterval =
    Duration(minutes: 30); // Replace with your time interval
final double intervalWidth = 50.0; // Replace with your interval width

// Define test data in the form of a map where the keys are widgets and the values are lists of BarData.
final Map<Widget, List<BarData?>?> tableDataMap = {
  Text('Table 1'): [
    BarData(
        dataDuration: Duration(minutes: 60),
        dataStartTime: DateTime(2023, 9, 30, 9, 0)),
    BarData(
        dataDuration: Duration(minutes: 90),
        dataStartTime: DateTime(2023, 9, 30, 11, 0)),
  ],
  Text('Table 2'): [
    BarData(
        dataDuration: Duration(minutes: 120),
        dataStartTime: DateTime(2023, 9, 30, 10, 0)),
  ],
  // Add more test data as needed
};

final Widget emptyDataWidget = Container(
  width: intervalWidth,
  color: Colors.grey,
);
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('TimeBarTable Example'),
      ),
      body: TimeBarTable(
        tableStartTime: tableStartTime,
        tableEndTime: tableEndTime,
        timeInterval: timeInterval,
        intervalWidth: intervalWidth,
        tableDataList: tableDataMap,
        emptyDataWidget: emptyDataWidget,
      ),
    ),
  ));
}
