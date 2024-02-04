import 'package:fluent_hands/features/home/ui/main_ui/home_screen.dart';
import 'package:fluent_hands/features/learn/ui/main_ui/learn_screen.dart';
import 'package:fluent_hands/features/profile/ui/main_ui/profile_screen.dart';
import 'package:fluent_hands/features/settings/ui/main_ui/settings_screen.dart';
import 'package:fluent_hands/layout/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    LearnScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
