part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded({required List<PersonEntity> person}) =
      _Loaded;
  const factory SearchState.error({required String message}) = _Error;
}
