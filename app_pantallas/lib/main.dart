import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantallas',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FirstScreenContent(),
    const SecondScreenContent(),
    const ThirdScreenContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App pantallas'),
        backgroundColor: Colors.blue,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'Primera'),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Segunda'),
          BottomNavigationBarItem(icon: Icon(Icons.three_k), label: 'Tercera'),
        ],
      ),
    );
  }
}

class FirstScreenContent extends StatelessWidget {
  const FirstScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Primera pantalla')],
      ),
    );
  }
}

class SecondScreenContent extends StatelessWidget {
  const SecondScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Segunda pantalla'),
        ],
      ),
    );
  }
}

class ThirdScreenContent extends StatelessWidget {
  const ThirdScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Tercera pantalla')],
      ),
    );
  }
}
