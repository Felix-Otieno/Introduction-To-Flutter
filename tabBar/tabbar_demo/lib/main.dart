import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TabBarDemo());
  }
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key); // Fixed key to be nullable

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with SingleTickerProviderStateMixin {
  late TabController tabController; // Used late for delayed initialization

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this); // Initialize in initState
  }

  @override
  void dispose() {
    tabController.dispose(); // Dispose the controller when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Demo'),
        bottom: TabBar(
          controller: tabController, // Associate controller
          tabs: [
            Tab(
              icon: Icon(Icons.done, color: Colors.green),
              child: Text('First Tab'),
            ),
            Tab(
              icon: Icon(Icons.create, color: Colors.yellow),
              child: Text('Second Tab'),
            ),
            Tab(
              icon: Icon(Icons.cancel, color: Colors.red),
              child: Text('Third Tab'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController, // Associate controller
        children: [
          Icon(Icons.done, size: 350, color: Colors.green),
          Icon(Icons.edit, size: 350, color: Colors.yellow),
          Icon(Icons.cancel, size: 350, color: Colors.red),
        ],
      ),
    );
  }
}
