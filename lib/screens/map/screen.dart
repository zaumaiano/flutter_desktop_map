import 'package:flutter_desktop_map/screens/map/widgets/marker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:latlong2/latlong.dart';
import 'widgets/attribution.dart';
import 'func/dialog.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? pickedLocation;

  @override
  void initState() {
    pickedLocation = LatLng(-8.849163, 13.279163);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: pickedLocation,
            minZoom: 14,
            maxZoom: 18,
            onTap: (tapPos, location) {
              setState(
                () {
                  pickedLocation = LatLng(
                    location.latitude,
                    location.longitude,
                  );
                },
              );
            },
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              attributionBuilder: (_) {
                return const AttributionWidget(
                  description: '© OpenStreetMap contributors',
                );
              },
            ),
            MarkerLayerOptions(
              markers: [
                markerBuilder(
                  location: pickedLocation,
                  onTap: () {
                    infoDialog(
                      context: context,
                      pickedLocation: pickedLocation,
                    );
                  },
                )
              ],
            ),
          ],
        ),
        Positioned(
          right: 1,
          bottom: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: const Icon(
                FluentIcons.map_pin,
                size: 22,
              ),
              style: ButtonStyle(
                backgroundColor: ButtonState.all<Color>(
                  Colors.red,
                ),
                foregroundColor: ButtonState.all<Color>(
                  Colors.white,
                ),
              ),
              onPressed: () {
                infoDialog(
                  context: context,
                  pickedLocation: pickedLocation,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
