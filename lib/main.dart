import 'package:flutter/material.dart';

void main() {
  runApp(FiberResources());
}

class FiberResources extends StatelessWidget {
  const FiberResources({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Fiberhome(),
    );
  }
}

class Fiberhome extends StatefulWidget {
  const Fiberhome({super.key});

  @override
  State<Fiberhome> createState() => _FiberhomeState();
}

class _FiberhomeState extends State<Fiberhome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: HomePage',
      style: optionStyle,
    ),
    Text(
      'Index 1: Dahsboard Page',
      style: optionStyle,
    ),
    Text(
      'Index 2: Course Page',
      style: optionStyle,
    ),
    Text(
      'Index 3: Register Page',
      style: optionStyle,
    ),
    Text(
      'Index 2: Login Page',
      style: optionStyle,
    ),
    Text(
      'Index 2: Course Page',
      style: optionStyle,
    ),
    Text(
      'Index 2: Notification Page',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile Page',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
        title: Text("FGL Study Resources"),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text("FGL Study Materials"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Dashboard'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Courses'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Register'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                _onItemTapped(3);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Login'),
              selected: _selectedIndex == 4,
              onTap: () {
                // Update the state of the app
                _onItemTapped(4);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          int mappedIndex = 0;
          if (index == 0) {
            mappedIndex = 0;
          } else if (index == 1) {
            mappedIndex = 1;
          } else if (index == 2) {
            mappedIndex = 6;
          } else if (index == 3) {
            mappedIndex = 7;
          }
          setState(() {
            _selectedIndex = mappedIndex;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: _selectedIndex == 0
            ? 0
            : _selectedIndex == 1
                ? 1
                : _selectedIndex == 6
                    ? 2
                    : 3,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
            selectedIcon: Icon(Icons.home_filled),
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
            selectedIcon: Icon(Icons.dashboard_customize_outlined),
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.notifications_sharp),
            ),
            label: "Notification",
            selectedIcon: Icon(Icons.space_dashboard_rounded),
          ),


          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profile",
            selectedIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
