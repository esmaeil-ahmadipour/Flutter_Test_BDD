import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        key: ValueKey('app_bar'),
        title: Text(widget.title),
        leading:  Padding(
          padding: const EdgeInsets.all(4.0),
          child: FlatButton(
            padding: EdgeInsets.zero,
            color: Colors.white,
            shape: CircleBorder(),
            onPressed: () => _showDialog(),
            child: Icon(
              Icons.mark_chat_unread_outlined,
              color: Theme.of(context).accentColor,
            ),
       ),
        ),
      ),
      body: buildBody(context),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'A number that is set :',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline2,
            key: ValueKey('counted_number'),
          ),
        ],
      ),
    );
  }

  Widget buildFloatingActionButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.green,
          key: ValueKey('increment_button'),
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.keyboard_arrow_up_outlined),
        ),
        FloatingActionButton(
          backgroundColor: Colors.red,
          key: ValueKey('decrement_button'),
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: Icon(Icons.keyboard_arrow_down_outlined),
        )
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _showDialog(){
    showDialog(
      barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return AlertDialog(
        title: Text('Current number is : '),
          content: Text ('Number : $_counter\n',key: ValueKey('alert_text'),),
          actions: [FlatButton(
            padding: EdgeInsets.zero,
            key: ValueKey('close_button'),
            color: Theme.of(context).accentColor,
            splashColor: Theme.of(context).splashColor,
            shape: CircleBorder(),
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),],
        );
      }
    );
  }
}
