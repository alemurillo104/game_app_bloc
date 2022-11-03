import 'package:flutter/material.dart';

class AllGamesButton extends StatelessWidget {
  const AllGamesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.amberAccent,
      ),
      onPressed: () {},
      child: const Text('View more',
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
      )
    );
  }
}