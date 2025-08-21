import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

class Counter extends ConsumerWidget {
static const String name= 'counter';
  
  const Counter({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final int counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Valor : $counter', style: Theme.of(context).textTheme.titleLarge,),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}