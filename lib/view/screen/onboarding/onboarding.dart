
import 'package:flutter/material.dart';

import '../../widget/onboarding/custombutton.dart';
import '../../widget/onboarding/customslider.dart';
import '../../widget/onboarding/dotcontroller.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnboarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DotcontrollerOnboarding(),
                  Spacer(flex: 2,),
                  CustomButtonOnboarding(),
                  Spacer(flex: 1,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
