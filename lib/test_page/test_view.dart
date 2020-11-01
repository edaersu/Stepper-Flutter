import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:stepper_demo/test_page/test_view_model.dart';
import 'package:flutter/cupertino.dart';

class TestView extends TestViewModel {
  List<Step> steps = [
    Step(
      title: const Text('1. soru'),
      isActive: true,
      state: StepState.indexed,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'isim'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'soyisim'),
          ),
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('2. soru'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('3.soru'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('4.soru'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('5.soru'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('6.soru'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('7.soru'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('8.soru'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('9.soru'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.indexed,
      title: const Text('10.soru'),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
  ];

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  StepperType stepperType = StepperType.vertical;

  switchStepType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Create an account'),
        ),
        body: Column(children: <Widget>[
          complete
              ? Expanded(
                  child: Center(
                    child: AlertDialog(
                      title: new Text("Profile Created"),
                      content: new Text(
                        "Tada!",
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            setState(() => complete = false);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Stepper(
                    steps: steps,
                    type: stepperType,
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepTapped: (step) => goTo(step),
                    onStepCancel: cancel,
                  ),
                ),
        ]));
  }
}
