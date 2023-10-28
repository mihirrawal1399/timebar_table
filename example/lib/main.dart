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
      dataWidget: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.red,
        ),
        child: const Center(
          child: Text(
            "9am for 60mins",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
    BarData(
      dataDuration: const Duration(minutes: 90),
      dataStartTime: DateTime(2023, 9, 30, 11, 0),
      dataWidget: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        child: const Center(
          child: Text(
            "11am for 90mins",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    ),
  ],
  const Text('Table 2'): [
    BarData(
      dataDuration: const Duration(minutes: 120),
      dataStartTime: DateTime(2023, 9, 30, 10, 30),
      dataWidget: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 4,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(4),
          color: Colors.green,
        ),
        child: const Center(
          child: Text(
            "10am for 120mins",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  ],
  const Text('Table 3'): [
    BarData(
      dataDuration: const Duration(minutes: 60),
      dataStartTime: DateTime(2023, 9, 30, 8, 0),
      dataWidget: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(32),
          color: Colors.blue,
        ),
        child: const Center(
          child: Text(
            "8am for 60mins",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ),
    BarData(
      dataDuration: const Duration(minutes: 120),
      dataStartTime: DateTime(2023, 9, 30, 11, 30),
      dataWidget: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 4,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(6),
          color: Colors.red,
        ),
        child: const Center(
          child: Text(
            "1130am for 120mins",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ),
  ],
  const Text('Table 5'): [
    BarData(
      dataDuration: const Duration(minutes: 120),
      dataStartTime: DateTime(2023, 9, 30, 11, 0),
      dataWidget: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 4,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(6),
          color: Colors.yellow,
        ),
        child: const Center(
          child: Text(
            "11am for 120mins",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    ),
    BarData(
      dataDuration: const Duration(minutes: 60),
      dataStartTime: DateTime(2023, 9, 30, 9, 0),
      dataWidget: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 4,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(6),
          color: Colors.orange,
        ),
        child: const Center(
          child: Text(
            "9am for 60mins",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    ),
  ],
  // Add more test data as needed
};

final Widget emptyDataWidget = Container(
  width: intervalWidth,
  decoration: BoxDecoration(
    border: Border.all(),
    color: Colors.red,
  ),
  padding: const EdgeInsets.all(2),
  child: Container(
    color: Colors.lightGreen,
  ),
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
