import 'package:flutter/material.dart';

class PaletteColor {
  final String hex;
  final String name;
  final Color color;

  PaletteColor({required this.color, required this.name, required this.hex});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PaletteColor currentColor;
  final List<PaletteColor> colors = [
    PaletteColor(color: Colors.blue, name: 'Blue', hex: '#BAS44S3'),
    PaletteColor(color: Colors.red, name: 'Red', hex: '#4464BAG'),
    PaletteColor(color: Colors.green, name: 'Green', hex: '#GGFF7384'),
  ];

  @override
  void initState() {
    super.initState();
    currentColor = colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor.color, // UI uses STATE

      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentColor = colors[1]; // switch to another color
            });
          },
          child: Container(
            width: 120,
            height: 120,
            color: Colors.black,
            alignment: Alignment.center,
            child: const Text('Tap me', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
