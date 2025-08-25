import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> teamMembers = [
      {
        'name': 'Ram Kumar',
        'role': 'Barber',
        'image': 'assets/People/3.jpg',
      },
      {
        'name': 'Shyam Kumar',
        'role': 'Barber',
        'image': 'assets/People/4.jpg',
      },
      {
        'name': 'Raj Kumar',
        'role': 'Hair Stylist',
        'image': 'assets/People/1.jpeg',
      },
      {
        'name': 'Rajesh Kumar',
        'role': 'Hair Stylist',
        'image': 'assets/People/2.jpeg',
      },
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Our Team'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: teamMembers.length,
          itemBuilder: (context, index) {
            final member = teamMembers[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(12),
                             decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [Color(0xFFF8F9FF), Color(0xFFEEF0FF)],
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                 ),
                 borderRadius: BorderRadius.circular(12),
                 boxShadow: [
                   BoxShadow(
                     color: Color(0xFF9B9CFE).withOpacity(0.2),
                     blurRadius: 8,
                     offset: Offset(0, 4),
                     spreadRadius: 1,
                   ),
                 ],
                 border: Border.all(
                   color: Color(0xFF9B9CFE).withOpacity(0.1),
                   width: 1,
                 ),
               ),
              child: Row(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      member['image'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 16),
                  // Name + Role
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        member['role'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
