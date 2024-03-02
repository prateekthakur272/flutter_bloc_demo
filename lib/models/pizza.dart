import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Pizza extends Equatable{
  final String id;
  final String name;
  final Image image;

  const Pizza(this.id, this.name, this.image);

  @override
  List<Object?> get props => [id, name, image];

  static List<Pizza> pizzas = [
    Pizza('0', 'Peproni', Image.asset('assets/peproni.png')),
    Pizza('1', 'Tomato', Image.asset('assets/tomato.png')),
    Pizza('2', 'Mushroom', Image.asset('assets/mushroom.png')),
  ];
}