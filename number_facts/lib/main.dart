import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:number_facts/core/data/adapters/number_fact_adapter.dart';
import 'package:number_facts/core/data/data_source/history_local_datasource.dart';
import 'package:number_facts/core/data/data_source/numbers_remote_datasource.dart';
import 'package:number_facts/core/data/repositories/number_fact_repository.dart';
import 'package:number_facts/core/router/app_router.dart';
import 'package:number_facts/core/style/theme.dart';
import 'package:number_facts/features/fact/presentation/bloc/fact_bloc.dart';
import 'package:number_facts/features/history/presentation/bloc/history_bloc.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NumberFactAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<http.Client>(create: (context) => http.Client()),
        RepositoryProvider<NumbersRemoteDatasource>(
          create: (context) =>
              NumbersRemoteDatasource(client: context.read<http.Client>()),
        ),
        RepositoryProvider<NumbersLocalDatasource>(
          create: (context) => NumbersLocalDatasource(),
        ),
        RepositoryProvider<NumberFactRepository>(
          create: (context) => NumberFactRepository(
            remoteDatasource: context.read<NumbersRemoteDatasource>(),
            localDatasource: context.read<NumbersLocalDatasource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FactBloc>(
            create: (context) => FactBloc(context.read<NumberFactRepository>()),
          ),
          BlocProvider<HistoryBloc>(
            create: (context) =>
                HistoryBloc(context.read<NumberFactRepository>()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Number Facts',
          theme: AppTheme.theme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
