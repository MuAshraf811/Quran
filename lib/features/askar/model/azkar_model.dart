  import 'package:hive/hive.dart';
  part 'azkar_model.g.dart';

  @HiveType(typeId: 0)
  class AzkarModel extends HiveObject {
  @HiveField(0)
  final String zekr;
  @HiveField(1)
  final int repeat;
  @HiveField(2)
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
