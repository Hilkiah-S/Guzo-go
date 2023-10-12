import 'package:flutter/material.dart';
import 'package:guzo/global/variables.dart';

class CustomBottomBar extends StatefulWidget {
  final TabController controller;

  const CustomBottomBar({
    required this.controller,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  // Helper function to reset all navbar variables
  void _resetNavBar() {
    searchnavbar = false;
    booknavbar = false;
    notificationchnavbar = false;
    settingnavbar = false;
  }

  // Helper function to build a navbar item
  Widget _buildNavBarItem(
      bool isSelected, IconData icon, String label, Function onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _resetNavBar();
              onTap();
            });
          },
          child: Icon(
            icon,
            size: 32,
            color: isSelected ? Colors.deepPurple : Colors.grey,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: isSelected ? Colors.deepPurple : Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavBarItem(searchnavbar, Icons.search, "Search", () {
            searchnavbar = true;
            widget.controller.animateTo(0);
          }),
          _buildNavBarItem(booknavbar, Icons.work, "Booking", () {
            booknavbar = true;
            widget.controller.animateTo(1);
          }),
          _buildNavBarItem(
              notificationchnavbar, Icons.notifications, "Notifications", () {
            notificationchnavbar = true;
            widget.controller.animateTo(2);
          }),
          _buildNavBarItem(settingnavbar, Icons.settings, "Setting", () {
            settingnavbar = true;
            widget.controller.animateTo(3);
          }),
        ],
      ),
    );
  }
}
