import 'package:app/livros.dart';
import 'package:app/segundatela.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PrimeiraPagina(title: 'Primeira Página'),
        '/segunda': (context) => const SegundaPagina(title: 'Segunda Página')
      },
    );
  }
}

class PrimeiraPagina extends StatefulWidget {
  const PrimeiraPagina({super.key, required this.title});

  final String title;

  @override
  State<PrimeiraPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<PrimeiraPagina> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (context, index) => Container(
          width: 100,
          height: 100,
          color: Colors.transparent,
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/segunda');
              },
              child: Expanded(
                child: Text(
                  livros[index].titulo!,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
