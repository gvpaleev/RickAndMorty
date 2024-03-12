import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
    await Future.delayed(Duration(seconds: 3));
    emit(PersonListState.loading(oldPersonList: null, isFitstFetch: null));
    await Future.delayed(Duration(seconds: 3));
    emit(PersonListState.loaded(personList: null));
    await Future.delayed(Duration(seconds: 3));
    emit(PersonListState.error());
  }
}
