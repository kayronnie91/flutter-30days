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
    PaletteColor(color: Colors.blue, name: 'Ocean Blue', hex: '#BAS44S3'),
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
      backgroundColor: Colors.white, // UI uses STATE
      appBar: AppBar(
        leading: Icon(Icons.palette),
        title: Text('HueGallery'),
        actions: [Icon(Icons.login)],
      ),
      body: Column(
        children: [
          Container(
            height: 397,
            width: double.infinity,
            decoration: BoxDecoration(color: currentColor.color),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 231,
                    height: 211,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(top: 24),
                      child: Column(
                        children: [
                          Text(
                            currentColor.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            currentColor.hex,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.4,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              vertical: 24,
                              horizontal: 19,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.white.withValues(alpha: 0.15),
                                  ),
                                  child: Icon(
                                    Icons.copy_all,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.white.withValues(alpha: 0.15),
                                  ),
                                  child: Icon(Icons.share, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
