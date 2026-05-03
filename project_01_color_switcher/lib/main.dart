import 'package:flutter/material.dart';

class PaletteItem {
  final Color color;
  final String name;
  final String hex;

  PaletteItem({
    required this.color,
    required this.hex,
    required this.name,
});
}

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

  int colorIndex = 0;

  List<PaletteItem> palette = [
    PaletteItem(
      color: Colors.red,
      name: "Crimson Red",
      hex: "#FF0000",
    ),
    PaletteItem(
      color: Colors.blue,
      name: "Ocean Blue",
      hex: "#2196F3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var bgColor = palette[colorIndex].color;
    var brightness = ThemeData.estimateBrightnessForColor(bgColor);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(palette[colorIndex].name, style: TextStyle(color: (brightness == Brightness.dark) ? Colors.white : Colors.black, fontSize: 28, fontWeight: FontWeight(700)),),
              SizedBox(height:8),
              Text(palette[colorIndex].hex, style: TextStyle(color:(brightness == Brightness.dark) ? Colors.white : Colors.black, fontSize: 22, fontWeight: FontWeight(500)),),
              SizedBox(height:8),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if(colorIndex < palette.length -1 ){
                        colorIndex++;
                      }
                      else{
                        colorIndex = 0;
                      }
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
 
