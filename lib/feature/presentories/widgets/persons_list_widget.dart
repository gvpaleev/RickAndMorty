import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/presentories/bloc/cubit/person_list_cubit.dart';
import 'package:rick_and_morty/feature/presentories/widgets/person_card_widget.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonListCubit, PersonListState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(
            child: const Center(
              child: Text('initial'),
            ),
          ),
          loading: (_1, _2) => Container(
            child: const Center(
              child: Text('loading'),
            ),
          ),
          loaded: (personList) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return PersonCard(person: personList[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: 20,
            );
          },
          error: () => Container(
            child: const Center(
              child: Text('error'),
            ),
          ),
        );
      },
    );
  }
}
