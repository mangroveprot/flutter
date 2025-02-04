import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 120,
              height: 80,
              decoration: const BoxDecoration(color: Colors.red),
            ),
            Container(
              width: 120,
              height: 80,
              decoration: const BoxDecoration(color: Colors.green),
            ),
            Container(
              width: 120,
              height: 80,
              decoration: const BoxDecoration(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
