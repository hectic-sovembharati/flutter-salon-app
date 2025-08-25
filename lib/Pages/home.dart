import 'package:flutter/material.dart';
import 'services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        'name': 'Haircut',
        'image': 'assets/Services/1.jpg',
      },
      {
        'name': 'Beard Trim',
        'image': 'assets/Services/2.jpg',
      },
      {
        'name': 'Hair Color',
        'image': 'assets/Services/3.jpg',
      },
      {
        'name': 'Facial',
        'image': 'assets/Services/4.jpg',
      },
    ];

    final List<Map<String, dynamic>> haircuts = [
      {'name': 'Low-Fade', 'image': 'assets/Haircuts/1.jpg'},
      {'name': 'Mid-Fade', 'image': 'assets/Haircuts/2.jpg'},
      {'name': 'Mullet', 'image': 'assets/Haircuts/3.jpg'},
      {'name': 'Buzz Cut', 'image': 'assets/Haircuts/4.jpg'},
      {'name': 'Fade', 'image': 'assets/Haircuts/5.jpg'},
      {'name': 'Undercut', 'image': 'assets/Haircuts/6.jpg'},
    ];

    final List<Map<String, dynamic>> offers = [
      {
        'title': 'Haircut + Beard Trim',
        'price': 'NRS 1000',
        'desc': 'Get a stylish haircut and a perfect beard trim together.'
      },
      {
        'title': 'Hair Color + Facial',
        'price': 'NRS 1500',
        'desc': 'Refresh your look with premium hair color and skin glow.'
      },
      {
        'title': 'Full Grooming Pack',
        'price': 'NRS 2500',
        'desc': 'Complete salon experience with haircut, beard, and facial.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 32.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hello section
                Text(
                  'Hello 👋',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                // Welcome banner
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF9B9CFE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to Our Salon',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Experience the art of beauty and relaxation with our professional services.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Book your appointment today!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Services Section
                Text(
                  'Our Services 💼',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServicesPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 160,
                          margin: EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  services[index]['image'],
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                services[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20),

                // Haircuts Section
                Text(
                  'Best Haircuts 🔥',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: haircuts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160,
                        margin: EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                                                              child: Image.asset(
                                  haircuts[index]['image'],
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              haircuts[index]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20),

                                 // Offers Section
                 Text(
                   'Our Offers 🎉',
                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                 ),
                 SizedBox(height: 20),
                 
                 // Offers Banner
                 Container(
                   width: double.infinity,
                   height: 220,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                       colors: [
                         Color(0xFFFF6B6B),
                         Color(0xFFFF8E53),
                       ],
                     ),
                     borderRadius: BorderRadius.circular(16),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.1),
                         blurRadius: 10,
                         offset: Offset(0, 5),
                       ),
                     ],
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(24.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             Icon(
                               Icons.local_offer,
                               color: Colors.white,
                               size: 28,
                             ),
                             SizedBox(width: 12),
                             Text(
                               'SPECIAL OFFER',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 letterSpacing: 1.2,
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 15),
                         Text(
                           'Haircut + Beard Trim',
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(height: 8),
                         Text(
                           'Get both services together and save big!',
                           style: TextStyle(
                             color: Colors.white.withOpacity(0.9),
                             fontSize: 16,
                           ),
                         ),
                         SizedBox(height: 16),
                         Row(
                           children: [
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20),
                               ),
                                                               child: Text(
                                  'NRS 1000 Only',
                                  style: TextStyle(
                                    color: Color(0xFFFF6B6B),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                             ),
                             Spacer(),
                                                           Text(
                                'Save NRS 300',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
                 
                 
               ],
             ),
           ],
         ),
       ),
     );
   }
 }
