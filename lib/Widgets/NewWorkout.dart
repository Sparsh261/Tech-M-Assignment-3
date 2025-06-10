import 'package:fitnesstrackerapp/Models/Workout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final formatter = DateFormat().add_yMd();

class NewWorkout extends StatefulWidget {
  final void Function(Workout) onAddWorkout;
  NewWorkout({required this.onAddWorkout});
  @override
  State<NewWorkout> createState() {
    return NewWorkoutState();
  }
}

class NewWorkoutState extends State<NewWorkout> {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController amountTextEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Category selectedCategory = Category.Cardio;

  presentDatePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(2025, 1, 1);
    DateTime lastDate = DateTime(2025, 12, 31);

    final dateSelected = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      selectedDate = dateSelected!;
    });
  }

  saveNewWorkout() {
    Workout workout = Workout(
      title: titleTextEditingController.text,
      duration: double.parse(amountTextEditingController.text),
      date: selectedDate,
      category: selectedCategory,
    );
    widget.onAddWorkout(workout);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            maxLength: 50,
            controller: titleTextEditingController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Minutes',
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(formatter.format(selectedDate).toString()),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: selectedCategory,
                items: [
                  DropdownMenuItem(child: Text('Cardio'), value: Category.Cardio),
                  DropdownMenuItem(child: Text('Weightlifting'), value: Category.Weightlifting),
                  DropdownMenuItem(
                    child: Text('Endurance'),
                    value: Category.Endurance,
                  ),
                  DropdownMenuItem(
                    child: Text('Resistance'),
                    value: Category.Resistance,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              SizedBox(width: 5),
              ElevatedButton(
                onPressed: saveNewWorkout,
                child: Text('Save Workout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}