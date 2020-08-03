import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class IWidgetFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}

abstract class ISwitch {
  Widget render(bool value, ValueSetter<bool> onChanged);
}

abstract class ISlider {
  Widget render(double value, ValueSetter<double> onChanged);
}

abstract class IActivityIndicator {
  Widget render();
}

class AndroidActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: Color(0xFFECECEC),
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black.withOpacity(0.65),
      ),
    );
  }
}

class IosActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return CupertinoActivityIndicator();
  }
}

class AndroidSlider implements ISlider {
  @override
  Widget render(double value, onChanged) {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      min: 0.0,
      max: 100.0,
      value: value,
      onChanged: onChanged,
    );
  }
}

class IosSlider implements ISlider {
  @override
  Widget render(double value, onChanged) {
    return CupertinoSlider(
      min: 0.0,
      max: 100.0,
      value: value,
      onChanged: onChanged,
    );
  }
}

class AndroidSwitch implements ISwitch {
  @override
  Widget render(bool value, onChanged) {
    return Switch(
      activeColor: Colors.black,
      value: value,
      onChanged: onChanged,
    );
  }
}

class IosSwitch implements ISwitch {
  @override
  Widget render(bool value, onChanged) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}
