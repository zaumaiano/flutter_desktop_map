import 'package:flutter_map/flutter_map.dart';
import 'package:fluent_ui/fluent_ui.dart';

markerBuilder({
  required dynamic location,
  required Function onTap,
}) =>
    Marker(
      width: 55.0,
      height: 55.0,
      point: location,
      builder: (ctx) => Tooltip(
        message: 'Localização Selecionada',
        child: GestureDetector(
          child: Image.asset(
            'assets/icons/location-pin.png',
          ),
        ),
      ),
    );
