import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final turist = ['1', '2', '3', '4', '5', '6'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<Turist>(
        create: (context) => Turist(),
        child: BlocBuilder<Turist, TuristState>(
          builder: (context, state) {
            if (state is TuristDefaullt) {
              return SafeArea(
                child: Scaffold(
                  body: Center(
                    child: Column(
                      children: [
                        ...context.read<Turist>().data.map((e) {
                          return Container(
                              margin: const EdgeInsets.all(12),
                              decoration:
                                  BoxDecoration(color: Colors.amber[300], borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(e),
                              ));
                        }),
                        FilledButton(onPressed: context.read<Turist>().increase, child: const Text('add')),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
