class AzkarModel {
  final String zekr;
  final int repeat;
  final String bless;

  AzkarModel({required this.zekr, required this.repeat, required this.bless});

  factory AzkarModel.fromJson(Map<String , dynamic> res) {
    return AzkarModel(
      zekr: res['zekr'],
      repeat: res['repeat'],
      bless: res['bless'],
    );
  }
}
