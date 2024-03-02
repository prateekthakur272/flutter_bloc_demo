import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/pizza_bloc.dart';
import 'package:flutter_bloc_demo/models/pizza.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Pizza Bloc'),
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(builder: (context, state) {
          if (state is PizzaInitial) {
            return const CircularProgressIndicator(
              color: Colors.orange,
            );
          }
          if (state is PizzaLoaded) {
            Random random = Random();
            return Column(
              children: [
                Text(
                  state.pizzas.length.toString(),
                  style: const TextStyle(
                      fontSize: 54, fontWeight: FontWeight.bold),
                ),
                const SizedBox.square(
                  dimension: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: state.pizzas
                        .map((pizza) => Positioned(
                            left: random.nextInt(250).toDouble(),
                            top: random.nextInt(400).toDouble(),
                            child: SizedBox(height: 160, width: 160 ,child: pizza.image)))
                        .toList(),
                  ),
                )
              ],
            );
          }
          return const Text('something broken');
        }),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(onPressed: (){
                context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas.first));
              }, backgroundColor: Colors.orange, child: const Icon(Icons.local_pizza_outlined),),
              const SizedBox(height: 16,),
              FloatingActionButton(onPressed: (){
                context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas.first));
              }, backgroundColor: Colors.orange, child: const Icon(Icons.remove),),
            ],
          ),
          const SizedBox(width: 16,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(onPressed: (){
                context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
              }, backgroundColor: Colors.orange, child: const Icon(Icons.local_pizza_outlined),),
              const SizedBox(height: 16,),
              FloatingActionButton(onPressed: (){
                context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1]));
              }, backgroundColor: Colors.orange, child: const Icon(Icons.remove),),
            ],
          ),
        ],
      ),
    );
  }
}
