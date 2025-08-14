import 'package:flutter/material.dart';

class UicontrolsScreen extends StatelessWidget {
  static const name = 'uicontrols_screen';
  const UicontrolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI controls')),
      body: _UiView(),
    );
  }
}

class _UiView extends StatefulWidget {
  const _UiView({super.key});

  @override
  State<_UiView> createState() => _UiViewState();
}

enum Transportation { car, plane, boat, train }

class _UiViewState extends State<_UiView> {
  Transportation selectedTransportation = Transportation.car;

  bool isDeveloperMode = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          value: isDeveloperMode,
          onChanged:
              (value) => setState(() {
                isDeveloperMode = !isDeveloperMode;
              }),
        ),
        SizedBox(height: 10),

        CheckboxListTile(
          title: Text('Developer mode'),
          subtitle: Text('Subtitulo adicional'),
          value: isDeveloperMode,
          onChanged:
              (value) => setState(() {
                isDeveloperMode = !isDeveloperMode;
              }),
        ),

        ExpansionTile(
          title: Text('Vehículo de transporte'),
          subtitle: Text('Tranporte escogido $selectedTransportation'),
          children: [
            RadioListTile(
              title: Text('car'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: Text('train'),
              value: Transportation.train,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.train;
                });
              },
            ),
            RadioListTile(
              title: Text('plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: Text('boat'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
          ],
        ),
      
      
      ],
    );
  }
}
