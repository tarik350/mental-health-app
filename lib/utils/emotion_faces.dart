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

class Emotion extends StatefulWidget {
  String emotion;
  Emotion({Key? key, required this.emotion}) : super(key: key);

  @override
  State<Emotion> createState() => _EmotionState();
}

class _EmotionState extends State<Emotion> with SingleTickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 1));
  late Animation<double> aniamtion;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    aniamtion = aniamtion =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: Colors.blue[600], borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: ScaleTransition(
          scale: aniamtion,
          child: Text(
            widget.emotion,
            style: const TextStyle(fontSize: 32),
          ),
        )),
      ),
    );
  }
}
