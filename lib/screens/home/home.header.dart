import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'home.controller.dart';

class homeHeader extends StatelessWidget {
  HomeController homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
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
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  offset: Offset(2, 5),
                  blurRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 34.0, left: 8),
            child: Text(
              'Basileia',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Ubuntu'
              ),
            ),
          ),
        ],
      ),
    );
  }
}
