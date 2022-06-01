import 'package:flutter/material.dart';
import 'package:flutter_river_flow/main.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    foregroundImage:
                        const AssetImage('assets/images/flutter_logo.png'),
                    radius: 50,
                  ),
                  const SizedBox(height: 16),
                  const Text('FLUTTER JUKE BOX'),
                ],
              ),
            ),
            DrawerTile(
              color: Colors.lightBlue[100]!,
              icon: const Icon(Icons.home),
              title: 'HOME',
              navigateTo: const MyHomePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.navigateTo,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final Color color;
  final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: color,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => navigateTo,
            ),
          );
        },
      ),
    );
  }
}
