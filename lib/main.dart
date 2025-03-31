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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  /*String _dropdownSpeed = speedList.first;
  String _dropdownColor = colorList.first;*/
  List<String> speedList = ['Slow', 'Med', 'High'];
  List<String> colorList = ['Red', 'Blue', 'Yellow'];  
  String? speed = 'Slow'; 
  String? color = 'Red';

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
            /*Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),*/
            Container(
              width: 200,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down, size: 20),
                  value: speed,
                  items: speedList.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: TextStyle(fontSize: 12)),
                  )).toList(),
                  onChanged: (item) => setState(() => speed = item),
                ),
              ),
            ),
            Container(
              width: 200,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down, size: 20),
                  value: color,
                  items: colorList.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: TextStyle(fontSize: 12)),
                  )).toList(),
                  onChanged: (item) => setState(() => color = item),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

/*class MyPainter extends CustomPainter { //logic for how to add lines
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    final Paint paint2 = Paint()
      ..color = Colors.brown // Set the color to green
      ..strokeWidth = 1 // Set the stroke width
      ..style = PaintingStyle.fill;
    
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}*/