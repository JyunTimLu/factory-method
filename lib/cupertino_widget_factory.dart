import 'package:factory_pattern/widget_facotry_interface.dart';

class CupertinoWidgetFactory implements IWidgetFactory {
  @override
  IActivityIndicator createActivityIndicator() {
    return IosActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return IosSlider();
  }

  @override
  ISwitch createSwitch() {
    return IosSwitch();
  }

  @override
  String getTitle() {
    return "iOS widget facotry";
  }
}
