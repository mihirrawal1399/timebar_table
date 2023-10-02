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

  ///start time for the time range header
  final DateTime tableStartTime;

  ///end time for the time range header
  final DateTime tableEndTime;

  ///time intervals which interates from [tableStartTime] to [tableEndTime]
  final Duration timeInterval;

  ///custom empty widget to show if no BarData for perticular time lapse
  final Widget emptyDataWidget;

  const DataRowBuilder({
    Key? key,
    this.barDataList,
    required this.tableStartTime,
    required this.tableEndTime,
    required this.timeInterval,
    required this.emptyDataWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowWidgets = [];
    final currentTime = tableStartTime;

    while (currentTime.isBefore(tableEndTime)) {
      if (barDataList != null) {
        for (final barData in barDataList!) {
          if (barData != null &&
              barData.dataStartTime == currentTime &&
              barData.dataWidget != null) {
            rowWidgets
                .add(barData.dataWidget!); //TODO:replace with custom width
            currentTime.add(barData.dataDuration);
          } else {
            rowWidgets.add(emptyDataWidget);
            currentTime.add(timeInterval);
          }
        }
      }
    }

    return Row(
      children: [
        const GridRowBox(
          containerWidth: 100,
        ),
        ...rowBoxesWidgets,
      ],
    );
  }

  TimeOfDay _addMinutesToTimeOfDay(TimeOfDay time, int minutesToAdd) {
    final minutes = time.minute + minutesToAdd;
    final hoursToAdd = minutes ~/ 60;
    final newHour = (time.hour + hoursToAdd) % 24;
    final newMinute = minutes % 60;
    return TimeOfDay(hour: newHour, minute: newMinute);
  }
}

class GridRowBox extends StatelessWidget {
  final double? containerWidth;
  final ReservationEntity? reservation;
  const GridRowBox({
    super.key,
    this.containerWidth,
    this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (reservation != null) {
          router.go(
            RouteStrings.gridReservationScreen(reservationId: reservation!.id),
          );
        }
      },
      child: Container(
        width: containerWidth,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: reservation != null ? $styles.colors.grey5 : null,
        ),
        child: reservation != null
            ? Row(
                children: [
                  const CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Icons.menu_book_rounded,
                      size: 15,
                    ),
                  ),
                  Text(
                    reservation?.covers.toString() ?? '',
                  ),
                  Text(
                    reservation?.name ?? '',
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
