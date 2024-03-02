import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/pizza_bloc.dart';
import 'package:flutter_bloc_demo/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>PizzaBloc()..add(LoadPizza()))],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pizza App',
        home: HomeScreen(),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(const App());
}