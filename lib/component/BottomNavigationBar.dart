import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
Widget build(BuildContext context) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (index) {
      // Add validation to prevent tapping the current tab
      if (index != currentIndex) {
        onTap(index);
      }
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Detail',
      ),
      // Add other items as needed
    ],
  );
}
}
