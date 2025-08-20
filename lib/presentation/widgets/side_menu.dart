import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex=0;

  @override
  Widget build(BuildContext context) {
    final hasNoctch=MediaQuery.of(context).viewPadding.top>35;
    if (Platform.isAndroid) {
      print('Android $hasNoctch');    
    }else{
      print('Is IOS $hasNoctch' );
    }
    return NavigationDrawer(
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex=value;
        });
      final menuItem=appMenuItems[value];
      context.push(
        menuItem.link
      );
       widget.scaffoldKey.currentState?.closeDrawer();
      },
      selectedIndex: navDrawerIndex,
      children:[
        Padding(
          padding:EdgeInsets.fromLTRB(28, hasNoctch? 0: 20, 16, 10),
          child: Text('Menú', ),
        ),
        Divider(),
        ...appMenuItems
        .sublist(0,3)
        .map((e)=> 
        NavigationDrawerDestination(
          icon: Icon(e.icon), 
          label: Text(e.title),
        )),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        Padding(
           padding:EdgeInsets.fromLTRB(28, hasNoctch? 0: 20, 16, 10),
          child: Text('Otras opciones', ),
        ),

         Divider(),
        ...appMenuItems
        .sublist(3)
        .map((e)=> 
        NavigationDrawerDestination(
          icon: Icon(e.icon), 
          label: Text(e.title),
        )),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        )


      ] 
    );
  }
}