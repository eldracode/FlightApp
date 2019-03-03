import 'CustomShapeClipper.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'Flight List Mock up',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          HomeScreenTopPart(),
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var firstColor = Color(0xFFF47D15);
  var secondColor = Color(0xFFEF772C);

  List<String> locations = ["Boston (BOS)", "New York City (JFK)"];

  TextStyle dropDownLabelstyle = TextStyle(fontSize: 16.0, color: Colors.white);
  TextStyle dropDownMenustyle = TextStyle(fontSize: 16.0, color: Colors.black);

  var theme = new ThemeData(
    primaryColor: Color(0xFFF3791A),
    fontFamily: 'Oxygen',
  );

  var selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                firstColor,
                secondColor,
              ],
            )),
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      new PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: new Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocationIndex],
                              style: dropDownLabelstyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(
                                  locations[0],
                                  style: dropDownMenustyle,
                                ),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(
                                  locations[1],
                                  style: dropDownMenustyle,
                                ),
                                value: 1,
                              ),
                            ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      'Where would\nyou want to go?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    // Padding(
                    //    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    //   child:
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: new TextField(),
                    ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
