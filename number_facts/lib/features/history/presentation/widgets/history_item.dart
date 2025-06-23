import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:number_facts/core/data/models/number_fact.dart';
import 'package:number_facts/core/router/app_router.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.fact});

  final NumberFact fact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(fact.number),
        subtitle: Text(fact.fact, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () {
          context.router.push(FactRoute(fact: fact));
        },
      ),
    );
  }
}
