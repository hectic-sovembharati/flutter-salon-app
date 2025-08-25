import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Pages/home.dart';
import 'Pages/team.dart';
import 'Pages/services.dart';
import 'Pages/login.dart';
import 'Pages/admin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Open necessary boxes
  await Hive.openBox('adminBox');
  await Hive.openBox('bookingsBox'); // Box for saving bookings

  // Add default admin credentials only once
  var adminBox = Hive.box('adminBox');
  if (!adminBox.containsKey('username')) {
    adminBox.put('username', 'admin');
    adminBox.put('password', '1234');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      TeamPage(),
      ServicesPage(),
      LoginPage(
        onLoginSuccess: () {
          setState(() {
            _currentIndex = 4; // go to Admin Page after login
          });
        },
      ),
      AdminPage(),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: _currentIndex == 4
          ? null // hide bottom nav on AdminPage
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Team'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.content_cut), label: 'Services'),
                BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
              ],
            ),
    );
  }
}
