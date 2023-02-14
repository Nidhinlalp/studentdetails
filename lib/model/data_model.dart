import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String clas;

  @HiveField(4)
  final String address;

  StudentModel({
    required this.name,
    required this.age,
    this.id,
    required this.clas,
    required this.address,
  });
}
