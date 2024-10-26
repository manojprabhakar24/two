import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'drawer_content.dart';
import 'home.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ZoomDrawerController drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0C2740), // First color
            Color(0xff264350), // Second color
            Color(0xff465055), // Third color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ZoomDrawer(
        controller: drawerController,
        menuScreen: MenuDrawer(drawerController: drawerController),
        mainScreen: MainDrawer(drawerController: drawerController),
        borderRadius: 25.0,
        showShadow: false,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            spreadRadius: 12,
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
        angle: -12.0,
        slideWidth: MediaQuery.of(context).size.width * 0.8, // Set the desired width
        slideHeight: MediaQuery.of(context).size.height * 0.10, // Adjust height if needed
      ),
    );
  }}