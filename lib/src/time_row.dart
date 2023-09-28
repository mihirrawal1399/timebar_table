import 'package:flutter/material.dart';

class TimeRow extends StatelessWidget {
  const TimeRow({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.timeInterval,
    required this.intervalWidth,
  });

  ///start time for the time range header
  final DateTime startTime;

  ///end time for the time range header
  final DateTime endTime;

  ///time intervals which interates from [startTime] to [endTime]
  final Duration timeInterval;

  ///width of the each [timeInterval]
  final double intervalWidth;

  @override
  Widget build(BuildContext context) {
    List<Widget> timeRowItems = [];

    // Loop through time intervals from startTime to endTime
    DateTime currentTime = startTime;
    while (currentTime.isBefore(endTime)) {
      timeRowItems.add(
        TimeRowItem(
          intervalWidth: intervalWidth,
          text:
              '${currentTime.hour}:${currentTime.minute.toString().padLeft(2, '0')}',
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
