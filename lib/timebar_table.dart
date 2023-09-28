library timebar_table;

import 'package:flutter/material.dart';

import 'src/time_row.dart';

class TimeBarTable extends StatelessWidget {
  ///start time for the time range header
  final DateTime startTime;

  ///end time for the time range header
  final DateTime endTime;

  ///time intervals which interates from [startTime] to [endTime]
  final Duration timeInterval;

  ///width of the each [timeInterval]
  final double intervalWidth;

  const TimeBarTable({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.timeInterval,
    required this.intervalWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeRow(
            startTime: startTime,
            endTime: endTime,
            timeInterval: timeInterval,
            intervalWidth: intervalWidth,
          ),
        ],
      ),
    );
  }
}
