

// class SaurahContentModel {
//   final int number;
//   final String name;
//   final List<List<Ayahs>> ayahs;
//   SaurahContentModel(
//       {required this.number, required this.name, required this.ayahs});

//   factory SaurahContentModel.fromJson(Map response) {
//     return SaurahContentModel(
//         number: response['number'], name: response['name'], ayahs: allAyahs);
//   }
// }

class Ayahs {
  final int number;
  final String text;
  final int numberInSurah;
  final int page;
// final bool sajda;
  final int juz;

  Ayahs({
    required this.number,
    required this.text,
   // required this.sajda,
    required this.numberInSurah,
    required this.juz,
    required this.page,
  });

  factory Ayahs.fromJson(Map res) {
    return Ayahs(
        number: res['number'],
        text: res['text'],
       // sajda: res['sajda'],
        numberInSurah: res['numberInSurah'],
        juz: res['juz'],
        page: res['page']);
  }
}
