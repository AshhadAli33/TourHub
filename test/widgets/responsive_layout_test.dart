import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tourhub/controllers/onboarding/onboarding_controller.dart';
import 'package:tourhub/widgets/common/responsive_center.dart';
import 'package:tourhub/widgets/onboarding/onboarding_button.dart';

void main() {
  tearDown(() {
    Get.reset();
  });

  testWidgets('onboarding button does not overflow on a very narrow screen', (
    tester,
  ) async {
    // Narrower than the button's old fixed minimumSize (280) to reproduce
    // the overflow bug on small/split-screen/foldable-cover-screen widths.
    await tester.binding.setSurfaceSize(const Size(240, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final controller = OnboardingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: buildBottomButton(controller, "Get Started")),
      ),
    );

    expect(tester.takeException(), isNull);
    controller.onClose();
  });

  testWidgets('ResponsiveCenter caps child width on a wide screen', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1400, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ResponsiveCenter(
            maxWidth: 480,
            child: ColoredBox(
              key: Key('capped-box'),
              color: Colors.blue,
              child: SizedBox(height: 100, width: double.infinity),
            ),
          ),
        ),
      ),
    );

    final renderedWidth = tester.getSize(find.byKey(const Key('capped-box'))).width;
    expect(renderedWidth, 480);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'ResponsiveCenter placed directly in a Stack honors bottomCenter '
    'instead of collapsing to the middle of the screen',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                ResponsiveCenter(
                  alignment: Alignment.bottomCenter,
                  maxWidth: 500,
                  child: SizedBox(
                    key: Key('bottom-box'),
                    height: 50,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      final screenHeight = tester.getSize(find.byType(Scaffold)).height;
      final boxBottom = tester.getBottomLeft(find.byKey(const Key('bottom-box'))).dy;

      // The box's bottom edge should sit near the bottom of the screen, not
      // near the vertical middle (the nested-Align regression this guards
      // against pinned it to roughly screenHeight / 2 instead).
      expect(boxBottom, greaterThan(screenHeight * 0.9));
    },
  );
}
