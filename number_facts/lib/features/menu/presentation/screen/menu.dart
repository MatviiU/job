import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_facts/core/router/app_router.dart';
import 'package:number_facts/features/fact/presentation/bloc/fact_bloc.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Меню'),
        actions: [
          IconButton(
            onPressed: () => context.router.push(HistoryRoute()),
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocListener<FactBloc, FactState>(
          listener: (context, state) {
            if (state is FactLoaded) {
              _numberController.clear();
              FocusScope.of(context).unfocus();
              context.router.push(FactRoute(fact: state.fact));
            } else if (state is FactError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _numberController,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      decoration: InputDecoration(label: Text('Введіть число')),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<FactBloc, FactState>(
                      builder: (context, state) {
                        if (state is FactLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_numberController.text.trim().isNotEmpty) {
                                  context.read<FactBloc>().add(
                                    GetFactForNumber(
                                      _numberController.text.trim(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Введіть число'),
                                      backgroundColor: Colors.orangeAccent,
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Отримати факт про число',
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () =>
                                  context.read<FactBloc>().add(GetRandomFact()),
                              child: Text(
                                'Випадковий факт',
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
