import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems=<MenuItem>[
   
   MenuItem(
    title:'Botones',
    subTitle: 'Varios botones en flutter',
    link:'/buttons' ,
    icon:Icons.smart_button_outlined 
   ),
   MenuItem(
    title:'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link:'/cards' ,
    icon:Icons.credit_card 
   ),
   MenuItem(
    title:'Progress Indicator',
    subTitle: 'Infinitos y controlados',
    link:'/progress',
    icon:Icons.refresh_rounded 
   ),
   MenuItem(
    title:'SnackBars & dialogs',
    subTitle: 'tipos de snackBars',
    link:'/snackbar',
    icon:Icons.abc
   ),
   MenuItem(
    title:'Animated',
    subTitle: 'Widgets animados',
    link:'/animated',
    icon:Icons.check_box_outline_blank_rounded
   ),
   MenuItem(
    title:'ui-controls & Tiles',
    subTitle: 'UI controls',
    link:'/ui-controls',
    icon:Icons.car_rental_outlined
   ),
   MenuItem(
    title:'App tutorial',
    subTitle: 'Tutorial de apps',
    link:'/tutorial',
    icon:Icons.accessible_rounded
   ),
   MenuItem(
    title:'Infinite scroll y Pull',
    subTitle: 'Listas infinitas',
    link:'/infinite',
    icon:Icons.list_alt_rounded
   ),
  
   
];