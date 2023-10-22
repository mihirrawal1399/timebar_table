import 'package:flutter/material.dart';

class TimeRow extends StatelessWidget {
  const TimeRow({
    super.key,
    required this.tableStartTime,
    required this.tableEndTime,
    required this.timeInterval,
    required this.intervalWidth,
  });

  ///start time for the time range header
  final DateTime tableStartTime;

  ///end time for the time range header
  final DateTime tableEndTime;

  ///time intervals which interates from [tableStartTime] to [tableEndTime]
  final Duration timeInterval;

  ///width of the each [timeInterval]
  final double intervalWidth;

  @override
  Widget build(BuildContext context) {
    List<Widget> timeRowItems = [];

    // Loop through time intervals from tableStartTime to tableEndTime
    DateTime currentTime = tableStartTime;
    while (currentTime.isBefore(tableEndTime)) {
      final endTime = currentTime.add(timeInterval);
      final timeText =
          '${currentTime.hour}:${currentTime.minute.toString().padLeft(2, '0')} - ${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}';
      timeRowItems.add(
        TimeRowItem(
          intervalWidth: intervalWidth,
          text: timeText,
        ),
      );

      // Move to the next time interval
      currentTime = currentTime.add(timeInterval);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
        ),
        ...timeRowItems,
      ],
    );
  }
}

class TimeRowItem extends StatelessWidget {
  final String text;
  final double intervalWidth;

  const TimeRowItem({
    required this.text,
    required this.intervalWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: intervalWidth,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        text,
      ),
    );
  }
}
