import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:happy_grocers/router/hg_navigator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'SIGN UP',
          style: TextStyle(
            fontSize: 16.dp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
          HGNavigator.goBack(context);

          },
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Guest",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: stepperType,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue:  continued,
              onStepCancel: cancel,
              steps: <Step>[
                 Step(
                  title:  const Text('Account'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email Address'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Password'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0 ?
                  StepState.complete : StepState.disabled,
                ),
                 Step(
                  title:  const Text('Address'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Home Address'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Postcode'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1 ?
                  StepState.complete : StepState.disabled,
                ),
                 Step(
                  title:  const Text('Mobile Number'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive:_currentStep >= 0,
                  state: _currentStep >= 2 ?
                  StepState.complete : StepState.disabled,
                ),
              ],
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          child:  const Icon(Icons.list),
          onPressed: switchStepsType,
        ),

    );


    
  }
switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
        setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
        setState(() => _currentStep -= 1) : null;
  }

}
