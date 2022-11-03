import 'package:flutter/material.dart';

import 'package:stripe_app/ui/home/widgets/all_games_widget/all_games_widget.dart';
import 'package:stripe_app/ui/home/widgets/category_widget/category_widget.dart';
import 'package:stripe_app/ui/home/widgets/games_by_category_widget/game_by_category_widget.dart';
import 'package:stripe_app/ui/home/widgets/header_title/header_title.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const  [
           HeaderTitle(),
          _BackgroundWidget(
            children: [
              CategoryWidget(),
              GameByCategoryWidget(),
              AllGamesWidget()
            ],
          )
        ],
      ),
    );
  }
}

class _BackgroundWidget extends StatelessWidget {

  final List<Widget> children;

  const _BackgroundWidget({
    Key? key, required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200, left: 0, right: 0,
      child: Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const <BoxShadow>  [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
          ),
        ),
      )
    );
  }
}