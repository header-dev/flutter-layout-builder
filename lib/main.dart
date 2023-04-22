import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: LayoutBuilder(
          builder: (context, contraints) {
            Widget layout = Text('');
            var c = contraints;
            if (c.maxWidth <= 500) {
              layout = layoutTwoRows();
            } else if (c.maxWidth > 500 && c.maxWidth < 700) {
              layout = layoutThreeRows();
            } else if (c.maxWidth >= 700) {
              layout = layoutFiveRows();
            }
            return SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: layout,
            );
          },
        ),
      );

  Widget layoutTwoRows() => Column(
        children: [
          buildRow(['One', 'Two']),
          SizedBox(
            height: 20,
          ),
          buildRow(['Three', 'Four']),
          SizedBox(
            height: 20,
          ),
          buildRow(['Six', 'Seven']),
        ],
      );

  Widget layoutThreeRows() => Column(
        children: [
          buildRow(['One', 'Two', 'Three']),
          SizedBox(
            height: 20,
          ),
          buildRow(['Four', 'Five', 'Six'])
        ],
      );

  Widget layoutFiveRows() => Column(
        children: [
          buildRow(['One', 'Two', 'Three', 'Four', 'Five']),
          SizedBox(
            height: 20,
          ),
          buildRow(['Six', 'Seven', 'Eight', 'Nine', 'Ten'])
        ],
      );

  Widget buildRow(List<String> titles) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          titles.length,
          (index) => boxContainer(titles[index]),
        ),
      );

  Widget boxContainer(String text) => Container(
        child: Text(
          text,
          textScaleFactor: 1.5,
        ),
        width: 100,
        height: 100,
        color: Colors.black12,
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
      );
}
