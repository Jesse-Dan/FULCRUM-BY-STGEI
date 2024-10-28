import 'package:flutter/material.dart';
import 'package:untitled/src/reusable/styles/Colors.dart';

class SubmittedTable extends StatelessWidget {
  final List<String> subjects;
  final List<int> totalQuestions;
  final List<int> attemptedQuestions;
  final List<int> skippedQuestions;
  final List<int> correctQuestions;
  final List<int> wrongQuestions;

  const SubmittedTable({
    Key? key,
    required this.subjects,
    required this.totalQuestions,
    required this.attemptedQuestions,
    required this.skippedQuestions,
    required this.correctQuestions,
    required this.wrongQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kOtherPurple, width: .2),
        ),
        child: DataTable(
          columnSpacing: 20, // Set the spacing between columns
          dataRowHeight: 40, // Set the height of each data row
          headingRowHeight: 40, // Set the height of the heading row
          columns: const [
            DataColumn(
                label: Text('Subjects',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kOtherPurple))),
            DataColumn(
                label: Text('Total Questions',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kOtherPurple))),
            DataColumn(
                label: Text('Attempted Questions',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kOtherPurple))),
            DataColumn(
                label: Text('Skipped Questions',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kOtherPurple))),
            DataColumn(
                label: Text('Correct Questions',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kOtherPurple))),
            DataColumn(
                label: Text('Wrong Questions',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kOtherPurple))),
          ],
          rows: List.generate(
            subjects.length,
            (index) => DataRow(cells: [
              DataCell(Text(subjects[index],
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w300))),
              DataCell(Text(totalQuestions[index].toString(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w300))),
              DataCell(Text(attemptedQuestions[index].toString(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w300))),
              DataCell(Text(skippedQuestions[index].toString(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w300))),
              DataCell(Text(correctQuestions[index].toString(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w300))),
              DataCell(Text(wrongQuestions[index].toString(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w300))),
            ]),
          ),
        ),
      ),
    );
  }
}
