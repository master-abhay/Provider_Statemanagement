import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/example_one_Slider.dart';

class ExampleOneSliderScreen extends StatefulWidget {
  const ExampleOneSliderScreen({super.key});

  @override
  State<ExampleOneSliderScreen> createState() => _ExampleOneSliderScreenState();
}

class _ExampleOneSliderScreenState extends State<ExampleOneSliderScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    final provider = Provider.of<ExampleOneSlider>(context, listen: false);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ExampleOneSlider>(
            builder: (BuildContext context, value, Widget? child) {
              return Slider(
                min: 0.0,
                max: 1.0,
                value: provider.value,
                onChanged: (val) {
                  provider.setupValue(val);
                  print(provider.value);
                },
              );
            },
          ),
         Consumer<ExampleOneSlider>(builder: (BuildContext context, value, Widget? child){
         return  Row(
             children: [
               Expanded(
                 child: Container(
                   height: 50,
                   color: Colors.red.withOpacity(value.value),
                   child: Center(child: Text("Container 1")),
                 ),
               ),
               Expanded(
                 child: Container(
                   height: 50,
                   color: Colors.green.withOpacity(value.value),
                   child: Center(child: Text("Container 2")),
                 ),
               )
             ],
           );
         })
        ],
      ),
    );
  }
}
