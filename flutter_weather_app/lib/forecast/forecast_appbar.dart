import 'package:flutter/material.dart';
import '../generic_widgets/spinner_text.dart';

class ForecastAppBar extends StatelessWidget {
  final Function onDrawArrowTap;
  final String selectedDay;


  ForecastAppBar({
    this.onDrawArrowTap,
    this.selectedDay
  });

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    size: 35.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    onDrawArrowTap();
                  },
                )
              ],
              title: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SpinnerText(
                    text: this.selectedDay,
                  ),
                  new Text(
                    'World',
                    style: new TextStyle(
                      color:  Colors.white,
                      fontSize: 20.0
                    ),
                  )
                ],
              ),
            );
    }
}