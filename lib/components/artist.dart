import 'package:flutter/material.dart';

class Artist extends StatefulWidget {
  String artistImageURL;
  String artistName;

  Artist({this.artistImageURL = '', this.artistName = ''});

  _ArtistState createState() =>
      _ArtistState(artistImageURL: artistImageURL, artistName: artistName);
}

class _ArtistState extends State<Artist> {
  bool _selected = false;
  String artistImageURL;
  String artistName;

  CircleBorder _blueBorder = CircleBorder(
      side: BorderSide(color: Color.fromRGBO(59, 219, 247, 1), width: 3.0));
  CircleBorder _blackBorder =
      CircleBorder(side: BorderSide(color: Colors.white, width: 3.0));

  _ArtistState({this.artistImageURL = '', this.artistName = ''});

  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: EdgeInsets.all(6.0),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: _selected ? _blueBorder : _blackBorder,
                      clipBehavior: Clip.antiAlias,
                      child: Ink.image(
                        image: NetworkImage(artistImageURL),
                        fit: BoxFit.fitHeight,
                        width: MediaQuery.of(context).size.height * 0.11,
                        height: MediaQuery.of(context).size.height * 0.11,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selected = !_selected;
                            });
                          },
                        ),
                      ),
                      elevation: 10.0,
                    ),
                    Text(artistName,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.width * 0.01,
            child: Opacity(
              opacity: _selected ? 1.0 : 0.0,
              child: Image.asset(
                'assets/images/blue_tick.png',
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
