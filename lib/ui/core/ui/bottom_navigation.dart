import "package:flutter/material.dart";

import "../theme/theme.dart";



class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(children: <Widget>[])
    );
  }
}
