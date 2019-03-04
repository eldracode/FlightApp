import 'CustomShapeClipper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'customBottomBar.dart';

void main() => runApp(new MaterialApp(
      title: 'Flight List Mock up',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: customBottomBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Column(
          children: <Widget>[
            HomeScreenTopPart(),
            HomeScreenBottomPart,
          ],
        ),
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

var firstColor = Color(0xFF74B9FF);
var secondColor = Color(0xFF0A79DF);

List<String> locations = ["Delhi (DEL)", "Hyderabad (HYD)"];

TextStyle dropDownLabelstyle = TextStyle(fontSize: 16.0, color: Colors.white);
TextStyle dropDownMenustyle = TextStyle(fontSize: 16.0, color: Colors.black);

var theme = new ThemeData(
  primaryColor: Color(0xFF3498DB),
  fontFamily: 'Oxygen',
);

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;

  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 360,
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
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: new Container(
                          width: 400,
                          child: TextField(
                            style: dropDownMenustyle,
                            controller:
                                TextEditingController(text: locations[1]),
                            cursorColor: theme.primaryColor,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 32.0, vertical: 14.0),
                                border: InputBorder.none,
                                suffixIcon: Material(
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                )),
                          )),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                      child:
                          ChoiceChip(Icons.flight, "Flights", isFlightSelected),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFlightSelected = false;
                        });
                      },
                      child:
                          ChoiceChip(Icons.hotel, "Hotels", !isFlightSelected),
                    ),
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

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}

final formatCurrency = NumberFormat.simpleCurrency(name: 'INR');

var HomeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Currently Watched Items",
            style: dropDownMenustyle,
          ),
          Spacer(),
          Text(
            "VIEW ALL(12)",
            style: TextStyle(
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 230,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: CityCards,
      ),
    ),
  ],
);

List<CityCard> CityCards = [
  CityCard('assets/agra.jpg', "Agra", "March 2019", 2250, 45, 4299),
  CityCard('assets/mumbai.jpg', "Mumbai", "Apr 2019", 4159, 55, 9999),
  CityCard('assets/jaipur.jpg', "Jaipur", "June 2019", 6450, 50, 12900),
];

class CityCard extends StatelessWidget {
  var imagePath, cityName, monthYear, newPrice, discount, oldPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.newPrice,
      this.discount, this.oldPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                    height: 210.0,
                    width: 160.0,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    )
                    //color: Colors.orange,
                    ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1),
                        ])),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${cityName}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '${monthYear}',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          '$discount%',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 5.0,
              ),
              Text(
                '${formatCurrency.format(newPrice)}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '(${formatCurrency.format(oldPrice)})',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
