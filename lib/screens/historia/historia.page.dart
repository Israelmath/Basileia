import 'package:basileia/screens/backgrounds.dart';
import 'package:basileia/screens/historia/historia.controller.dart';
import 'package:basileia/screens/historia/localWidgets/basTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util.dart';

class HistoriaPage extends StatefulWidget {
  @override
  _HistoriaPageState createState() => _HistoriaPageState();
}

class _HistoriaPageState extends State<HistoriaPage> {
  HistoriaController historiaController = GetIt.I.get<HistoriaController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          ALBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.25,
                child: Stack(
                  children: <Widget>[
                    Observer(builder: (_) {
                      print(this.historiaController.imagem);
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.2),
                              offset: Offset(2, 5),
                              blurRadius: 3,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(this.historiaController.imagem),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                      );
                    }),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.4),
                              offset: Offset(2, 5),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        // padding: const EdgeInsets.only(top: 34.0, left: 8),
                        child: Text(
                          'Adicionar evento histórico',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) {
                    return Text(
                      this.historiaController.titulo,
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              BasTextField(
                onChanged: (_) => this.historiaController.atualizaTituloEvento(
                    this.historiaController.tituloController.text),
                controller: this.historiaController.tituloController,
                labelText: 'Título',
              ),
              SizedBox(height: 16),
              Observer(builder: (_) {
                return Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: DropdownButton(
                    hint: Text('Localização'),
                    dropdownColor: Colors.blue[400],
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white,
                    ),
                    onChanged: (paisEscolhido) => this
                        .historiaController
                        .atualizaPaisEscolhido(paisEscolhido),
                    value: this.historiaController.paisSelecionado,
                    items: this.historiaController.paises.map((pais) {
                      return DropdownMenuItem(
                          child: Text(
                            pais,
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          value: pais);
                    }).toList(),
                  ),
                );
              }),
              Container(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Observer(builder: (_) {
                      return FlatButton(
                        onPressed: () async {
                          showDatePicker(
                            context: context,
                            initialDate: this.historiaController.dataEvento,
                            firstDate: DateTime(0),
                            lastDate: DateTime.now(),
                          ).then((newDate) => this
                              .historiaController
                              .atualizaDataEvento(newDate));
                        },
                        child: Text(
                          '${this.historiaController.dataEvento.day} de ${traduzMes(this.historiaController.dataEvento.month)} de ${this.historiaController.dataEvento.year}',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: DropdownButton(
                        dropdownColor: Colors.blue[400],
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.white,
                        ),
                        onChanged: (tipoEscolhido) =>
                            this.historiaController.atualizaTipo(tipoEscolhido),
                        value: this.historiaController.tipoSelecionado,
                        items: this.historiaController.tipoEvento.map((pais) {
                          return DropdownMenuItem(
                              child: Text(
                                capitalize(pais),
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              value: pais);
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      child: Image.asset(myAssets[tipoEventoMap.keys.firstWhere(
                          (element) =>
                              tipoEventoMap[element] ==
                              this.historiaController.tipoSelecionado,
                          orElse: () => 0)]),
                      width: 40,
                      height: 40,
                    ),
                  ],
                );
              }),
              BasTextField(
                controller: this.historiaController.descricaoController,
                labelText: 'Descrição',
              ),
              BasTextField(
                controller: this.historiaController.referenciaController,
                labelText: 'Referência',
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  this.historiaController.processaSalvamento();
                  this.historiaController.salvaDadoHistorico();
                  this.historiaController.limpaCampos();
                  Navigator.pop(context);
                },
                child: Text('Cadastrar evento'),
              ),
              SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}
