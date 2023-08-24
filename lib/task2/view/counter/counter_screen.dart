import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:task_mid_level/task2/view/counter/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  provider.increament();
                },
                icon: const Icon(Icons.add_circle),
              ),
              Text(
                provider.count.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              IconButton(
                  onPressed: () {
                    provider.decreament();
                  },
                  icon: const Icon(Icons.remove_circle))
            ],
          )
        ],
      ),
    );
  }
}
