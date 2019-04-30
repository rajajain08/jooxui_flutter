import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jooxui/data.dart';
import 'components/noscroll_side_effect.dart';
import 'package:flare_flutter/flare_actor.dart';

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
            Color.fromRGBO(32, 30, 35, 1),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Container(
            height: 35,
            width: 180,
            decoration: BoxDecoration(
                color: Color.fromRGBO(32, 30, 35, 1),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.terrain,
                      color: Color.fromRGBO(59, 219, 247, 1),
                      size: 30,
                    ),
                    Text("500")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.data_usage,
                      color: Color.fromRGBO(59, 219, 247, 1),
                      size: 30,
                    ),
                    Text("500")
                  ],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Artists you love ",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ScrollConfiguration(
                behavior: NoScrollSideEffect(),
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  scrollDirection: Axis.horizontal,
                  controller: controller1,
                  itemCount: data.length,
                  itemBuilder: (context, index) => data[index],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ScrollConfiguration(
                behavior: NoScrollSideEffect(),
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  scrollDirection: Axis.horizontal,
                  controller: controller2,
                  itemCount: data.length,
                  itemBuilder: (context, index) => data[index],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ScrollConfiguration(
                behavior: NoScrollSideEffect(),
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  scrollDirection: Axis.horizontal,
                  controller: controller3,
                  itemCount: data.length,
                  itemBuilder: (context, index) => data[index],
                ),
              ),
            ),
            Container(
              height: 30,
              width: 30,
              child: FlareActor("assets/flare_animation/arrow.flr",

                  //  alignment: Alignment(bulletXPoint, stream.data),
                  fit: BoxFit.fitWidth,
                  animation: "Untitled"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Swipe Up",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
