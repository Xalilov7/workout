import 'package:flutter/material.dart';
import 'package:workout/ui/details_view.dart';

class ExerciseWidget extends StatelessWidget {
  final String exerciseTitle;
  final String exerciseValue;
  final DetailView widget;
  const ExerciseWidget({Key? key, required this.exerciseTitle, required this.exerciseValue, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(exerciseTitle),
            Text(exerciseValue)
          ],
        ),
        SizedBox(height: 5),

      ],
    );
  }
}
