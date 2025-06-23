import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_facts/features/history/presentation/bloc/history_bloc.dart';
import 'package:number_facts/features/history/presentation/widgets/history_item.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(LoadHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Історія')),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HistoryLoaded) {
            if (state.facts.isEmpty) {
              return Center(
                child: Text('Історія порожня', style: TextStyle(fontSize: 20)),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.only(top: 8.0),
              itemCount: state.facts.length,
              itemBuilder: (context, index) {
                final fact = state.facts[index];
                return HistoryItem(fact: fact);
              },
            );
          }
          if (state is HistoryError) {
            return Center(
              child: Text(
                'Помилка завантаження історії',
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
