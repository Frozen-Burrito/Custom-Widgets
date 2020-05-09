import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        mainAxisSize: MainAxisSize.max,

        children: <Widget>[
          
          Container(

            width: double.infinity,
            height: 200.0,
            color: Colors.grey,
            child: Center(child: Text('Widget')),
          )
        ],
      ),
    );
  }
}