import 'package:flutter/material.dart';
import 'package:timebar_table/timebar_table.dart';

final DateTime tableStartTime =
    DateTime(2023, 9, 30, 8, 0); // Replace with your start time
final DateTime tableEndTime =
    DateTime(2023, 9, 30, 16, 0); // Replace with your end time
const Duration timeInterval =
    Duration(minutes: 30); // Replace with your time interval
const double intervalWidth = 50.0; // Replace with your interval width

// Define test data in the form of a map where the keys are widgets and the values are lists of BarData.
final Map<Widget, List<BarData?>?> tableDataMap = {
  const Text('Table 1'): [
    BarData(
      dataDuration: const Duration(minutes: 60),
      dataStartTime: DateTime(2023, 9, 30, 9, 0),
      dataWidget: const Text("9am for 60mins"),
    ),
    BarData(
      dataDuration: const Duration(minutes: 90),
      dataStartTime: DateTime(2023, 9, 30, 11, 0),
      dataWidget: const Text("11am for 90mins"),
    ),
  ],
  const Text('Table 2'): [
    BarData(
      dataDuration: const Duration(minutes: 120),
      dataStartTime: DateTime(2023, 9, 30, 10, 30),
      dataWidget: const Text("10am for 120mins"),
    ),
  ],
  const Text('Table 3'): [
    BarData(
      dataDuration: const Duration(minutes: 60),
      dataStartTime: DateTime(2023, 9, 30, 8, 0),
      dataWidget: const Text("8am for 60mins"),
    ),
    BarData(
      dataDuration: const Duration(minutes: 120),
      dataStartTime: DateTime(2023, 9, 30, 11, 30),
      dataWidget: const Text("1130am for 120mins"),
    ),
  ],
  const Text('Table 5'): [
    BarData(
      dataDuration: const Duration(minutes: 120),
      dataStartTime: DateTime(2023, 9, 30, 11, 0),
      dataWidget: const Text("11am for 120mins"),
    ),
    BarData(
      dataDuration: const Duration(minutes: 60),
      dataStartTime: DateTime(2023, 9, 30, 9, 0),
      dataWidget: const Text("9am for 60mins"),
    ),
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
        title: const Text('TimeBarTable Example'),
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
