import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var checkBoxIsPrivate = true.obs;
  var checkTaskStatus = false.obs;
  var checkBoxImportantLevel = "high".obs;

  changeValuePrivate(bool value) {
    checkBoxIsPrivate.value = value;
  }

  changeImportant(String importantLevel) {
    checkBoxImportantLevel.value = importantLevel.toString();
  }
}
