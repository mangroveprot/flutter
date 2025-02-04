import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //xmainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Container(
                  width: 120,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Container(
                  width: 120,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Container(
                  width: 120,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
