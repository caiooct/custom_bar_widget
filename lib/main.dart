import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: 360,
              child: CustomBar(percentage: 0.04),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBar extends StatelessWidget {
  const CustomBar({required this.percentage, super.key})
      : assert(percentage >= 0 && percentage <= 1);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          LayoutBuilder(
            builder: (_, constraints) {
              return Container(
                width: constraints.maxWidth * percentage,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: percentage == 1.0 || percentage == 0.0
                      ? null
                      : const Border(right: BorderSide()),
                ),
              );
            },
          ),
          const Positioned(
            left: 16.0,
            child: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}
