import 'package:fitnesstrackerapp/Models/Workout.dart';
import 'package:flutter/widgets.dart';

class WorkoutItem extends StatelessWidget {
  
  WorkoutItem({super.key, required this.workout});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              workout.color.withOpacity(0.5),
              workout.color.withOpacity(0.99),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            workout.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
        )
      ),
    );
  }
}