import 'package:flutter/material.dart';
import 'package:imagine/api/cocoa.dart';
import 'package:imagine/api/cocoa_object.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Imagine App"),
        ),
      ),
      body: FutureBuilder(
        future: CocoaApi().getCocoa(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, index) =>
                          ViewList(cocoa: snapshot.data![index])),
                ),
              ],
            );
          } else {
            return Column();
          }
        },
      ),
    );
  }
}

class ViewList extends StatelessWidget {
  Cocoa cocoa;
  ViewList({Key? key, required this.cocoa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.indigo[300],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Column(
            children: [
              TextCocoa(data: 'Unnamed: 0 ' + cocoa.id),
              TextCocoa(data: 'Mes: ' + cocoa.mes),
              TextCocoa(data: 'Último: ' + cocoa.ultimo),
              TextCocoa(data: 'Var. :' + cocoa.variable.toString()),
              TextCocoa(data: 'Apertura: ' + cocoa.apertura.toString()),
              TextCocoa(data: 'Máximo: ' + cocoa.maximo.toString()),
              TextCocoa(data: 'Mínimo: ' + cocoa.minimo.toString()),
              TextCocoa(data: 'Volumen: ' + cocoa.volumen.toString()),
              TextCocoa(data: 'Hora: ' + cocoa.hora),
              TextCocoa(data: 'Gráfico: ' + cocoa.grafico)
            ],
          ),
        ),
      ),
    );
  }
}

class TextCocoa extends StatelessWidget {
  const TextCocoa({required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
    );
  }
}
