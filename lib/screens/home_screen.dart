import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.search, color: Colors.lightBlueAccent, size: 24.0),
          SizedBox(width: 16.0),
          Icon(Icons.exit_to_app, color: Colors.lightBlueAccent, size: 24.0),
          SizedBox(width: 16.0),
        ],
        title: Center(child: const Text('Home Screen')),
        leading: const Icon(
          Icons.menu,
          color: Colors.lightBlueAccent,
          size: 24.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "First Line",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16.0),
            const Icon(
              Icons.settings,
              color: Colors.lightBlueAccent,
              size: 48.0,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Text("hello"),
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  child: const Text("hello"),
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: const Text("hello"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.yellow,
              child: const CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/media/G8xx5Hsa4AAcHtZ?format=jpg&name=medium',
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
