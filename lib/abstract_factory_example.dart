import 'package:factory_pattern/cupertino_widget_factory.dart';
import 'package:factory_pattern/factory_section.dart';
import 'package:factory_pattern/material_widget_factory.dart';
import 'package:factory_pattern/widget_facotry_interface.dart';
import 'package:flutter/material.dart';

class AbstractFactoryExample extends StatefulWidget {
  @override
  _AbstractFactoryExampleState createState() => _AbstractFactoryExampleState();
}

class _AbstractFactoryExampleState extends State<AbstractFactoryExample> {
  final List<IWidgetFactory> widgetsFactoryList = [
    MaterialWidgetFactory(),
    CupertinoWidgetFactory(),
  ];

  int _selectedFactoryIndex = 0;

  IActivityIndicator _activityIndicator;

  ISlider _slider;
  double _sliderValue = 50.0;

  String get _sliderValueString => _sliderValue.toStringAsFixed(0);

  ISwitch _switch;
  bool _switchValue = false;

  String get _switchValueString => _switchValue ? 'ON' : 'OFF';

  @override
  void initState() {
    super.initState();
    _createWidgets();
  }

  @override
  Widget build(BuildContext context) {
    var paddingL = 20.0;
    var spaceL = 30.0;
    var spaceXL = 40.0;
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: paddingL),
              child: Column(
                children: <Widget>[
                  FactorySelection(
                    widgetsFactoryList: widgetsFactoryList,
                    selectedIndex: _selectedFactoryIndex,
                    onChanged: _setSelectedFactoryIndex,
                  ),
                  SizedBox(height: spaceL),
                  Text(
                    'Widgets showcase',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: spaceXL),
                  Text(
                    'Process indicator',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  SizedBox(height: spaceL),
                  _activityIndicator.render(),
                  SizedBox(height: spaceXL),
                  Text(
                    'Slider ($_sliderValueString%)',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  SizedBox(height: spaceL),
                  _slider.render(_sliderValue, _setSliderValue),
                  SizedBox(height: spaceXL),
                  Text(
                    'Switch ($_switchValueString)',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  SizedBox(height: spaceL),
                  _switch.render(_switchValue, _setSwitchValue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createWidgets() {
    _activityIndicator = widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
    _slider = widgetsFactoryList[_selectedFactoryIndex].createSlider();
    _switch = widgetsFactoryList[_selectedFactoryIndex].createSwitch();
  }

  void _setSelectedFactoryIndex(int index) {
    setState(() {
      _selectedFactoryIndex = index;
      _createWidgets();
    });
  }

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _setSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }
}
