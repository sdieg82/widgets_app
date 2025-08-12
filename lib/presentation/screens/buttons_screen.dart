import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name= 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: _Buttons_view(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_outlined),
      )
    );
  }
}

class _Buttons_view extends StatelessWidget {
  const _Buttons_view({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Wrap(
          spacing: 15,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
           children: [
            ElevatedButton(onPressed: (){}, child: Text('Elevated button')),
            ElevatedButton(onPressed: null, child: Text('Disabled button')),
            FilledButton.icon(onPressed: (){}, 
            icon:Icon(Icons.alarm_add_outlined),
            label: Text('Filled button')),
            OutlinedButton(onPressed: (){}, child: Text('Outlined Button')),
            TextButton(onPressed: (){}, child: Text('text button')),
            OutlinedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.terminal), 
              label: Text('terminal ')),
              //TODO custom button 
              
           ],
        ),
      ),
    );
  }
}