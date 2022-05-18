import 'package:flutter/material.dart';
import 'package:workout/widget/gym_category.dart';


class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GynCategory(imageUrl: "assets/gym1.png", title: "CrossFit", color: Color(0xff8e44ad),),
        GynCategory(imageUrl: "assets/gym2.png", title: "Fitness", color: Color(0xffe74c3c),),
        GynCategory(imageUrl: "assets/gym3.png", title: "Gymnastics", color: Color(0xfff39c12),),
        GynCategory(imageUrl: "assets/gym4.png", title: "Aerobics", color: Color(0xff2ecc71),),

      ],
    );
  }
}
