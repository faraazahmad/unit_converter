import 'package:flutter/material.dart';
import 'unit.dart';
import 'converter_route.dart';
import 'package:meta/meta.dart';

const _rowHeight = 100.0;
const _borderRadius = Radius.circular(_rowHeight / 16);

class Category extends StatelessWidget {
  final IconData iconLocation;
  final String name;
  final Color color;
  final List<Unit> units;

  const Category({
    @required this.name,
    @required this.iconLocation,
    @required this.color,
    @required this.units,
  }) :
      assert(name != null),
      assert(iconLocation != null),
      assert(color != null),
      assert(units != null);

  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(
            color: color,
            name: name,
            units: units,
          ),
        );
      }
    ));
  }

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
            onTap: () => _navigateToConverter(context),
          ),
        ),
      ),
    );
  }
}