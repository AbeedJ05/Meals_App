import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
class CategoriesSecreen extends StatelessWidget{
const CategoriesSecreen({super.key});
@override
Widget build(context){
return Scaffold(
  appBar: AppBar(
    title: const Text("Categories"),
  ),
  body: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2 ,
    childAspectRatio: 1.5,
    crossAxisSpacing: 20,
    mainAxisExtent: 20),
    children: [
      Text("1" , style: TextStyle(color: Colors.white,)),
      Text("1" , style: TextStyle(color: Colors.white,)),
      Text("1" , style: TextStyle(color: Colors.white,)),
      Text("1" , style: TextStyle(color: Colors.white,)),
      Text("1" , style: TextStyle(color: Colors.white,)),
      Text("1" , style: TextStyle(color: Colors.white,)),
    ],),
);
}
}