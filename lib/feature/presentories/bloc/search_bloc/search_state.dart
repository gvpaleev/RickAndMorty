part of 'search_bloc.dart';

@freezed
class PersonSearchState with _$PersonSearchState {
  const factory PersonSearchState.initial() = _Initial;
  const factory PersonSearchState.loading() = _Loading;
  const factory PersonSearchState.loaded({required List<PersonEntity> person}) =
      _Loaded;
  const factory PersonSearchState.error({required String message}) = _Error;
}
