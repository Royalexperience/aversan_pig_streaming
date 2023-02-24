import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:aversan_pig_streaming/screens/avatar_picker_screen.dart';
import 'package:aversan_pig_streaming/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:aversan_pig_streaming/utils/helper_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/widgets/avatar_picker_button.dart';

Future<void> main() async {
  var avatarPickerButtonWidget = AvatarPickerButton();
  testWidgets('Test AvatarPickerButton Component', (WidgetTester tester) async {
    String defaultAvatarPath = Utils.getUserAvatarList()[0].avatarImagePath;
    await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(avatarPickerButtonWidget));
    // Verify that the controller sets the correct path on initialization
    expect(AvatarPickerButton.imagePath, equals(defaultAvatarPath));
  });
}