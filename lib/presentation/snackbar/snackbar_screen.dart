import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  
  void showSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Hola mundo desde mi metodo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){}),
      duration: Duration(seconds: 2),
    ));
  }


  static const name='snackbar_screen';
  const SnackbarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Snackbars'),
        ),
        body: _ViewSnackbar(),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Mostrar Snackbar'),
          icon: Icon(Icons.remove_red_eye_outlined),
          onPressed: (){
          showSnackBar(context);
        }),
      ),
    );
  }
}

class _ViewSnackbar extends StatelessWidget {
  const _ViewSnackbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}