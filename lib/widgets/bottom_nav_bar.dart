import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.home_filled, size: 35),
            Icon(CupertinoIcons.play_rectangle, size: 28),
            Icon(CupertinoIcons.paperplane, size: 27),
            Icon(CupertinoIcons.search, size: 29),

            CircleAvatar(
              radius: 17,
              child: Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: 29,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
