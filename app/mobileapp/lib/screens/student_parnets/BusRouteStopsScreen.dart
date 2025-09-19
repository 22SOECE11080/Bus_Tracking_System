import 'package:flutter/material.dart';

class BusRouteStopsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> stops; // Stop name, expected & actual time

  const BusRouteStopsScreen({Key? key, required this.stops}) : super(key: key);

  @override
  _BusRouteStopsScreenState createState() => _BusRouteStopsScreenState();
}

class _BusRouteStopsScreenState extends State<BusRouteStopsScreen> {
  int currentStopIndex = 2; // ✅ Example: reached up to stop 3

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // 🌈 Gradient Header
          Container(
            width: double.infinity,
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
            child: const Text(
              "🚌 Bus Route & Stops",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // 🚏 Stops List with progress
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: widget.stops.length,
              itemBuilder: (context, index) {
                final stop = widget.stops[index];
                final reached = index <= currentStopIndex;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          reached ? Colors.green : Colors.grey.shade300,
                      child: Icon(
                        reached ? Icons.check : Icons.location_on,
                        color: reached ? Colors.white : Colors.deepPurple,
                      ),
                    ),
                    title: Text(
                      stop['name'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Exp: ${stop['expected']}"),
                        Text(
                          "Act: ${stop['actual'] ?? '-'}",
                          style: TextStyle(
                            color: stop['actual'] == stop['expected']
                                ? Colors.green
                                : Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
