import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 200,
      color: Colors.deepOrangeAccent,
      child: Column(
        children: [
          const SizedBox( height: 100),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                     Text('Welcome Alejandra!🙌', style: TextStyle(fontSize: 25), textAlign: TextAlign.start,),
                     Text('What would you like to play?', style: TextStyle(fontSize: 12), textAlign: TextAlign.left,),
                  ],
                ),
                const SizedBox(width: 30),
                const CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  maxRadius: 40,
                  backgroundImage: NetworkImage(
                    'https://www.w3schools.com/howto/img_avatar2.png',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}