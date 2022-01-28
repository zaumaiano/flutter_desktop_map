import 'package:flutter/material.dart';

class LocationInfoWidget extends StatelessWidget {
  const LocationInfoWidget({
    Key? key,
    required this.locationPoint,
    required this.description,
  }) : super(key: key);

  final String description;
  final double locationPoint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$description: ',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          locationPoint.toStringAsFixed(6),
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
