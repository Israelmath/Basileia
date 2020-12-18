import 'package:basileia/models/dadoHistoricoModelo.dart';
import 'package:basileia/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InfoCard extends StatelessWidget {
  final Historia historia;

  InfoCard(this.historia);

  @override
  Widget build(BuildContext context) {
    final double espacamento = this.historia.tipoAcontecimento == 0 ? 16.0 : this.historia.tipoAcontecimento*16.0;
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: espacamento),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(myAssets[this.historia.tipoAcontecimento]),
                  width: 40,
                  height: 40,
                ),
                Text(
                  this.historia.localHist, //Basileia
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                Text(
                  historia.dataHist.year.toString(), //1707
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
            height: this.historia.tipoAcontecimento == 1 || this.historia.tipoAcontecimento == 0 ? 80 : 120,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(this.historia.titulo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  this.historia.tipoAcontecimento == 0 || this.historia.tipoAcontecimento == 1 ? "" : this.historia.descricao,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    'Fonte: ${this.historia.referencia}',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 8,
                    ),
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
