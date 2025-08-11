import 'package:flutter/material.dart';
import 'package:savior/app_colors.dart';
import 'package:savior/emergency_page.dart';
import 'package:savior/home_page.dart';
import 'package:savior/login_page.dart';
import 'package:savior/notification_page.dart';
import 'package:savior/settings_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive Design',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatefulWidget{
  @override
  BottomNavScreenState createState()=> BottomNavScreenState();

}
class BottomNavScreenState extends State<BottomNavScreen>{
  int SelectedPage = 0;
  final List pages = [
    HomePage(),
    EmergencyPage(),
    NotificationPage(),
    SettingsPage(),
  ];

  void onItemTapped(int index){
    setState(() {
      SelectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: pages[SelectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedPage,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.color2,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department_rounded),label: 'Emergency'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),



        ],
      ),
    );
  }
}
