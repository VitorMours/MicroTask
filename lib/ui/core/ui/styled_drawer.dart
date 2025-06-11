import "package:flutter/material.dart";

class StyledDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Text("Mostrando o menu")),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Mostrando o primeiro elemento da lista"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
