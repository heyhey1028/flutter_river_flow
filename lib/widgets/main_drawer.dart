import 'package:flutter/material.dart';
import 'package:flutter_river_flow/main.dart';
import 'package:flutter_river_flow/screens/async_notifier_screen/async_notifier_screen.dart';
import 'package:flutter_river_flow/screens/async_value_notifier_screen/async_value_notifier_screen.dart';
import 'package:flutter_river_flow/screens/auth/auth_screen.dart';
import 'package:flutter_river_flow/screens/future_screen/future_screen.dart';
import 'package:flutter_river_flow/screens/notifier_screen/notifier_screen.dart';
import 'package:flutter_river_flow/screens/provider_screen/provider_screen.dart';
import 'package:flutter_river_flow/screens/stream_screen/stream_screen.dart';

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
                  const Text('FLUTTER RIVER FLOW'),
                ],
              ),
            ),
            DrawerTile(
              color: Colors.lightBlue[100]!,
              icon: const Icon(Icons.home),
              title: 'HOME',
              navigateTo: const MyHomePage(),
            ),
            DrawerTile(
              color: Colors.pink[100]!,
              icon: const Icon(Icons.home),
              title: 'AUTH EXAMPLE',
              navigateTo: AuthScreen(),
            ),
            DrawerTile(
              color: Colors.green[100]!,
              icon: const Icon(Icons.phone),
              title: 'NOTIFIER EXAMPLE',
              navigateTo: const NotifierScreen(),
            ),
            DrawerTile(
              color: Colors.lime[100]!,
              icon: const Icon(Icons.sync),
              title: 'NOTIFIER with AsyncValue',
              navigateTo: const AsyncValueNotifierScreen(),
            ),
            DrawerTile(
              color: Colors.purple[100]!,
              icon: const Icon(Icons.deck),
              title: 'ASYNC NOTIFIER EXAMPLE',
              navigateTo: const AsyncNotifierScreen(),
            ),
            DrawerTile(
              color: Colors.blue[100]!,
              icon: const Icon(Icons.nordic_walking),
              title: 'PROVIDER EXAMPLE',
              navigateTo: const ProviderScreen(),
            ),
            DrawerTile(
              color: Colors.brown[100]!,
              icon: const Icon(Icons.wallet),
              title: 'FUTURE PROVIDER EXAMPLE',
              navigateTo: const FutureScreen(),
            ),
            DrawerTile(
              color: Colors.yellow[100]!,
              icon: const Icon(Icons.stream),
              title: 'STREAM PROVIDER EXAMPLE',
              navigateTo: const StreamScreen(),
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
