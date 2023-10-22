import 'package:flutter/material.dart';
import 'package:timebar_table/src/firstWhereOrNull_extension.dart';

import '../timebar_table.dart';

class DataSection extends StatelessWidget {
  final Map<Widget, List<BarData?>?> tableDataMap;

  ///width of the each [timeInterval]
  final double intervalWidth;

  ///start time for the time range header
  final DateTime tableStartTime;

  ///end time for the time range header
  final DateTime tableEndTime;

  ///time intervals which interates from [tableStartTime] to [tableEndTime]
  final Duration timeInterval;

  ///custom empty widget to show if no BarData for perticular time lapse
  final Widget emptyDataWidget;

  const DataSection({
    Key? key,
    required this.tableDataMap,
    required this.intervalWidth,
    required this.tableStartTime,
    required this.tableEndTime,
    required this.timeInterval,
    required this.emptyDataWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in tableDataMap.entries) ...[
          DataRowBuilder(
            intervalWidth: intervalWidth,
            tableStartTime: tableStartTime,
            tableEndTime: tableEndTime,
            timeInterval: timeInterval,
            barDataList: entry.value,
            emptyDataWidget: emptyDataWidget,
          ),
        ],
      ],
    );
  }
}

class DataRowBuilder extends StatelessWidget {
  final List<BarData?>? barDataList;
  final DateTime tableStartTime;
  final DateTime tableEndTime;
  final Duration timeInterval;
  final Widget emptyDataWidget;
  final double intervalWidth;

  const DataRowBuilder({
    Key? key,
    this.barDataList,
    required this.tableStartTime,
    required this.tableEndTime,
    required this.timeInterval,
    required this.emptyDataWidget,
    required this.intervalWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowWidgets = [];
    DateTime currentTime = tableStartTime;

    while (currentTime.isBefore(tableEndTime)) {
      if (barDataList != null) {
        // Check if there is a matching element in barDataList
        final matchingData = barDataList?.firstWhereOrNull((data) {
          return data != null &&
              (data.dataStartTime.isAtSameMomentAs(currentTime) ||
                  data.dataStartTime.isBefore(currentTime)) &&
              data.dataStartTime.add(data.dataDuration).isAfter(currentTime);
        });

        if (matchingData != null) {
          // Calculate the width based on the ratio of its duration to the time interval
          final durationRatio =
              matchingData.dataDuration.inMinutes / timeInterval.inMinutes;
          final barDataWidth = durationRatio * intervalWidth;

          rowWidgets.add(BarDataWidget(
            containerWidth: barDataWidth,
            customWidget: matchingData.dataWidget,
            emptyWidget: emptyDataWidget,
          ));
          currentTime =
              matchingData.dataStartTime.add(matchingData.dataDuration);
        } else {
          // Add an empty BarDataWidget
          rowWidgets.add(BarDataWidget(
            containerWidth: intervalWidth,
            emptyWidget: emptyDataWidget,
          ));
          currentTime = currentTime.add(timeInterval);
        }
      } else {
        rowWidgets.add(BarDataWidget(
          containerWidth: intervalWidth,
          emptyWidget: emptyDataWidget,
        ));
        currentTime = currentTime.add(timeInterval);
      }
    }

    return Row(
      children: [
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
        ),
        ...rowWidgets,
      ],
    );
  }
}

class BarDataWidget extends StatelessWidget {
  final double containerWidth;
  final Widget? customWidget;
  final Widget? emptyWidget;
  const BarDataWidget({
    super.key,
    required this.containerWidth,
    this.customWidget,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: 50,
      alignment: Alignment.center,
      child: customWidget ?? emptyWidget,
    );
  }
}
