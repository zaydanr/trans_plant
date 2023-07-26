class Weather{
  var cityName;
  var icon;
  var condition;
  var temp;
  var humidity;
  var last_update;

  Weather(
    {
      required this.cityName, required this.icon, required this.condition, required this.temp, required this.humidity, required this.last_update
    }
  );
}