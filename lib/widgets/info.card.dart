import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InfoCard extends StatelessWidget {
  final String iconLeft;
  final String localidade;
  final String ano;
  final String evento;

  InfoCard(
      {@required this.iconLeft,
      @required this.localidade,
      @required this.ano,
      @required this.evento});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(iconLeft),
                  width: 40,
                  height: 40,
                ),
                Text(
                  localidade, //Basileia
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                Text(
                  ano, //1707
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Container(
            height: 120,
            width: size.width * 0.6,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlueAccent.withOpacity(0.15),
                  offset: Offset(2, 2),
                  blurRadius: 10,
                ),
              ],
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  evento,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
