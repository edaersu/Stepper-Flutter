import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:stepper_demo/test_page/test_view_model.dart';
import 'package:flutter/cupertino.dart';

class TestView extends TestViewModel {
  int currentStep = 0;
  Step _buildStep({
    @required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      isActive: isActive,
      state: state,
      content: LimitedBox(
        maxWidth: MediaQuery.of(context).size.width,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Card(
            color: Colors.deepOrange[100],
            child: Center(
              child: Text(
                "Hello",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Stapper Demo"),
      ),
      child: SafeArea(
        child: _stepper(StepperType.vertical),
      ),
    );
  }

  CupertinoStepper _stepper(StepperType type) {
    return CupertinoStepper(
      type: type,
      // yeni current_stepin yüklenmesini sağlıyor
      currentStep: currentStep,
      // üzerine basılan soruya gitme
      onStepTapped: (step) => setState(() => currentStep = step),
      // continue seçeneğini deactive ediyor.
      onStepContinue: true
          ? () => setState(() {
                if (currentStep != 9)
                  ++currentStep;
                else if (currentStep == 9) {
                  print("go");
                }
              })
          : null,
      //cancel seçeneğini deactive ediyor.
      onStepCancel: true
          ? () => setState(() {
                if (currentStep == 0) {
                  print("o yeah");
                } else {
                  --currentStep;
                }
              })
          : null,
      steps: [
        for (var i = 0; i < 10; ++i)
          _buildStep(
              title: Text('${i + 1}. Soru'),
              // bulunan stepin yuvarlağını yakma(nerde olduğunu görsel olarak bildirme yuvarlak kalem kısmı)
              isActive: i == currentStep,
              state: i == currentStep
                  ? StepState.editing
                  : i < currentStep ? StepState.complete : StepState.indexed),
      ],

      /*
      /// örnek bir step:
       for (var i = 0; i < 2; ++i)
          _buildStep(
              title: Text('${i + 1}. Soru'),
              isActive: i == currentStep,
              state: i == currentStep
                  ? StepState.editing
                  : i < currentStep ? StepState.complete : StepState.indexed),
        _buildStep(title: Text("Error"), state: StepState.error),
        _buildStep(title: Text("Disabled"), state: StepState.indexed)
      */
    );
  }
}
