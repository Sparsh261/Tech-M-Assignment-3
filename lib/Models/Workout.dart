import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category {Weightlifting, Cardio, Resistance, Endurance}

final uuid = Uuid();
final formatter = DateFormat().add_yMd();


class Workout {

  final String id;
  final String title;
  final double duration;
  final DateTime date;
  final Category category;

  Workout({
    required this.title,
    required this.duration,
    required this.date,
    required this.category
    }) :id = uuid.v4();
 
   String getFormattedDate() {
    return formatter.format(date);
  }

  getCategoryIcon() {
    if (category == Category.Weightlifting) {
      return Icons.fitness_center;
    } else if (category == Category.Cardio) {
      return Icons.run_circle_outlined;
    } else if (category == Category.Endurance) {
      return Icons.energy_savings_leaf;
    } else {
      return Icons.stop_circle;
    }
  }

}