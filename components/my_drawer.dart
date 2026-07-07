import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_drawer_tile.dart';
import 'package:flutter_application_1/pages/setttings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context)
                  .colorScheme
                  .secondary, // Correct placement of color
              thickness:
                  1, // Optional: You can customize the thickness of the divider
            ),
          ),

          MyDrawerTile(
            text: "H O M E", // First tile with unique text
            icon: Icons.home, // Use Icons.home
            onTap: () => Navigator.pop(context),
          ),

          MyDrawerTile(
            text:
                "S E T T I N G S", // Changed to unique text for the second tile
            icon: Icons.settings, // Changed icon to settings for variety
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>const SetttingsPage()
                  )
                );
            },
          ),

          const Spacer(),

          MyDrawerTile(
            text: "L O G O U T", // Changed to unique text for the second tile
            icon: Icons.logout, // Changed icon to settings for variety
            onTap: () {},
          ),

          // Add more widgets here, like ListTiles for navigation
        ],
      ),
    );
  }
}
