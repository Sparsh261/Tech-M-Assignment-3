import 'package:fitnesstrackerapp/Models/Workout.dart';
import 'package:fitnesstrackerapp/Widgets/WorkoutItem.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget{

  List<Workout> availableWorkouts = [
  Workout(id: 'c1', title: 'Italian', color: Colors.purple),
  Workout(id: 'c2', title: 'Quick & Easy', color: Colors.red),
  Workout(id: 'c3', title: 'Hamburgers', color: Colors.orange),
  ];

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Workouts",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: const Color.fromARGB(255, 143, 152, 167),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for(Workout category in availableWorkouts)
              WorkoutItem(workout: category),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    // Your logic here
  },
  backgroundColor: Colors.teal,
  foregroundColor: Colors.white, // text/icon color
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12), // optional shape
  ),
  elevation: 6, // optional shadow depth
  child: Text(
    "Check BMI",
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  ),
),

    );
  }
}