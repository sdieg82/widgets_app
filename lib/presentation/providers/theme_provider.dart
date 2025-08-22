import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final isDarkModeProvider= StateProvider((ref)=>false);
final colorListProvider=StateProvider((ref)=> colorList);
final selectedColorProvider=StateProvider((ref)=> 0);

//Un objeto de tipo APPTheme (custom)
 
 final themeNotifier=StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref)=>ThemeNotifier()
  );

 class ThemeNotifier extends StateNotifier<AppTheme>{
  // State= estado = new Apptheme
  ThemeNotifier():super(AppTheme());
  
 void toggleDarkMode(){
  state=state.copyWith(isDarkMode: !state.isDarkMode);
 }

void changeColorTheme(int color ){
  state=state.copyWith(selectedColor: color);
 }

 }

