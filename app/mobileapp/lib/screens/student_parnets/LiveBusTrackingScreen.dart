import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LiveBusTrackingScreen extends StatefulWidget {
  final List<String> stops; // ✅ Accept stops from routes.dart

  const LiveBusTrackingScreen({Key? key, required this.stops})
      : super(key: key);

  @override
  _LiveBusTrackingScreenState createState() => _LiveBusTrackingScreenState();
}

class _LiveBusTrackingScreenState extends State<LiveBusTrackingScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Dummy bus data with ETA
  final List<Map<String, dynamic>> buses = [
    {
      "id": "Bus 101",
      "lat": 23.0225,
      "lng": 72.5714,
      "eta": "10 min",
      "color": Colors.blue
    },
    {
      "id": "Bus 102",
      "lat": 23.0300,
      "lng": 72.5800,
      "eta": "15 min",
      "color": Colors.green
    },
    {
      "id": "Bus 103",
      "lat": 23.0150,
      "lng": 72.5650,
      "eta": "20 min",
      "color": Colors.orange
    },
  ];

  // Dummy route stops (coordinates)
  final List<LatLng> stopsCoordinates = [
    LatLng(23.0225, 72.5714),
    LatLng(23.0255, 72.5750),
    LatLng(23.0280, 72.5785),
  ];

  String? selectedBus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // light background
      body: Column(
        children: [
          // 🌈 Gradient Header with Search Bar
          Container(
            padding:
                const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F0C29),
                  Color(0xFF302B63),
                  Color(0xFFC67C4E)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "🚍 Live Bus Tracking",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search Bus by ID / Route...",
                    hintStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedBus = value.isEmpty ? null : value;
                    });
                  },
                ),
              ],
            ),
          ),

          // 🗺️ Map with Glass Effect
          Expanded(
            flex: 2,
            child: Card(
              margin: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              elevation: 6,
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(23.0225, 72.5714),
                  initialZoom: 13.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),

                  // 📍 Bus Markers
                  MarkerLayer(
                    markers: buses
                        .where((bus) =>
                            selectedBus == null ||
                            bus["id"]
                                .toLowerCase()
                                .contains(selectedBus!.toLowerCase()))
                        .map((bus) {
                      final isSelected = selectedBus != null &&
                          bus["id"]
                              .toLowerCase()
                              .contains(selectedBus!.toLowerCase());
                      return Marker(
                        point: LatLng(bus["lat"], bus["lng"]),
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () => _showBusDetails(bus),
                          child: Icon(
                            Icons.directions_bus,
                            size: isSelected ? 42 : 32,
                            color: isSelected ? Colors.red : bus["color"],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  // 🚏 Stop Markers
                  MarkerLayer(
                    markers: stopsCoordinates
                        .map((stop) => Marker(
                              point: stop,
                              width: 20,
                              height: 20,
                              child: const Icon(Icons.location_on,
                                  color: Colors.green, size: 20),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),

          // 🚏 Route Stops List
          Expanded(
            flex: 1,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      color: Color(0xFF302B63),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: const Text(
                      "📍 Route Stops",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  // List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: widget.stops.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepPurple.shade100,
                              child: const Icon(Icons.location_on,
                                  color: Colors.deepPurple),
                            ),
                            title: Text(widget.stops[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bus details popup
  void _showBusDetails(Map<String, dynamic> bus) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.directions_bus, color: bus['color'], size: 28),
                const SizedBox(width: 10),
                Text(
                  "Bus ID: ${bus['id']}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text("📍 Location: ${bus['lat']}, ${bus['lng']}"),
            Text("⏱ ETA: ${bus['eta']}"),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF302B63),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
