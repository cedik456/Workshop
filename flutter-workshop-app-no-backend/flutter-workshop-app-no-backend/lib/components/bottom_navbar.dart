import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/screens.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  List<Widget> screens = const [
    HomePage(),
    SearchPage(),
    SizedBox(),
    NotificationsPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: screens[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 3
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFB8B8B8),
        onTap: (int index) {
          if (index == 2) {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const FractionallySizedBox(
                  heightFactor: 0.97,
                  child: CreatePostPage(),
                );
              },
              backgroundColor: Colors.white,
              isScrollControlled: true,
              useSafeArea: true,
            );
          } else {
            setState(() {
              selectedIndex = index;
            });
          }
        },
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }
}
