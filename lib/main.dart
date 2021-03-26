import "package:flutter/material.dart";
import "package:super_hero/super_hero.dart";

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My SuperHero Picker",
      home: SuperHeroNameGenerator(),
    );
  }
}

class SuperHeroNameGenerator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SuperHeroName();
}

class _SuperHeroName extends State<SuperHeroNameGenerator> {
  final _superHeroNames = <String>[];
  final _hearted = <String>{};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to my SuperHero Picker"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, i){
          if(i.isOdd){
            return Divider();
          }
          if(i ~/ 2 >= _superHeroNames.length){
            _superHeroNames.addAll(_generateSuperheroNames());
          }
          return _buildRow(_superHeroNames[i ~/ 2]);
        }
    );
  }

  Iterable<String> _generateSuperheroNames() {
    List<String> myNames = [
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
      SuperHero.random(),
    ];
    return myNames;
  }

  Widget _buildRow(String superHeroName) {
    return ListTile(
      title: Text(superHeroName)
    );
  }
}
