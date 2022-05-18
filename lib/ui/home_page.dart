import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout/model/work_out.dart';
import 'package:workout/ui/details_view.dart';
import 'package:workout/widget/category_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<WorkOut> _workOutList = WorkOut.getWorkOutList();
    
    return Scaffold(
    backgroundColor: Colors.white,
     appBar: AppBar(
       elevation: 0,
       centerTitle: false,
       backgroundColor: Colors.white,
       title: Image.asset("assets/menu.png", height: 32.0,),
      actions: [
        Padding(
          padding: EdgeInsets.only( right: 16.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpg"),
          ),
        )
      ],
     ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("What can you do today ? ", style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold
           ),),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search"
                ),
              ) ,
              margin: EdgeInsets.only(top: 20, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: Offset(0,0)
                  )
                ]
              ),
            ),
            CategoryList(),
            SizedBox(height: 20.0),
            Text("Without Packs", style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold
            ),),
            Expanded(child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: ListView.builder( scrollDirection: Axis.horizontal, itemCount: _workOutList.length,  itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (contex) => DetailView(id: index)));
                  },
                  child: Padding(padding: EdgeInsets.only(right: 16.0),
               child: Stack(
                   children: [
                     Hero(tag: _workOutList[index].imageUrl, child: ClipRRect(
                       borderRadius: BorderRadius.circular(10),
                       child: Image.asset(_workOutList[index].imageUrl),
                     )),
                     Positioned(top: 10,
                       right: 10,  child: _workOutList[index].isTopRated? Image.asset("assets/medal.png", height: 50,) : const Text("")),
                     Positioned(
                         top: 10,
                         left: 20,
                         child: Text(_workOutList[index].time.toString() + "Hours", style: TextStyle(
                       color: Colors.white
                     ),)),
                     Positioned(
                         top: 30,
                         left: 20,
                         child: Text(_workOutList[index].exercises.toString() + "exercises", style: TextStyle(
                             color: Colors.white
                         ),)),
                     Positioned(
                         top: 50,
                         left: 20,
                         child: Text(r"$" + _workOutList[index].cost.toString(), style: TextStyle(
                             color: Colors.white
                         ),)),

                     Positioned(
                         bottom: 30,
                         left: 20,
                         child: Text(_workOutList[index].title.toString() + "exercises", style: TextStyle(
                             color: Colors.white,
                           fontWeight: FontWeight.w800,
                           fontSize: 20
                         ),)),

                   ],
               ),
                  ),
                );
              } ),
            ))
          ],
        ),
      ),
    );
  }
}
