import 'package:flutter/material.dart';

const _rowHeight = 100.0;
const _borderRadius = Radius.circular(_rowHeight / 16);

class Category extends StatelessWidget {
  final IconData iconLocation;
  final String name;
  final Color color;

  const Category(categoryName, categoryIcon, categoryColor) :
      iconLocation = categoryIcon,
      name = categoryName,
      color = categoryColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.all(_borderRadius),
            highlightColor: color.withAlpha(125),
            splashColor: color,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: iconLocation != null ? Icon(iconLocation) : Icon(Icons.warning),
                ),
                Center(
                  child: Text(this.name, style: TextStyle(fontSize: 24.0)),
                ),
              ],
            ),

            onTap: () {
              print("I was tapped");
            },
          ),
        ),
      ),
    );
  }
}