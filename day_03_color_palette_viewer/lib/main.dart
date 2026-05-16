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
  bool checkBox = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
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
      backgroundColor: const Color.fromARGB(
        255,
        240,
        237,
        237,
      ), // UI uses STATE
      appBar: AppBar(
        leading: Icon(Icons.palette),
        title: Text('HueGallery'),
        actions: [Icon(Icons.login)],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                                      color: Colors.white.withValues(
                                        alpha: 0.15,
                                      ),
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
                                      color: Colors.white.withValues(
                                        alpha: 0.15,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gallery Collections',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '128 Colors',
                        style: TextStyle(
                          color: Color.fromARGB(255, 86, 79, 190),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22),
                  GalleryCard(
                    currentColor: colors[0],
                    checkBox: checkBox,
                    onChanged: (value) {
                      setState(() {
                        checkBox = value!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  GalleryCard(
                    currentColor: colors[1],
                    checkBox: checkBox2,
                    onChanged: (value) {
                      setState(() {
                        checkBox2 = value!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  GalleryCard(
                    currentColor: colors[2],
                    checkBox: checkBox3,
                    onChanged: (value) {
                      setState(() {
                        checkBox3 = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryCard extends StatelessWidget {
  const GalleryCard({
    super.key,
    required this.currentColor,
    required this.checkBox,
    required this.onChanged,
  });
  final PaletteColor currentColor;
  final bool checkBox;
  final Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2,
            spreadRadius: 0.5,
            offset: Offset(1, 2),
          ),
        ],
      ),
      height: 135,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: currentColor.color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentColor.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  currentColor.hex,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(width: 16),
            Spacer(),
            Checkbox(value: checkBox, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
