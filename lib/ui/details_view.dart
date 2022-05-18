import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:workout/model/exercise.dart';
import 'package:workout/model/work_out.dart';
import 'package:workout/ui/exercises.dart';
class DetailView extends StatefulWidget {
  final int id;
  const DetailView({Key? key, required this.id}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    List<WorkOut> _workOutList = WorkOut.getWorkOutList();
    List<Exercise> _exercisesList = Exercise.getExercise();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     body: Stack(
       children: [
         SizedBox(
           height: double.infinity,
           width: double.infinity,
           child: FittedBox(
             child: Hero(
               tag: _workOutList[widget.id].id,
               child: Image.asset(_workOutList[widget.id].imageUrl, fit: BoxFit.cover,),
             ),
           ),
         ),
         Positioned(
             top: 50,
             left: 20,
             child: GestureDetector(
               onTap: ()=> Navigator.pop(context),
             child: Icon(Icons.arrow_back, color: Colors.white,),)

         ), 
         Positioned(
            top: 20,
             right: 20,
             child: GestureDetector(
           onTap: ()=> null,
           child: _workOutList[widget.id].isTopRated ? Image.asset("assets/medal.png", width: 40,) : Text(""),
         )),
         SlidingUpPanel(
           defaultPanelState: PanelState.OPEN,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20),
             topRight: Radius.circular(20)
           ),
           backdropEnabled: true,
           backdropColor:   Colors.black87,
           panel: Container(
          height: size.height * 4,
            child: Padding(
              padding: EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_workOutList[widget.id].title, textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800
                    ),),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(_workOutList[widget.id].imageUrl),
                        ),
                        SizedBox(width: 6.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(_workOutList[widget.id].trainer, style: TextStyle(
                            color: Colors.grey
                          ),), 
                          Text("Coach", style: TextStyle(color: Colors.grey),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Text("Description", style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600
                    ),),
                    Text("Our gym and training exercises are globally recogized and have been nomined to global awards 6 times",
                    textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 1.2
                      ),
                    ),
                     SizedBox(height: 12),
                   ExerciseWidget(exerciseTitle: "Squat", exerciseValue: _exercisesList[_workOutList[widget.id].id].squat, widget: widget),
                    ExerciseWidget(exerciseTitle: "Leg press ", exerciseValue: _exercisesList[_workOutList[widget.id].id].legPress, widget: widget),
                    ExerciseWidget(exerciseTitle: "Lunge", exerciseValue: _exercisesList[_workOutList[widget.id].id].lunge, widget: widget),
                    ExerciseWidget(exerciseTitle: "Leg Extension", exerciseValue: _exercisesList[_workOutList[widget.id].id].legExtension, widget: widget),
                   SizedBox(height: 10.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16),),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text("Get Started", style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),)),
                    )
                  ],
                ),
              ),
            ),
           ),
         )
       ],
     ),
    );
  }
}
