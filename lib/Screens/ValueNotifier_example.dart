import 'package:flutter/material.dart';

class ValNoti extends StatefulWidget {
  const ValNoti({super.key});

  @override
  State<ValNoti> createState() => _ValNotiState();
}

class _ValNotiState extends State<ValNoti> {
  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print("==================================>>>>>>>>>>>>>>>>>>>>>>>>>>>Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Value Notifier Screen"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, Widget? child) {
                  return Text(
                    value.toString(),
                    style: TextStyle(fontSize: 30),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
