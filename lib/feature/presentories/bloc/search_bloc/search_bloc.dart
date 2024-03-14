import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/feature/data/models/person_model.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_person.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class PersonSearchBloc extends Bloc<SearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;
  PersonSearchBloc({required this.searchPerson}) : super(_Initial()) {
    // on<SearchEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    // on<>((event, emit) {

    // });
    on<_SearchPersonEvent>((event, emitter) async {
      emit(_Loading());
      final failureOrPerson =
          await searchPerson(SearchPersonParams(query: event.personQuery));
    });
  }
}
