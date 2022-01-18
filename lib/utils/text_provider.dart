class TextProvider{

  String maxMinTemp(double maxTemp, double minTemp){
    if (maxTemp != null && minTemp != null){
      return "H ${(maxTemp - 273.15).floor().toString()}°C / L ${(minTemp - 273.15).floor().toString()}°C";
    } else{
      return "";
    }
  }

  String mainTemp(double mainTemp){
    if (mainTemp != null){
      return "${(mainTemp - 273.15).floor().toString()}°";
    } else{
      return "";
    }
  }

  String humidityText(int humidity){
    if (humidity != null){
      return "${humidity.toString()}%";
    } else{
      return "";
    }
  }

  String descriptionText(String desc, double feelsLike){
    if (desc != null && feelsLike != null){
      String upperDesc = desc[0].toUpperCase() + desc.substring(1);
      return "$upperDesc. \nFeels like ${(feelsLike - 273.15).floor().toString()}°C";
    } else{
      return "";
    }
  }
}