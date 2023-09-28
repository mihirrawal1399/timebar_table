import 'package:flutter/material.dart';

class GridRowBox extends StatelessWidget {
  final double? containerWidth;
  const GridRowBox({
    super.key,
    this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
            ? Text(data.toString(),),
            : const SizedBox.shrink(),
      ),
    );
  }
}