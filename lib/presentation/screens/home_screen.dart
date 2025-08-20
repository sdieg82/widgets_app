import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';


class HomeScreen extends StatelessWidget {
  static const String name= 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final scaffoldKey=GlobalKey<ScaffoldState>( );

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Flutter + material 3')),
      body: _HomeView(),
       bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            
          ),
          BottomNavigationBarItem(
            label: 'Progress',
            icon: Icon(Icons.refresh_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings_outlined),
          ),
        ] ),
        drawer: SideMenu(scaffoldKey: scaffoldKey,)
    );
  }
}

class  _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItems = appMenuItems[index];
        return _CustomListTile(menuItems: menuItems);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItems});

  final MenuItem menuItems;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItems.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItems.title),
      subtitle: Text(menuItems.subTitle),
      onTap: () {
        context.push(menuItems.link);
      },
    );
  }
}
