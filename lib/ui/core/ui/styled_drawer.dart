import "package:flutter/material.dart";

class StyledDrawer extends StatelessWidget {
  const StyledDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0),
            child: Container(
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Row(children: [Text("oui")]),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
        ],
      ),
    );
  }
}
