import 'package:flutter_desktop_map/screens/map/widgets/location_info.dart';
import 'package:flutter/material.dart';

infoDialog({required BuildContext context, required dynamic pickedLocation}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          children: const [
            Text(
              'Ponto Selecionado',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            Divider(thickness: 1)
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LocationInfoWidget(
              description: 'Latitude',
              locationPoint: pickedLocation!.latitude,
            ),
            LocationInfoWidget(
              description: 'Longitude',
              locationPoint: pickedLocation!.longitude,
            ),
          ],
        ),
      );
    },
  );
}
