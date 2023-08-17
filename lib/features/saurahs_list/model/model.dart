class DataModel {
  final int number;
  final int numberOfAyahs;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;

  DataModel({
    required this.number,
    required this.numberOfAyahs,
    required this.name,
    required this.revelationType,
    required this.englishName,
    required this.englishNameTranslation,
  });

  factory DataModel.fromJson(Map<String, dynamic> res) {
    return DataModel(
        number: res['number'],
        numberOfAyahs: res['numberOfAyahs'],
        name: res['name'],
        revelationType: res['revelationType'],
        englishName: res['englishName'],
        englishNameTranslation: res['englishNameTranslation']);
  }
}
