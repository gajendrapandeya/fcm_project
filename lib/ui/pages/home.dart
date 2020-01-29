import 'package:flutter/material.dart';
import '../../resources/db_provider.dart';
import '../../models/item_model.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];

  void initState() {
    super.initState();
  }

  Future<List> getItems() async {
    return DbProvider().fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 2 build app bar
      body: FutureBuilder(
        future: getItems(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
          if(snapshot.hasError) return Center(child: Text("There was an error ${snapshot.error}" ),);
          List items = snapshot.data;

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              ItemModel item = ItemModel.fromMap(items[index]);
              //TODO 2.1 build ListTile with title and description
              //TODO 2.2 Add circle avatar to show the image
              //TODO 2.3 onTap navigate to details page
              //TODO 2.4 add delete IconButton
              //TODO 2.5 call delete function on press delete button
              return Container();
            },
          );
        },
      ),

      //TODO 2.6 Add floating action button
      //TODO 2.7 onPressed navigate to AddItem page
      backgroundColor: Colors.green[200],
    );
  }

  void _delete(ItemModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete item"),
          content: Text("Are you sure you want to delete Item?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: ()=>Navigator.pop(context),
            ),
            FlatButton(
              child: Text("Delete"),
              onPressed: (){
                removeItem(item);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (_) => HomePage()
                ));
                
              }
            )
          ],
        );
      }
    );
  }

  void removeItem(ItemModel item) {
    setState(() { 
      DbProvider().deleteItem(item.id);
    });
  }

}
