import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/screens/agent_screen.dart';
import 'package:mini_projects_valorant/screens/login_screen.dart';
import 'package:mini_projects_valorant/screens/map_screen.dart';
import 'package:mini_projects_valorant/screens/weapon_screen.dart';
import 'package:mini_projects_valorant/utility/shared_preferences.dart';

import 'theme/font_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget screenBottomNavigation(int index) {
    if (index == 0) {
      return const AgentScreen();
    } else if (index == 1) {
      return const WeaponScreen();
    } else if (index == 2) {
      return const MapScreen();
    } else {
      return const Center(child: Text('Index Screen Belum Terpasang'));
    }
  }

  Widget titleScreen(int index) {
    if (index == 0) {
      return Text(
        'Agents',
        style: valorantStyle.copyWith(
          fontSize: 20,
        ),
      );
    } else if (index == 1) {
      return Text(
        'Weapons',
        style: valorantStyle.copyWith(
          fontSize: 20,
        ),
      );
    } else if (index == 1) {
      return Text(
        'Maps',
        style: valorantStyle.copyWith(
          fontSize: 20,
        ),
      );
    } else {
      return Text(
        'VALORANT',
        style: valorantStyle.copyWith(
          fontSize: 20,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F131F),
        title: titleScreen(_selectedIndex),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false);
              removeToken();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        centerTitle: true,
      ),
      body: screenBottomNavigation(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 3),
              height: 23,
              width: 23,
              child: Image.asset("assets/images/agents.png"),
            ),
            label: 'Agents',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 3),
              height: 23,
              width: 23,
              child: Image.asset("assets/images/weapons.png"),
            ),
            label: 'Weapons',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 3),
              height: 23,
              width: 23,
              child: Image.asset("assets/images/map.png"),
            ),
            label: 'Maps',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0F131F),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
