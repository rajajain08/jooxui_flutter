import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class MusicOnboardingThird extends StatefulWidget {
  MusicOnboardingThird({Key key}) : super(key: key);

  _MusicOnboardingThirdState createState() => _MusicOnboardingThirdState();
}

class _MusicOnboardingThirdState extends State<MusicOnboardingThird> {
  PageController controller;
  var pages = [
    Column(children: <Widget>[
      Container(
        height: 450,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                'https://psmag.com/.image/t_share/MTMzMDU5MDQzMjY1ODgyNzU1/taylor-swift-2jpg.jpg'),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: FlatButton(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(59, 219, 247, 1)),
              borderRadius: BorderRadius.circular(50),
            ),
            height: 50,
            width: 180,
            child: Center(
              child: Text(
                "Follow",
                style: TextStyle(
                  color: Color.fromRGBO(59, 219, 247, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          onPressed: () {},
        ),
      )
    ]),
    Column(
      children: <Widget>[
        Container(
          height: 450,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                  'https://cdn.baeblemusic.com/images/bblog/3-21-2017/ed_sheeranblog-580.jpg'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: FlatButton(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(59, 219, 247, 1)),
                borderRadius: BorderRadius.circular(50),
              ),
              height: 50,
              width: 180,
              child: Center(
                child: Text(
                  "Follow",
                  style: TextStyle(
                    color: Color.fromRGBO(59, 219, 247, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    ),
    Column(
      children: <Widget>[
        Container(
          height: 450,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                  'https://akns-images.eonline.com/eol_images/Entire_Site/2018827/rs_1024x759-180927184903-1024-ariana-grande1.jpg?fit=inside%7C900:auto&output-quality=90'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: FlatButton(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(59, 219, 247, 1)),
                borderRadius: BorderRadius.circular(50),
              ),
              height: 50,
              width: 180,
              child: Center(
                child: Text(
                  "Follow",
                  style: TextStyle(
                    color: Color.fromRGBO(59, 219, 247, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    ),
  ];
  @override
  void initState() {
    controller = new PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 0.8,
    );
    super.initState();
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Songs we recommend",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 600,
              width: double.infinity,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {});
                  },
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (context, index) => Center(child: pages[index])),
            ),
            Column(children: <Widget>[
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
            ]),
          ],
        ),
      ),
    );
  }
}
