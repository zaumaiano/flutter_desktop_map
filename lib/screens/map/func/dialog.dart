import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_map/screens/map/widgets/location_info.dart';

infoDialog({required BuildContext context, required dynamic pickedLocation}) {
  return showDialog(
    context: context,
    builder: (context) {
      return ContentDialog(
        title: const Text(
          'Ponto Selecionado',
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
        actions: [
          Button(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
