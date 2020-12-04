import 'package:flutter/material.dart';

class homeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.2),
                  offset: Offset(2, 5),
                  blurRadius: 3,
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/images/Euler.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
