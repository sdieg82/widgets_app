import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

    void openDialogo(BuildContext context){
      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (context) => AlertDialog(
          title: Text('Estás seguro ?'),
          content: Text('Hola'),
          actions: [
            TextButton(onPressed: () => context.pop(), child:Text('Cancelar')),
            FilledButton(onPressed:() => context.pop(), child:Text('Aceptar')),
          ],
        ),
    );
  }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(onPressed: (){
            showAboutDialog(
              context: context, 
              children: [
                const Text('Eu deserunt consectetur dolore consectetur nisi amet cupidatat occaecat ex fugiat. Consectetur in sint officia amet nostrud. Non est officia est duis laboris do adipisicing voluptate voluptate nostrud excepteur sit. Officia amet commodo proident nisi dolore non incididunt esse deserunt. Duis sint tempor pariatur tempor laborum nisi eiusmod. Enim ipsum consectetur excepteur ea consectetur.')
              ]
            );
          }, child: Text('Licencias used')),
          FilledButton(
            onPressed: () => {
              openDialogo(context)
            }, 
            child: const Text('Mostrar diálogo'))
        ],
      ),
      
    );
  }
}