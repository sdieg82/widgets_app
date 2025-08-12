import 'package:flutter/material.dart';

const cards=<Map<String,dynamic>>[
  {'elevation':0.0, 'label':'Elevation 0'},
  {'elevation':1.0, 'label':'Elevation 1'},
  {'elevation':2.0, 'label':'Elevation 2'},
  {'elevation':3.0, 'label':'Elevation 3'},
  {'elevation':4.0, 'label':'Elevation 4'},
  {'elevation':5.0, 'label':'Elevation 5'},
  {'elevation':6.0, 'label':'Elevation 6'},
  {'elevation':7.0, 'label':'Elevation 7'},

];


class CardsScreen extends StatelessWidget {
  static const String name= 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Screen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          ...cards.map((e)=>(
            CardMapped(elevation: e['elevation'],label:e['label'])
          )),
           ...cards.map((e)=>(
            CardMapped2(elevation: e['elevation'],label:e['label'])
          ))
        ],
      ),
    );
  }
}

class CardMapped extends StatelessWidget {
  final String label;
  final double elevation;
  const CardMapped({
    super.key, 
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon:Icon(Icons.more_vert_outlined)
                )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class CardMapped2 extends StatelessWidget {
  final String label;
  final double elevation;
  const CardMapped2({
    super.key, 
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    final colors =Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon:Icon(Icons.more_vert_outlined)
                )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}



