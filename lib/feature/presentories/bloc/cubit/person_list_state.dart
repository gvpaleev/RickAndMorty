part of 'person_list_cubit.dart';

@freezed
class PersonListState with _$PersonListState {
  const factory PersonListState.initial() = _Initial;
  const factory PersonListState.loading(
      {required List<PersonEntity>? oldPersonList,
      required bool? isFitstFetch}) = _Loading;
  const factory PersonListState.loaded(
      {required List<PersonEntity> personList}) = _Loaded;
  const factory PersonListState.error() = _Error;
}
