import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobileapp/routes/routes.dart';

class DriverTrackingScreen extends StatefulWidget {
  final List<Map<String, dynamic>> stops;
  const DriverTrackingScreen({super.key, required this.stops});

  @override
  State<DriverTrackingScreen> createState() => _DriverTrackingScreenState();
}

class _DriverTrackingScreenState extends State<DriverTrackingScreen> {
  int currentStopIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentStop = widget.stops[currentStopIndex];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // ===== Gradient AppBar =====
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Live Tracking"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFFC67C4E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Tracking your route in real-time 🗺️",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),

              // ===== Map Card with OpenStreetMap =====
              Expanded(
                child: _buildGradientCard(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter:
                            LatLng(22.3072, 73.1812), // Example: Vadodara
                        initialZoom: 14,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(22.3039, 70.8022),
                              width: 120,
                              height: 60,
                              child: Column(
                                children: [
                                  // 🔹 Bus ID Tag
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF0F0C29),
                                          Color(0xFFC67C4E)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 4,
                                          offset: const Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Text(
                                      "BUS-1024", // Example Bus ID
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),

                                  // 🔹 Location Pin Icon
                                  const Icon(
                                    Icons.location_on,
                                    size: 36,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ===== Current Stop Card =====
              _buildGradientCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Next Stop:",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      currentStop['stop'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text("Time: ${currentStop['time']}"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ===== Action Buttons =====
              Row(
                children: [
                  Expanded(
                    child: _buildGradientButton(
                      label: "Mark Stop Complete",
                      gradientColors: const [
                        Color(0xFF0F0C29),
                        Color(0xFFC67C4E)
                      ],
                      onPressed: () {
                        setState(() {
                          if (currentStopIndex < widget.stops.length - 1) {
                            currentStopIndex++;
                          } else {
                            Navigator.pushNamed(context, AppRoutes.endTrip,
                                arguments: widget.stops);
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildGradientButton(
                      label: "End Trip",
                      gradientColors: const [Colors.red, Colors.redAccent],
                      onPressed: () {
                        Navigator.pushNamed(context, "/end-trip",
                            arguments: widget.stops);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Gradient Border Card
  Widget _buildGradientCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFFC67C4E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(2), // border thickness
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  /// 🔹 Gradient Button
  Widget _buildGradientButton({
    required String label,
    required List<Color> gradientColors,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
