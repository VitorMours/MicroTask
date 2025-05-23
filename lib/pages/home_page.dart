import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Micro Tasks",
          style: TextStyle(color: Colors.blue,  fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        clipBehavior: Clip.antiAlias,
        notchMargin: 8.0,
        child: Row(children: <Widget>[]),
      ),

      body: Container(color: Colors.white),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () {},
      ),
    );
  }
}
