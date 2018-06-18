import 'package:flutter/material.dart';
import 'unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  final String name;
  final Color color;
  final List<Unit> units;

  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  State<StatefulWidget> createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  double _inputValue;
  String _outputValue = "0";
  TextEditingController _c;

  // Determine whether you need to override anything, such as initState()
  @override
  void initState() {
    _c = TextEditingController();
    super.initState();
  }
  // TODO: Add other helper functions. We've given you one, _format()
  void _calcOutput(String input) {
    setState(() {
      _inputValue = double.parse(input);
      // TODO: choose conversion constant
      _outputValue = _format(_inputValue);
    });
  }

  void _switchUnits() {

  }

  Widget _buildDropdown() {
    return null;
  }

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if(outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while(outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if(outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that includes
    // includes the output value, and 'from' unit [Dropdown].
    final inputGroup = Container(
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.display1,
              decoration: InputDecoration(
                labelText: 'Input',
                border: OutlineInputBorder(),
              ),
              onChanged: _calcOutput,
            ),
            /// TODO: execute a dropdown generator function
          ],
        ),
      ),
    );

    /// Create a compare arrows icon.
    final arrowsIcon = IconButton(
      icon: Icon(Icons.compare_arrows),
      iconSize: 40.0,
      onPressed: _switchUnits,
    );

    /// Create the 'output' group of widgets. This is a Column that
    final outputGroup = Container(
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              "$_outputValue",
              style: Theme.of(context).textTheme.display1,
            ),
            // TODO: execute dropdown generator
          ],
        ),
      ),
    );

    // TODO: Return the input, arrows, and output widgets, wrapped in

    return ListView(
      children: <Widget>[
        inputGroup,
        arrowsIcon,
        outputGroup,
      ],
    );
  }
}
