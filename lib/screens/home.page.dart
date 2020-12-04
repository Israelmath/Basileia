import 'package:basileia/util.dart';
import 'package:basileia/widgets/info.card.dart';
import 'package:flutter/material.dart';

import 'headers/home.header.dart';

class Home extends StatelessWidget {
  final MyAssets assets = MyAssets();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        homeHeader(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Leonhard Paul Euler',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 24,
            ),
          ),
        ),
        InfoCard(
          iconLeft: assets.birth,
          localidade: 'Basileia',
          ano: '1707',
          evento: 'Nascimento de \nLeonhard Paul Euler\n\n15 de Abril de 1707',
        ),
      ],
    );
  }
}
