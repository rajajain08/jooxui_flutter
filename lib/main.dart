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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Color.fromRGBO(112, 124, 146, 1),
            Color.fromRGBO(32, 30, 35, 0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Container(
                height: 100,
                child: ScrollConfiguration(
                  behavior: NoScrollSideEffect(),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller1,
                    itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              )),
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Container(
                height: 100,
                child: ScrollConfiguration(
                  behavior: NoScrollSideEffect(),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller2,
                    itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              )),
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Container(
                height: 100,
                child: ScrollConfiguration(
                  behavior: NoScrollSideEffect(),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller3,
                    itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              )),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoScrollSideEffect extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
