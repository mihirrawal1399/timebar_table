import 'package:flutter/material.dart';

class DataSection extends StatelessWidget {
  const DataSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of table IDs from 1 to 10
    final tableIds = List.generate(10, (index) => (index + 1).toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final tableId in tableIds) ...[
          GridRowBuilder(
            tableId: tableId,
          ),
        ],
      ],
    );
  }
}

class GridRowBuilder extends StatelessWidget {
  final String? tableId;

  const GridRowBuilder({
    Key? key,
    required this.tableId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reservations =
        context.select((ReservationsCubit value) => value.state.reservations);

    // Define the start and end times
    const startTime = TimeOfDay(hour: 7, minute: 30);
    const endTime = TimeOfDay(hour: 12, minute: 30);

    final rowBoxesWidgets = <Widget>[];
    var currentTime = startTime;

    while (currentTime != (endTime)) {
      final reservation = reservations.firstWhereOrNull(
        (res) {
          final resStartTimeInMinutes = res.time!.hour * 60 + res.time!.minute;
          final resEndTimeInMinutes =
              resStartTimeInMinutes + res.duration!.inMinutes;
          final currentTimeInMinutes =
              currentTime.hour * 60 + currentTime.minute;

          return res.tableEntity?.id == tableId &&
              resStartTimeInMinutes <= currentTimeInMinutes &&
              resEndTimeInMinutes > currentTimeInMinutes;
        },
      );

      final containerWidth = reservation != null
          ? (reservation.duration!.inMinutes / 30) * 50.0
          : 50.0;

      rowBoxesWidgets.add(
        GridRowBox(
          containerWidth: containerWidth,
          reservation: reservation,
        ),
      );

      if (reservation != null) {
        currentTime = _addMinutesToTimeOfDay(
            currentTime, reservation.duration!.inMinutes);
      } else {
        currentTime = _addMinutesToTimeOfDay(currentTime, 30);
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
                  SizedBoxWidth6,
                  const CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Icons.menu_book_rounded,
                      size: 15,
                    ),
                  ),
                  SizedBoxWidth6,
                  Text(
                    reservation?.covers.toString() ?? '',
                    style: $styles.text.lato12_700Black,
                  ),
                  SizedBoxWidth6,
                  Text(
                    reservation?.name ?? '',
                    style: $styles.text.lato12_400,
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
