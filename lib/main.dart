import 'package:flutter/material.dart';

import 'package:widgets_demo/src/pages/demo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs',
      
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget Demo'),
          
        ),

        body: Center(
            child: DemoPage(),
        )
      )

    );
  }
}
