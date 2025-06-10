import 'package:fitnesstrackerapp/Models/Workout.dart';
import 'package:fitnesstrackerapp/Screens/BMIScreen.dart';
import 'package:fitnesstrackerapp/Widgets/NewWorkout.dart';
import 'package:fitnesstrackerapp/Widgets/WorkoutItem.dart';
import 'package:fitnesstrackerapp/Widgets/WorkoutList.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget{

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Workout> availableWorkouts = [
  Workout(
      title: 'Flutterxz vxfxdgdfgzdfgzsdfzsdgzdgzdf',
      duration: 5.25,
      date: DateTime.now(),
      category: Category.Cardio,
    ),
  Workout(
      title: 'Flutter',
      duration: 5.25,
      date: DateTime.now(),
      category: Category.Cardio,
    ),
  
  ];

  void openExpenseAdderOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewWorkout(onAddWorkout: addWorkout),
    );
  }

  addWorkout(Workout workout) {
    setState(() {
      availableWorkouts.add(workout);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Expense Added"), duration: Duration(seconds: 2)),
    );
  }

  removeWorkout(Workout workout) {
    setState(() {
      availableWorkouts.remove(workout);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Workout Deleted"),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: "undo", onPressed: (){   
          setState(() {
      availableWorkouts.add(workout);
    });
        }
        ))
    );
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All workouts',style: TextStyle(color: Colors.white),),
        actions: [
          // Title(color: Colors.white, child: Text("Add")),
          IconButton(
            onPressed: openExpenseAdderOverlay,
            tooltip: "Add new",
            icon: Icon(Icons.add,color: Colors.white,size: 35,)),
        ],
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
            for(Workout workout in availableWorkouts)
              Dismissible(
                  key: ValueKey(workout),
                  child: WorkoutItem(workout:workout),
                  onDismissed: (direction){
                    removeWorkout(workout);
                  },
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BMIScreen()));
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