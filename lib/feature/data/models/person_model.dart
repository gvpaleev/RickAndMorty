import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/feature/data/models/location_model.dart';
// import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class PersonModel with _$PersonModel {
  const factory PersonModel(
      {required int id,
      required String name,
      required String status,
      required String species,
      required String type,
      required String gender,
      required LocationModel origin,
      required LocationModel location,
      required String episode,
      required DateTime created}) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}
