// 





import 'package:fitnesstrackerapp/Models/Workout.dart';
import 'package:flutter/material.dart';

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
            Colors.red.withOpacity(0.5),
            Colors.purple.withOpacity(0.99),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16.0), // Padding around the card content
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Margin between cards
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon for category
          Icon(
            workout.getCategoryIcon(),
            color: Colors.white,
            size: 40,
          ),
          // Column for workout details (title, duration, formatted date)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title of the workout
                  Tooltip(
  message: workout.title,
  child: Text(
    workout.title,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
  ),
),

                  SizedBox(height: 1),
                  // Duration and formatted date
                  Column(
                    children: [
                      Text(
                        '${workout.duration.toString()} min',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      // Spacer(),
                      Text(
                        workout.getFormattedDate(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
