class AzanModel {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;

  AzanModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
  });

  factory AzanModel.fromJson(Map res) {
    return AzanModel(
      fajr: res['Fajr'],
      sunrise: res['Sunrise'],
      dhuhr: res['Dhuhr'],
      asr: res['Asr'],
      sunset: res['Sunset'],
      maghrib: res['Maghrib'],
      isha: res['Isha'],
    );
  }
}
