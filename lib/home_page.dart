import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ex/core/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_ex/core/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_ex/core/counter_bloc/counter_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBlocs, CounterStates>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<CounterBlocs>(context).add(Increment()),
                    child: const Icon(Icons.add)),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<CounterBlocs>(context).add(Decrement()),
                    child: const Icon(Icons.remove))
              ],
            ),
          ],
        );
      }),
    );
  }
}
