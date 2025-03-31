import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'FISH CW 05'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Fish {
  String fishColor; 
  String fishSpeed; 

  Fish(this.fishColor, this.fishSpeed);
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  List<String> speedList = ['Slow', 'Med', 'High'];
  List<String> colorList = ['Red', 'Blue', 'Yellow'];  
  String _speed = 'Slow'; 
  String _color = 'Red'; 
  AnimationController? _controller;
  List<Fish> fishList = [];

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // Add your animation logic here.
    super.initState();
  }

  void _addFish() {
    if (fishList.length < 10) {
      setState(() {
        Fish fish = Fish(_color, _speed);
        fishList.add(fish);
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _saveSettings() {
    setState(() {
      //save count, color, speed
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down, size: 20),
                  value: _speed,
                  items: speedList.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: TextStyle(fontSize: 12)),
                  )).toList(),
                  onChanged: (item) => setState(() => _speed = item!),
                ),
              ),
            ),
            Container(
              width: 200,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down, size: 20),
                  value: _color,
                  items: colorList.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: TextStyle(fontSize: 12)),
                  )).toList(),
                  onChanged: (item) => setState(() => _color = item!),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _saveSettings,
              child: Text("Save environment"),
            ),
            SizedBox(
              height: 300, 
              width: 300, 
              child: const DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.blue
                ),
              ),
            ),

            CustomPaint(
              size: Size(50, 50), // Specify the size of the custom painting area
              painter: MyPainter(), // Use a custom painter to define the drawing
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFish,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

class MyPainter extends CustomPainter { //logic for how to add lines
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;
  
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    canvas.drawCircle(center, radius, paint);
  }
    
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}