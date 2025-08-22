import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  static const String name = 'theme_screen';
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final isDarkMode=ref.watch(themeNotifier).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme screen'),
        actions: [
           IconButton(
          onPressed: () {
            // ref.read(isDarkModeProvider.notifier).update((state)=> state=! state);
            ref.read(themeNotifier.notifier).toggleDarkMode();
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
  final int selectedColor=ref.watch(themeNotifier).selectedColor;
    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder:(context, index) {
        final color=colorList[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.r}'),
          value: index,
          groupValue: selectedColor,
          activeColor: color,
          onChanged: (value) {
            ref.watch(themeNotifier.notifier).changeColorTheme(index);
          },
        );
      },
    );
  }
}