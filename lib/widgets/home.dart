import 'package:flutter/material.dart';
import 'column_example.dart';
import 'row_example.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Text(
              "Row Example",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RowExample(),
            Text(
              "Column Example",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ColumnExample()
          ],
        ),
      ),
    );
  }
}
