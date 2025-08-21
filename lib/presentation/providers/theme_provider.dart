import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final isDarkModeProvider= StateProvider((ref)=>false);
final colorListProvider=StateProvider((ref)=> colorList);
final selectedColorProvider=StateProvider((ref)=> 0);
