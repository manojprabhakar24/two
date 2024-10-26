import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:two/signin.dart';

import 'home_page.dart';

class MenuDrawer extends StatelessWidget {
  final ZoomDrawerController drawerController;

  const MenuDrawer({Key? key, required this.drawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        drawerController.close!(); // Close the drawer on any tap outside
        Navigator.pop(context); // Close the drawer screen
      },
      child: Container(
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
        child: Column(
          children: <Widget>[
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  _buildDrawerItem(context, Icons.person, 'Profile'),
                  _buildDrawerItem(context, Icons.home, 'Home'),
                  _buildDrawerItem(context, Icons.shopping_cart, 'My Cart'),
                  _buildDrawerItem(context, Icons.favorite, 'Favorites'),
                  _buildDrawerItem(context, Icons.list, 'Orders'),
                  _buildDrawerItem(context, Icons.notifications, 'Notifications'),
                  Divider(color: Colors.white), // Divider for better organization
                  _buildDrawerItem(context, Icons.logout, 'Sign Out'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align header items to the start
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/profile.png'), // Replace with your image asset
          ),
          SizedBox(height: 10),
          Text(
            'Hey, 👏',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              decoration: TextDecoration.none, // Remove underline
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Manoj',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none, // Remove underline
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          drawerController.close!(); // Use the drawer controller to close the drawer

          // Check if the title is 'Sign Out' to navigate to SignIn screen
          if (title == 'Sign Out') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignIn()), // Go to SignIn screen
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ); // Navigate to HomePage or other relevant screens
          }
        },
      ),
    );
  }
}
