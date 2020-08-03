import 'package:factory_pattern/widget_facotry_interface.dart';

class MaterialWidgetFactory implements IWidgetFactory {
  @override
  IActivityIndicator createActivityIndicator() {
    return AndroidActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return AndroidSlider();
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }

  @override
  String getTitle() {
    return "Android widget facotry";
  }
}
