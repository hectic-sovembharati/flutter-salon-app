import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../main.dart'; // Import your main.dart where NavigationPage is

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bookingsBox = Hive.box('bookingsBox');

    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Log Out',
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => NavigationPage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome Admin 👋",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ) ??
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: bookingsBox.listenable(),
                  builder: (context, Box box, _) {
                    if (box.isEmpty) {
                      return Center(
                        child: Text(
                          "No bookings yet",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.black54,
                              ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        var booking = box.getAt(index) as Map;
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                              child: Icon(
                                Icons.miscellaneous_services_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            title: Text(
                              booking['service'],
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              "Day: ${booking['day'] ?? '-'}  ·  Time: ${booking['time']}  ·  Duration: ${booking['duration']}",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black54,
                                  ),
                            ),
                            trailing: Chip(
                              label: Text("\$${booking['price']}"),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
