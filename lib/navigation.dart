import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'listview.dart';
import 'edit.dart';
import 'hal_profil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;

  final icons = [
    Icons.home,
    Icons.group,
    Icons.settings,
    Icons.person,
  ];

  final screens = [
    Center(child: Text('Home')),
    Center(child: Text('Placeholder')), // Placeholder untuk group
    Center(child: Text('Settings Placeholder')),
  ];

  List<Map<String, String>> mahasiswaList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Load data from SharedPreferences
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('mahasiswaList');
    if (data != null) {
      final List decoded = jsonDecode(data);
      setState(() {
        mahasiswaList = decoded.map((e) => Map<String, String>.from(e)).toList();
      });
    }
  }

  // Save data to SharedPreferences
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('mahasiswaList', jsonEncode(mahasiswaList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentIndex == 0
          ? screens[0]
          : screens[2], // fallback jika bukan home
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) async {
          if (index == 1) {
            // Halaman Group → ListViewExample
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListViewExample(mahasiswa: mahasiswaList),
              ),
            );
          } else if (index == 2) {
            // Settings → EditPage
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditPage()),
            );

            if (result != null && result is Map<String, String>) {
              setState(() {
                mahasiswaList.add(result);
              });
              saveData(); // Simpan otomatis setelah input
            }
          } else if (index == 3) {
            // Halaman Profil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HalProfil()),
            );
          } else {
            // Home
            setState(() => currentIndex = index);
          }
        },
      ),
    );
  }
}
