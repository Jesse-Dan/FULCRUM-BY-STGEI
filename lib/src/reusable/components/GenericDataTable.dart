import 'package:flutter/material.dart';

import '../styles/Colors.dart';

class GenericDataTable<T> extends StatelessWidget {
  final List<String> headers; // Keep headers as String type
  final List<List<dynamic>> rows; // Use a more flexible type for rows
  final Color headingColor;
  final Color borderColor;

  const GenericDataTable({
    Key? key,
    required this.headers,
    required this.rows,
    this.headingColor = AppColors.kOtherPurple,
    this.borderColor = AppColors.kOtherPurple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: .2),
        ),
        child: DataTable(
          dividerThickness: 0,
          // columnSpacing: 20,
          dataRowHeight: 40,
          headingRowHeight: 40,
          columns: headers
              .map(
                (header) => DataColumn(
                  label: Text(header,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: headingColor)),
                ),
              )
              .toList(),
          rows: rows
              .map(
                (row) => DataRow(
                  cells: row
                      .map(
                        (cell) => DataCell(
                          // Handle potential text conversion or custom widgets
                          cell is String
                              ? Text(cell,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300))
                              : _buildCustomCell(
                                  cell), // Handle custom cell types
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // Optional method for handling custom cell types
  Widget _buildCustomCell(dynamic cell) {
    // Implement logic to build widgets based on cell type (e.g., Image, Icon)
    return const Text('Custom Cell',
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color:
                AppColors.kOtherPurple)); // Placeholder for custom cell widget
  }
}
