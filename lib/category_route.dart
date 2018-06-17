import 'package:flutter/material.dart';
import 'category.dart';

class CategoryRoute extends StatelessWidget {
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  const CategoryRoute();

  @override
  Widget build(BuildContext context) {
    
      var categoryChildren = <Category>[];
      for (var i = 0; i < 8; i++) {
        categoryChildren.add(Category(_categoryNames[i], Icons.cake,_baseColors[i]));
      }

      final appBar = AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Unit Converter",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.green[100],
      );

      final listView = Container(
        child: ListView(
          children: categoryChildren,
        ),
      );

      return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: appBar,
        body: listView,
      );
    }
}