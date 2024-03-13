import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty/feature/presentories/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/feature/presentories/bloc/cubit/person_list_cubit.dart';
import 'package:rick_and_morty/feature/presentories/pages/person_screen.dart';
// import 'package:rick_and_morty/locator_service.dart' as di;

import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
          create: (context) {
            return sl<PersonListCubit>()..loadPerson();
          },
        ),
        BlocProvider<PersonSearchBloc>(
          create: (context) => sl<PersonSearchBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          backgroundColor: AppColors.mainBackgound,
          scaffoldBackgroundColor: AppColors.mainBackgound,
        ),
        home: HomePage(),
      ),
    );
  }
}
