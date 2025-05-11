import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/projects_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'controllers/navigation_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.put(NavigationController());

    final screens = [
      const AboutScreen(),
      const ProjectsScreen(),
      const ContactScreen(),
    ];

    return Scaffold(
      body: Obx(() => screens[navigationController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: navigationController.currentIndex.value,
          onDestinationSelected: navigationController.changePage,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'About',
            ),
            NavigationDestination(
              icon: Icon(Icons.work_outline),
              selectedIcon: Icon(Icons.work),
              label: 'Projects',
            ),
            NavigationDestination(
              icon: Icon(Icons.contact_mail_outlined),
              selectedIcon: Icon(Icons.contact_mail),
              label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}
