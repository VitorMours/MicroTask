import "package:flutter/material.dart";

class StyledDrawer extends StatefulWidget {
  @override
  State createState() => _StyledDrawerState();
}

class _StyledDrawerState extends State<StyledDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Micro Tasks"),
          ),
          ListTile(
            leading: const Icon(Icons.settings_sharp),
            title: const Text("Settings"),
            onTap: () {
              print("Acessing settings");
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }
}
