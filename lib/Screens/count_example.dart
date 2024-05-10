import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/countProvider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final countProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.incrementCount();
    });
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);

    print("Build");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<CountProvider>(
                      builder: (BuildContext context, value, Widget? child) {

          return Center(child: Text(value.count.toString(),style: const TextStyle(fontSize: 50),));
                      },
                    )
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     countProvider.incrementCount();
      //
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
