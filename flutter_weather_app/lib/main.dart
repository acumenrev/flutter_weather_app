import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_weather_app/forecast/forecast.dart';
import 'package:flutter_weather_app/forecast/forecast_list.dart';
import 'package:flutter_weather_app/generic_widgets/radial_list.dart';
import 'forecast/background/background_with_rings.dart';
import 'forecast/forecast_appbar.dart';
import 'forecast/week_drawer.dart';
import 'generic_widgets/slider_drawer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  SlidingRadialListController slidingListController;
  OpenableController openableController;
  String selectedDay = 'Monday, August 26';

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      openableController = new OpenableController(
        vsync: this, 
        openDuration: new Duration(milliseconds: 250)
        )
        ..addListener(() => setState(() {

        }));

      slidingListController = new SlidingRadialListController(
        vsync: this,
        itemCount:  forecastRadialList.items.length
      )
      ..open();
    }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Forecast(
            radialList: forecastRadialList,
            slidingListController: this.slidingListController,
          ),
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: new ForecastAppBar(
              onDrawArrowTap: openableController.open,
              selectedDay: this.selectedDay,
            )
          ),
          new SlidingDrawer(
            drawer: new WeekDrawer(
                      onDaySelected: (String title) {
                        openableController.close();
                        setState(() {
                          this.selectedDay = title.replaceAll('\n', ', ');
                        });

                        slidingListController
                            .close()
                            .then((_) => slidingListController.open());
                      },
                    ),
                    openableController: this.openableController,
          )
        ],
      )
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

