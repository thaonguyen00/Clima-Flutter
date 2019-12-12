import 'location.dart';
import 'networking.dart';

const apiKey = 'b246c3d7eca1a2a598a50eeb97d2fbfe';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    var url = '$openWeatherMapURL?q=$city&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentPosition();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
