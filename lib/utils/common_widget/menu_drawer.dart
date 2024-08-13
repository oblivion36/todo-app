import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({this.context});
  BuildContext? context;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(
                  0xFFF5B8CD), // Assigning the hex color to the DrawerHeader background
            ),
            child: Center(
              child: Text(
                'To-Do APP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle the Home tap
              Navigator.pushNamed(context, '/homeScreen'); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            onTap: () {
              // Handle the Favorite tap
              Navigator.pushNamed(context, '/listScreen'); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_task),
            title: const Text('Create Task'),
            onTap: () {
              Navigator.pushNamed(context, '/addNote'); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle the Settings tap
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
