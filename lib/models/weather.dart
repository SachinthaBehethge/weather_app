class Weather{
  int id;
  String main;
  String description;
  String icon;
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  //String pressure;
  int humidity;

  Weather({this.id, this.description, this.icon, this.feelsLike, this.main, this.temp, this.tempMax, this.tempMin, this.humidity});
}