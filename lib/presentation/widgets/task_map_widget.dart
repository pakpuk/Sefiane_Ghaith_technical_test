import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:latlong2/latlong.dart';

class TaskMap extends StatefulWidget {
  const TaskMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  State<TaskMap> createState() => _TaskMapState();
}

class _TaskMapState extends State<TaskMap> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(widget.latitude, widget.longitude),
            initialZoom: 14.0,
            minZoom: 5.0,
            maxZoom: 18.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
              userAgentPackageName: 'com.ghaith.test',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(widget.latitude, widget.longitude),
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.location_on,
                    color: ColorsManager.redAccent,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (_isLoading)
          Container(
            color: ColorsManager.whitecolor.withOpacity(0.8),
            child: const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primary,
              ),
            ),
          ),
      ],
    );
  }
}
