import 'package:flutter/material.dart';
import 'package:quiz_apps/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(
              itemData: data,
            );
          }).toList(),
        ),
      ),
    );
  }
}
