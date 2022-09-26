import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';





class AnimationList extends StatefulWidget {
  const AnimationList({super.key});

  @override
  State<AnimationList> createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {

 final  GlobalKey<AnimatedListState> key = GlobalKey();

List<String> list= [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
    appBar: AppBar(
      title: Text("Animated List One"),
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        insertItems(0,list);
      },
    child: Icon(Icons.add),
    ),
   body:  AnimatedList(
     key: key,
    initialItemCount:list.length,

     itemBuilder:(context,index,animation)
     {
     return motion (list[index],animation,index); },
   ),
  
    );
  }
    
  void removedItem(int index){
  final remove =  list.removeAt(index);
      Duration   duration = Duration(seconds: 1);

  key.currentState?.removeItem (index,
(context,animation) => motion (list[index],animation,index),);


  }

  void insertItems(int i, list){
    list.insert(i,"list${list.length}");
      key.currentState?.insertItem (i);

  }

  Widget motion (String list,Animation<double> animation,int index){
  return SlideTransition(
   position: Tween<Offset>(begin: const Offset(1,0),end: Offset(0, 0)).animate(animation) ,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child: ListTile(
          title: Text(list),
          trailing: IconButton(onPressed: (){
removedItem(index);
          }
          , icon:Icon( Icons.close)),
        ),
      ),
    ),
  );

  }
}
