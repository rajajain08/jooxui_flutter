import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController controller1 = new ScrollController();
  ScrollController controller2 = new ScrollController();
  ScrollController controller3 = new ScrollController();
  @override
  void initState() {
    super.initState();
    controller1.addListener(function1);
    controller2.addListener(function2);
    controller3.addListener(function3);
  }

  function1() {
    if (controller1.position.isScrollingNotifier.value) {
      if (controller1.position.userScrollDirection == ScrollDirection.reverse &&
          !controller1.position.atEdge) {
        controller2.jumpTo(
          controller2.offset + 1,
        );
        controller3.jumpTo(
          controller3.offset + 1,
        );
      }

      if (controller1.position.userScrollDirection == ScrollDirection.forward &&
          !controller1.position.atEdge) {
        controller2.jumpTo(
          controller2.offset - 1,
        );
        controller3.jumpTo(
          controller3.offset - 1,
        );
      }
    }
  }

  function2() {
    if (controller2.position.isScrollingNotifier.value) {
      if (controller2.position.userScrollDirection == ScrollDirection.reverse &&
          !controller2.position.atEdge) {
        controller1.jumpTo(
          controller1.offset + 1,
        );
        controller3.jumpTo(
          controller3.offset + 1,
        );
      }

      if (controller2.position.userScrollDirection == ScrollDirection.forward &&
          !controller2.position.atEdge) {
        controller1.jumpTo(
          controller1.offset - 1,
        );
        controller3.jumpTo(
          controller3.offset - 1,
        );
      }
    }
  }

  function3() {
    if (controller3.position.isScrollingNotifier.value) {
      if (controller3.position.userScrollDirection == ScrollDirection.reverse &&
          !controller3.position.atEdge) {
        controller2.jumpTo(
          controller2.offset + 1,
        );
        controller1.jumpTo(
          controller1.offset + 1,
        );
      }

      if (controller3.position.userScrollDirection == ScrollDirection.forward &&
          !controller3.position.atEdge) {
        controller2.jumpTo(
          controller2.offset - 1,
        );
        controller1.jumpTo(
          controller1.offset - 1,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdas'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller1,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              //  height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller2,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller3,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                    width: 160.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
