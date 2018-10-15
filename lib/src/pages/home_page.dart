import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> list = new List();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("ZunRoof App"),
      ),

      body: buildBody(),
    );
  }

 Widget buildBody() {
    return Stack(
      children: <Widget>[

        buildList(),

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                FloatingActionButton(
                  child: Icon(Icons.highlight_off),
                  onPressed: _deleteCallback,
                ),

                Padding(padding: EdgeInsets.only(left: 50.0)),

                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: _addCallback,
                ),

              ],
            ),
          ),
        )
      ],
    );
 }

 Widget buildList() {
    return ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.only(bottom: 80.0),
        itemBuilder: (context, index){
          return Column(
            children: <Widget>[

              ListTile(
                title: Text("Hello", style: TextStyle(fontSize: 20.0)),
                subtitle: Text("I am in Zunroof ${index+1}"),
              ),
              Divider()
            ],
          );
        }
    );
 }

  void _addCallback() {

    if(list.length == 10)
      {
        scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("Can't add more than 10 items")));
        return;
      }

    setState(() {
      list.add("Hello");
    });

  }

  void _deleteCallback() {
    if(list.length == 0)
    {
      scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("List is empty")));
      return;
    }

    setState(() {
      list.removeLast();
    });
  }
}
