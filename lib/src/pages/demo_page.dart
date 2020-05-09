import 'package:flutter/material.dart';

import 'package:widgets_demo/src/widgets/radial_progress.dart';

class DemoPage extends StatefulWidget {

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        mainAxisSize: MainAxisSize.max,

        children: <Widget>[
          
          Container(
            width: 150,
            height: 150,

            child: RadialProgress(progress: 50.0, primaryColor: Colors.orange,)
          )

          
        ],
      ),
    );
  }
}