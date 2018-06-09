
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/forecast/background/background_with_rings.dart';
import 'package:flutter_weather_app/forecast/background/rain.dart';
import 'package:flutter_weather_app/generic_widgets/radial_list.dart';

class Forecast  extends StatelessWidget {
  final String temprature;
  RadialListViewModel radialList;
  SlidingRadialListController slidingListController;

  Forecast({
    @required this.radialList,
    @required this.slidingListController
});

  Widget _temperatureText() {
    return new Align(
      alignment: Alignment.centerLeft,
      child: new Padding(
        padding: const EdgeInsets.only(top: 150.0, left: 10.0),
        child: new Text(
          '69°',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 80.0
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new BackgroundWithRings(),
        _temperatureText(),

        new SlidingRadialList(
          radialList: radialList,
          controller: slidingListController,
        ),
        new Rain()
      ],
    );
  }
}
