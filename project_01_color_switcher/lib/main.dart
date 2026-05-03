import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColorPalette();
  }
}

class ColorPalette extends StatefulWidget {
  const ColorPalette({super.key});

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {

  Color currentColor = Colors.teal;
  List <Color> palette = [Colors.black, Colors.white10, Colors.green, Colors.lightBlueAccent, Colors.red];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: currentColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text('Color Name'),
              Text('Hex Code'),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      currentColor = palette[(1)];
                    });
                  },
                  child: Text('Change Color'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
 
