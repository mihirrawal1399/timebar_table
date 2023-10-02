import 'package:flutter/material.dart';

class TableColumn extends StatelessWidget {
  final List<Widget> widgets;
  const TableColumn({
    Key? key,
    required this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final widget in widgets) ...[
          TableColumnItem(widget: widget),
        ],
      ],
    );
  }
}

class TableColumnItem extends StatelessWidget {
  final Widget widget;

  const TableColumnItem({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: widget,
    );
  }
}
