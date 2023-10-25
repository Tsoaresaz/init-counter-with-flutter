import 'package:flutter/material.dart';
import 'package:projeto_perguntas/shared/components/showDialogGeneric/showDialogGeneric.dart';
import 'package:projeto_perguntas/shared/components/buttons/buttonFloat.dart';
import 'package:projeto_perguntas/shared/widget/CurrentTimeWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World Flutter',
      theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(title: 'Contador Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[CurrentTimeWidget()],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Clique no botão para adicionar ou remover',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 36.0,
            right: 16.0,
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: buttonFloat(
                      context,
                      'Remover',
                      Icons.remove,
                      () {
                        if (_counter <= 0) {
                          _counter = 0;
                          showDialogGeneric(
                            context,
                            'Aviso',
                            'Não pode ter número menor que 0',
                          );
                          return;
                        }
                        _decrementCounter();
                      },
                    ),
                  ),
                  buttonFloat(
                    context,
                    'Adicionar',
                    Icons.add,
                    () {
                      if (_counter == 10) {
                        showDialogGeneric(context, 'Aviso',
                            'Não pode ter número maior que 10');
                        return;
                      }

                      _incrementCounter();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
