import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  final String name='theme_screen';
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final isDarkMode=ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme screen'),
        actions: [
           IconButton(
          onPressed: () {
            ref.read(isDarkModeProvider.notifier).state=!isDarkMode;
          }, 
        // icon: Icon(Icons.dark_mode_outlined),
        icon: Icon(isDarkMode? Icons.dark_mode_outlined: Icons.light_mode_outlined),
          )
        ]
        ),
        body: _ViewThemesList(),
      );
  }
}

class _ViewThemesList extends ConsumerWidget {
  const _ViewThemesList({
    super.key,
  });

  @override
  Widget build(BuildContext context,ref) {
  final List<Color> colorList =ref.watch(colorListProvider);
    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder:(context, index) {
        final color=colorList[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          value: index,
          groupValue: 1,
          onChanged: (value) {
            //TODO notificar el cambio 
            ref.read(isDarkModeProvider.notifier).state=!ref.read(isDarkModeProvider);
          
          },
        );
      },
    );
  }
}