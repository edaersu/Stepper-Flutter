import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:stepper_demo/test_page/test_model.dart';
import 'package:stepper_demo/test_page/test_view_model.dart';
import 'package:flutter/cupertino.dart';

class TestView extends TestViewModel {
  //radiobutton
  int selectedRadioTile;
  int dogrucevap = 0;
  int yanliscevap = 0;
  int selectedRadio;
  //stepper
  List<Step> steps = List<Step>(10);
  int currentStep = 0;
  bool complete = false;
  StepperType stepperType = StepperType.vertical;
  switchStepType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    build_stapper();

    return new Scaffold(
        appBar: AppBar(
          title: Text('Stapper Demo'),
        ),
        body: Column(children: <Widget>[
          complete
              ? Expanded(
                  child: Center(
                    child: AlertDialog(
                      title: new Text("Puanınız"),
                      content: new Text(
                        "${dogrucevap * 10}",
                        style: TextStyle(fontSize: 30),
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Kapat"),
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
                    //  onStepTapped: (step) => setState(() => currentStep = step),
                    onStepContinue: true
                        ? () => setState(() {
                              puanhesapla(currentStep);
                              if (currentStep != 9)
                                ++currentStep;
                              else if (currentStep == 9) {
                                print("test bitti başka sayfaya geç");
                                complete = true;
                              }
                            })
                        : null,
                    /*
                    onStepCancel: true
                        ? () => setState(() {
                            if (currentStep == 0) {
                              print("geri gidiliyor..");
                            } else {
                              --currentStep;
                            }
                          })
                      : null,
                      */
                  ),
                ),
        ]));
  }

  void puanhesapla(int index) {
    if (soruList10[index].dogrucevap == selectedRadioTile) {
      dogrucevap++;
      print(soruList10[index].dogrucevap.toString() +
          "            " +
          selectedRadioTile.toString());
      print(dogrucevap);
    } else {
      yanliscevap++;
      print(soruList10[index].dogrucevap.toString() +
          "            " +
          selectedRadioTile.toString());
      print(yanliscevap);
    }
  }

  void build_stapper() {
    for (var i = 0; i < 10; i++) {
      steps[i] = Step(
          isActive: true,
          title: Text('${i + 1}.soru'),
          content: Column(
            children: soruCard(i),
          ),
          state: i == currentStep
              ? StepState.editing
              : i < currentStep ? StepState.complete : StepState.indexed);
    }
  }

  List<Widget> soruCard(int i) => <Widget>[
        Column(
          children: [
            Text(soruList10[i].soru),
            herbirbuton(soruList10[i].cevap1, 1),
            herbirbuton(soruList10[i].cevap2, 2),
            herbirbuton(soruList10[i].cevap3, 3),
            herbirbuton(soruList10[i].cevap4, 4),
          ],
        )
      ];

  RadioListTile herbirbuton(String cevap, int i) {
    return RadioListTile(
      value: i,
      groupValue: selectedRadioTile,
      title: Text(
        cevap,
        style: TextStyle(fontSize: 13),
      ),
      onChanged: (val) {
        print("Radio Tile pressed $val");
        setSelectedRadioTile(val);
      },
      activeColor: Colors.black,
      selected: true,
    );
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
}
