import 'package:flutter/material.dart';

class WeekDrawer extends StatelessWidget {
  final week = [
    'Tuesday\nAugust 27',
    'Wednesday\nAugust 28',
    'Thursday\nAugust 29',
    'Friday\nAugust 30',
    'Saturday\nAugust 31',
    'Sunday\nAugust 1',
    'Monday\nAugust 2',
  ];

  final Function onDaySelected;

  WeekDrawer({
    this.onDaySelected
  });

  List<Widget> _buildDayButton() {
    return week.map((String title) {
      return new Expanded(
                  child: new GestureDetector(
                    onTap: (){
                      onDaySelected(title);
                    },
                    child: new Text(
                      title,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 14.0
                      ),
                    ),
                  ),
                );
    }).toList();
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Container(
            height: double.infinity,
            width: 125.0,
            color: const Color(0xAA234060),
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: new Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ]
              ..addAll(_buildDayButton()),
            ),
          );
    }
}
