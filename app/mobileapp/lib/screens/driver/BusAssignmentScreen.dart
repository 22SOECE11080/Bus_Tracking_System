import 'package:flutter/material.dart';

class BusAssignmentScreen extends StatefulWidget {
  final Map<String, dynamic> busData;
  const BusAssignmentScreen({super.key, required this.busData});

  @override
  State<BusAssignmentScreen> createState() => _BusAssignmentScreenState();
}

class _BusAssignmentScreenState extends State<BusAssignmentScreen> {
  late List<Map<String, dynamic>> stops;

  @override
  void initState() {
    super.initState();
    // Deep copy stops
    stops = (widget.busData['route'] as List)
        .map((s) => {
              "stop": s['stop'].toString(),
              "time": s['time'].toString(),
            })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bus Assignment"),
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
              const SizedBox(height: 10),
              Text(
                "Your Bus Details 🚍",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              // ✅ Bus Info Card with gradient border + elevation
              _buildGradientCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bus ID: ${widget.busData['busId']}",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Bus No: ${widget.busData['busNumber']}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ✅ Stops List with gradient border + elevation
              Expanded(
                child: ListView.builder(
                  itemCount: stops.length,
                  itemBuilder: (context, index) {
                    var stop = stops[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: _buildGradientCard(
                        child: ListTile(
                          title: Text(
                            stop['stop'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            stop['time'],
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Start Trip Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/driver-tracking",
                      arguments: stops,
                    );
                  },
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0F0C29), Color(0xFFC67C4E)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Start Trip",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 Reusable method for cards with gradient border + elevation
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
        margin: const EdgeInsets.all(2), // 👈 thickness of gradient border
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, // card background
          borderRadius: BorderRadius.circular(18), // slightly smaller radius
        ),
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
