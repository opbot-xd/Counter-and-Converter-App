import 'package:flutter/material.dart';
import 'bloc/counter/counter_page.dart'; // Import your counter page
import 'bloc/convertor/convertor_page.dart'; // Import your converter page

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final _pages = [
    CounterPage(), // Add the CounterPage instance
    ConverterPage(), // Add the ConverterPage instance
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Flutter Converter App'),
        ),
        body: _pages[_selectedIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_align_left),
              label: 'Converter',
            ),
          ],
        ),
      ),
    );
  }
}