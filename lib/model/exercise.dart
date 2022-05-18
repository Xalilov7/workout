class Exercise {
  final int workOutId;
  final String squat;
  final String legPress;
  final String lunge;
  final String legExtension ;

  Exercise(this.workOutId, this.squat, this.legPress, this.lunge, this.legExtension);

static List<Exercise> getExercise(){
  List<Exercise> _exerciseList = [
    Exercise(0, '3 x 15', '2 x 8', '4 x 30', '3 x 12'),
    Exercise(0, '4 x 15', '3 x 8', '5 x 30', '3 x 12'),
    Exercise(0, '2 x 15', '4 x 8', '6 x 30', '4 x 12'),
    Exercise(0, '3 x 15', '5 x 8', '7 x 30', '4 x 12'),
  ];
  return _exerciseList;
}
}