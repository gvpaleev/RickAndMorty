import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/feature/data/models/person_model.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/usecases/get_all_persons.dart';

part 'person_list_state.dart';
part 'person_list_cubit.freezed.dart';

class PersonListCubit extends Cubit<PersonListState> {
  final GetAllPersons getAllPersons;
  PersonListCubit({required this.getAllPersons})
      // PersonListCubit()
      : super(PersonListState.initial());
  void loadPerson() async {
    final failureOrPerson = await getAllPersons(PagePersonParams(page: 1));

    failureOrPerson.fold((error) => emit(PersonListState.error()), (character) {
      // page++;
      // final persons = (state as PersonLoading).oldPersonsList;
      // persons.addAll(character);
      // print('List length: ${persons.length.toString()}');
      emit(PersonListState.loaded(personList: character));
    });
    // await Future.delayed(Duration(seconds: 3));
    // emit(PersonListState.loading(oldPersonList: null, isFitstFetch: null));
    // await Future.delayed(Duration(seconds: 3));
    // emit(PersonListState.loaded(personList: failureOrPerson));
    // await Future.delayed(Duration(seconds: 3));
    // emit(PersonListState.error());
  }
}
