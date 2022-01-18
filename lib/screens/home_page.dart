import 'package:flutter/material.dart';
import 'package:weather_app/data/api_weather.dart';
import 'package:weather_app/models/coordinate.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/text_provider.dart';
import 'package:weather_app/utils/text_styles.dart';
import 'package:weather_app/widgets/bottom_button.dart';
import 'package:weather_app/widgets/search_input.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/widgets/top_line.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Coordinate coordinate = Coordinate();
  Weather weather = Weather();

  TextEditingController cityNameTxt = TextEditingController();
  PanelController _bottomController = PanelController();

  bool _loading = false;

  @override
  void initState() {
    getWeather("colombo");
    super.initState();
  }

  void getWeather(String cityName) async {
    WeatherApi weatherClass = WeatherApi();
    await weatherClass.getDataByCityName(cityName).then((value) {
      coordinate = weatherClass.coordinateData;
      weather = weatherClass.weatherData;
    });

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: Stack(
        children: <Widget>[
          Positioned(
              right: -40.0,
              top: MediaQuery.of(context).size.height / 4,
              child: weather.icon != null
                  ? Image.asset("assets/images/icons/${weather.icon}.png",
                      height: 250.0)
                  : Container()),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(coordinate.name ?? "Loading..",
                      style: cityNameTextStyle()),
                  SizedBox(height: 8.0),
                  TopLine(),
                  SizedBox(height: 10.0),
                  Text(TextProvider()
                      .maxMinTemp(weather.tempMax, weather.tempMin)),
                  SizedBox(height: 100.0),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(TextProvider().mainTemp(weather.temp),
                              style: weatherBoldTextStyle()),
                          Text(weather.main ?? "",
                              style: weatherMainTextStyle()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 80.0),
                  Row(
                    children: <Widget>[
                      weather.humidity != null
                          ? Icon(Icons.beach_access,
                              color: AppColors.orange, size: 30.0)
                          : CircularProgressIndicator(
                              backgroundColor: AppColors.orange),
                      Text(TextProvider().humidityText(weather.humidity),
                          style: weatherMainTextStyle())
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    TextProvider().descriptionText(
                        weather.description, weather.feelsLike),
                    style: weatherDescriptionTextStyle(),
                  ),
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            minHeight: 24.0,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 10.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              )
            ],
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            controller: _bottomController,
            panel: Container(
              padding: EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  BottomButton(),
                  SizedBox(height: 18.0),
                  SearchInput(
                    controller: cityNameTxt,
                    onPress: () {
                      setState(() {
                        _loading = true;
                        getWeather(cityNameTxt.text);
                      });
                    },
                  ),
                  _loading == false
                      ? buildListView()
                      : Container(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Center(
                            child: CircularProgressIndicator(
                                backgroundColor: AppColors.orange),
                          ),
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildListView() {
    return ListView.builder(
        itemCount: 1,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                coordinate.lon.toString() + " " + coordinate.lat.toString()),
            subtitle: Text("Map Location"),
          );
        });
  }
}
