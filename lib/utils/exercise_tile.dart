import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  String title;
  String subtitle;
  IconData leadingIcon;
  Color iconColor;

  ExerciseTile(
      {Key? key,
      required this.iconColor,
      required this.title,
      required this.subtitle,
      required this.leadingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: iconColor),
                        child: Icon(
                          leadingIcon,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(this.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          this.subtitle,
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                Icon(Icons.more_horiz)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
