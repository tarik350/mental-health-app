import 'package:flutter/material.dart';

class EmotionFace extends StatelessWidget {
  final String emotion;

  const EmotionFace({Key? key, required this.emotion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: Colors.blue[600], borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Text(
          emotion,
          style: const TextStyle(fontSize: 32),
        )),
      ),
    );
  }
}
